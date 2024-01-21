#!/bin/bash

file_path="$(dirname "$(dirname "$0")")/pubspec.yaml"  # Use the current script's directory to locate pubspec.yaml

content_to_paste="

flutter_launcher_icons:
  android: \"launcher_icon\"
  ios: false
  image_path: \"assets/icon/icon.png\"
  min_sdk_android: 21"

# Run the command to add flutter_launcher_icons as a dev dependency
flutter pub add --dev flutter_launcher_icons

# Check the exit status of the previous command
if [ $? -eq 0 ]; then
    echo "flutter_launcher_icons added as a dev dependency."

    # Append the content to the file
    echo "$content_to_paste" >> "$file_path"

    # Check if the content was successfully pasted
    if [ $? -eq 0 ]; then
        echo "Content has been pasted into $file_path."

        # Run the command to get dependencies
        flutter pub get

        # Check the exit status of the previous command
        if [ $? -eq 0 ]; then
            echo "Dependencies fetched successfully."

            # Run the command to generate launcher icons
            dart run flutter_launcher_icons

            # Check the exit status of the previous command
            if [ $? -eq 0 ]; then
                echo "Launcher icons generated successfully."
            else
                echo "Error generating launcher icons."
            fi
        else
            echo "Error fetching dependencies."
        fi
    else
        echo "Error pasting the content into $file_path."
    fi
else
    echo "Error adding flutter_launcher_icons as a dev dependency."
fi
