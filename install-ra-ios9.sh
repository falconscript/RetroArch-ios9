# HOST is where the necessary files are stored
HOST=http://cfalcon.webege.com


wget --no-check-certificate "$HOST/ios.zip" # A zip of necessary dylib files
wget --no-check-certificate "$HOST/retroarch.ipa" # Has been ldid signed already


echo "[+] Unzipping..."
sleep 1
unzip ios.zip


# Sign all dylibs
echo -e "\n\n[+] Codesigning dylibs..."
sleep 1
# ldid sign all dylibs... will have 2 error messages for . and .. which is ok
for i in `ls -a ./ios | sed s#\*##g`; do ldid -S "./ios/$i"; done 

# Install RetroArch emulator
echo "[+] Installing retroarch from dpkg..."
ipainstaller retroarch.ipa
echo "[?] Were there any errors? Hit CTRL+C to cancel or enter to continue..."
read a


echo "[+] Transferring dylibs to retroarch folder..."
cp -rn ios/* cp -rn ios/* /private/var/mobile/Containers/Data/Application/*/Documents/RetroArch/cores

echo "[*] DONE! Try opening retroarch now:"
echo "  1. Tap Retroarch icon"
echo "  2. Tap Online Updater and tap to update EACH of the list EXCEPT for 'Core Updater' (give maybe 10 seconds between each line)"
echo "  3. Ready to play!"
echo "  4. Main Menu -> Load Content -> Navigate in the file menu to choose your ROMs!"
echo ""
echo "[*] THANKS have a nice day"
