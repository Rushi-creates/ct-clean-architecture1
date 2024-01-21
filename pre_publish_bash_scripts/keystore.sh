#!/bin/bash

# Function to prompt the user for the keystore password
function prompt_password() {
  read -p "Enter the keystore password (you can use https://passwordsgenerator.net/): " keystore_password
}

# Keep prompting for password until a value is entered
while [[ -z $keystore_password ]]; do
  prompt_password
done

# Create the key.properties file if it doesn't exist
if [[ ! -f "android/key.properties" ]]; then
    cat > android/key.properties << EOF
storePassword=$keystore_password
keyPassword=$keystore_password
keyAlias=mykeystore
storeFile=../app/keystore.jks
EOF
    echo "key.properties created."
else
    echo "key.properties already exists. Skipping creation."
fi

# Run the keytool command with the provided password if keystore.jks doesn't exist
if [[ ! -f "android/app/keystore.jks" ]]; then
    yes | keytool -genkey -v -keystore android/app/keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 100000 -alias mykeystore -keypass "$keystore_password" -storepass "$keystore_password"
    echo "Keystore generated successfully."
else
    echo "keystore.jks already exists. Skipping keystore generation."
fi

# Add key.properties and app/keystore.jks to .gitignore if the entries don't exist
if ! grep -Fxq "android/key.properties" .gitignore; then
    echo "android/key.properties" >> .gitignore
    echo "Added key.properties to .gitignore."
else
    echo "key.properties already present in .gitignore. Skipping."
fi

if ! grep -Fxq "android/app/keystore.jks" .gitignore; then
    echo "android/app/keystore.jks" >> .gitignore
    echo "Added app/keystore.jks to .gitignore."
else
    echo "app/keystore.jks already present in .gitignore. Skipping."
fi
