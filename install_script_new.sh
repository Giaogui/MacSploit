#!/bin/bash

main() {
    echo -e "Downloading MacSploit"
    curl -O "https://raw.githubusercontent.com/Giaogui/MacSploit/main/main.c"


    echo -e "Patching Roblox"
    mv ./macsploit.dylib "/Applications/Roblox.app/Contents/MacOS/macsploit.dylib"
    ./insert_dylib "/Applications/Roblox.app/Contents/MacOS/macsploit.dylib" "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer" --strip-codesig --all-yes
    mv "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer_patched" "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer"
    rm ./insert_dylib

    echo -e "Installing MacSploit App"
    [ -d "/Applications/MacSploit.app" ] && rm -rf "/Applications/MacSploit.app"
    mv ./MacSploit.app /Applications/MacSploit.app
    rm ./MacSploit.zip

    echo -e "Install Complete! Developed by Nexus42!"
}

main
