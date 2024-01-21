#!/bin/bash

build_gradle_path="android/app/build.gradle"
code_snippet1="def keystoreProperties = new Properties()\ndef keystorePropertiesFile = rootProject.file('key.properties')\nif (keystorePropertiesFile.exists()) {\n    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))\n}"
code_snippet2="signingConfigs {\n    release {\n        keyAlias keystoreProperties['keyAlias']\n        keyPassword keystoreProperties['keyPassword']\n        storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null\n        storePassword keystoreProperties['storePassword']\n    }\n}"
replacement_string="signingConfigs.release"

# Check if build.gradle file exists
if [ -f "$build_gradle_path" ]; then
  # Check if code snippet 1 already exists
  if grep -qF "$code_snippet1" "$build_gradle_path"; then
    echo "Code snippet 1 already exists. Skipping insertion."
  else
    # Insert code snippet 1 above android { } block
    sed -i '/android {/i\'$'\n'"$code_snippet1"$'\n' "$build_gradle_path"
    echo "Code snippet 1 inserted successfully."
  fi

  # Check if code snippet 2 already exists
  if grep -qzoP "(?s)\\Q$code_snippet2\\E(?=\\n\\nbuildTypes \\{)" "$build_gradle_path"; then
    echo "Code snippet 2 already exists. Skipping insertion."
  else
    # Insert code snippet 2 above buildTypes { } block
    sed -i '/buildTypes {/i\'$'\n'"$code_snippet2"$'\n' "$build_gradle_path"
    echo "Code snippet 2 inserted successfully."
  fi

  # Replace signingConfigs.debug with signingConfigs.release
  sed -i 's/signingConfigs.debug/signingConfigs.release/g' "$build_gradle_path"
  echo "Replaced signingConfigs.debug with signingConfigs.release."
else
  echo "build.gradle file not found."
fi
