
# Sign all dylibs
echo -e "\n\n[+] Codesigning dylibs..."
sleep 1
# ldid sign all dylibs... will have 2 error messages for . and .. which is ok
for i in `ls -a ./dylibs | sed s#\*##g`; do ldid -S "./dylibs/$i"; done 

# Install RetroArch emulator
echo "[+] Installing retroarch through IPAInstaller..."
ipainstaller retroarch.ipa || { echo "[!] WARNING: Failed to install IPA. Possibly retry running the script"; exit 1; }


echo "[+] Transferring dylibs to retroarch folder..."
cp -rn dylibs/* /private/var/mobile/Containers/Data/Application/*/Documents/RetroArch/cores

echo "[*] DONE! Try opening retroarch now:"
echo "  1. Tap Retroarch icon"
echo "  2. Tap Online Updater and tap to update EACH of the list EXCEPT for 'Core Updater' (give maybe 10 seconds between each line)"
echo "  3. Ready to play!"
echo "  4. Main Menu -> Load Content -> Navigate in the file menu to choose your ROMs!"
echo ""
echo "[*] THANKS have a nice day"
