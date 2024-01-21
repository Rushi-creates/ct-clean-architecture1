#!/bin/bash

manifest_file="android/app/src/main/AndroidManifest.xml"

# Prompt user for adding internet permissions
read -p "Do you want to add internet permissions to the AndroidManifest.xml file? (y/n): " add_permissions

if [[ $add_permissions =~ ^[Yy]$ ]]; then
    # Check if the permissions are already present in the file
    if grep -q -E '(<uses-permission android:name="android.permission.INTERNET" \/>|<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" \/>)' "$manifest_file"; then
        echo "Internet permissions are already present in the AndroidManifest.xml file. Skipping."
    else
        # Add the permissions if they are not already present
        permissions_added=0

        if ! grep -q '<uses-permission android:name="android.permission.INTERNET" />' "$manifest_file"; then
            sed -i '/<manifest xmlns:android="http:\/\/schemas.android.com\/apk\/res\/android">/a \
    <uses-permission android:name="android.permission.INTERNET" />' "$manifest_file"
            permissions_added=1
        fi

        if ! grep -q '<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />' "$manifest_file"; then
            sed -i '/<manifest xmlns:android="http:\/\/schemas.android.com\/apk\/res\/android">/a \
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />' "$manifest_file"
            permissions_added=1
        fi

        if [[ $permissions_added -eq 1 ]]; then
            echo "Internet permissions added to the AndroidManifest.xml file."
        else
            echo "No permissions added. They are already present in the AndroidManifest.xml file."
        fi
    fi
else
    echo "Skipping internet permissions addition."
fi
