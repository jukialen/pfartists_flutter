#!/bin/bash

# Load environment variables from .env file
set -a
source .env
set +a

# Generate Info.plist with environment variables
cat <<EOF > ios/Runner/Info.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleName</key>
    <string>$PRODUCT_NAME</string>
    <key>CFBundleIdentifier</key>
    <string>$PRODUCT_BUNDLE_IDENTIFIER</string>
    <key>CFBundleExecutable</key>
    <string>Runner</string>
    <key>CFBundleVersion</key>
    <string>1.0.0</string>
    <key>CFBundleShortVersionString</key>
    <string>1.0.0</string>
    <key>CFBundleURLTypes</key>
    <array>
        <dict>
            <key>CFBundleTypeRole</key>
            <string>Editor</string>
            <key>CFBundleURLSchemes</key>
            <array>
                <string>$REVERSED_CLIENT_ID</string>
            </array>
        </dict>
    </array>
    <key>keychain-access-groups</key>
    <array>
        <string>$REVERSED_CLIENT_ID</string>
    </array>
    <!-- Other keys and values -->
</dict>
</plist>
EOF