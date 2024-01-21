#!/bin/bash

# Add Flutter package 'rename'
flutter pub add rename
flutter pub global activate rename

# Ask user for the app name
read -p "Enter the name of the app: " name_holder

# Validate the input and prompt again if it's empty
while [[ -z "$name_holder" ]]; do
    read -p "App name cannot be empty. Please enter the name of the app: " name_holder
done

# Replace the placeholder with the entered app name
flutter pub global run rename --appname "$name_holder"

# Ask user if they want to enter the bundle identifier
read -p "Do you want to enter the bundle identifier? (y/n): " enter_bundle_id

if [[ $enter_bundle_id =~ ^[Yy]$ ]]; then
    # Ask user for the bundle identifier
    read -p "Enter the bundle identifier (e.g., com.MYWEBDOMAIN.PROJECTNAME): " bundle_id

    # Validate the input and prompt again if it's empty
    while [[ -z "$bundle_id" ]]; do
        read -p "Bundle identifier cannot be empty. Please enter the bundle identifier: " bundle_id
    done

    # Run the rename command with the provided bundle identifier
    flutter pub global run rename --bundleId "$bundle_id"
else
    echo "Skipping bundle identifier entry."
fi
