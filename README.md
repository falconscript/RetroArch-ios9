# RetroArch-ios9
Installation script to run on iPhone to install RetroArch on iOS 9.



Script must be run ON the iPhone. Must have installed from Cydia:
 - ipainstaller - For installing the Retroarch IPA
 - ldid - the first letter is a lower case L, for codesigning the dylibs
 - unzip - Unzipping my .zip file on the phone
 - wget - for retrieving files
 - git - only used to check out repository. You can SCP the script instead.

To run on your phone, install git through cydia, then open a terminal on your phone:
- git clone https://github.com/falconscript/RetroArch-ios9.git
- chmod 777 ./RetroArch-ios9/install-ra-ios9.sh
- ./RetroArch-ios9/install-ra-ios9.sh


If you have AT&T internet, the wgets may fail due to them blocking my host sometimes... File an issue if that happens
