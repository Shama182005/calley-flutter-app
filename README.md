# Callley Flutter App

A single-file Flutter UI prototype for the Callley automatic call dialer assessment.

## Project structure

- `lib/main.dart` — app UI and screen navigation
- `pubspec.yaml` — Flutter package configuration
- `.gitignore` — ignores generated/build and local IDE files

## Run locally

1. Install Flutter and Android Studio/Xcode as appropriate.
2. From this directory, run:

   ```bash
   flutter pub get
   flutter run
   ```

3. To build an Android debug APK:

   ```bash
   flutter build apk --debug
   ```

The APK is generated at `build/app/outputs/flutter-apk/app-debug.apk`.

## Important notes

- This is a UI prototype. Authentication, OTP verification, and calling-list actions use demo behavior/placeholders; the live API endpoints still need to be integrated and tested.
- The source has not been compiled in this environment. Run it locally and resolve any Flutter SDK/compiler issues before submitting.
- Do not commit API keys, passwords, OTPs, or other secrets.
