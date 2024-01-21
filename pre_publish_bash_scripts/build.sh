#!/bin/bash

# Run flutter clean
flutter clean
if [ $? -ne 0 ]; then
  echo "Error: flutter clean failed."
  exit 1
fi

# Run flutter pub get
flutter pub get
if [ $? -ne 0 ]; then
  echo "Error: flutter pub get failed."
  exit 1
fi

# Run flutter build appbundle
flutter build appbundle
if [ $? -ne 0 ]; then
  echo "Error: flutter build appbundle failed."
  exit 1
fi

echo "All commands executed successfully."
