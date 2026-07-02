# Pawan AI Assistant - APK Build Guide

## Quick Start

### Step 1: Get Dependencies
```bash
flutter pub get
```

### Step 2: Build Release APK
```bash
flutter build apk --release
```

**Output location:**
```
build/app/outputs/flutter-app/release/app-release.apk
```

---

## Build Options

### Build Debug APK (for testing)
```bash
flutter build apk --debug
```
Output: `build/app/outputs/flutter-app/debug/app-debug.apk`

### Build Split APKs (smaller file sizes per architecture)
```bash
flutter build apk --release --split-per-abi
```
Output: `build/app/outputs/flutter-app/release/app-*-release.apk`

### Build Specific Architecture
```bash
flutter build apk --release --target-platform android-arm64
```

### Clean Build
```bash
flutter clean
flutter pub get
flutter build apk --release
```

---

## Configuration Files

### Android Manifest (`android/app/src/main/AndroidManifest.xml`)
Includes all required permissions for:
- Voice recognition (microphone access)
- AI integration (internet)
- Device control (flashlight, vibration)
- Contacts & communication (calling, SMS)
- Media & camera access
- Sensor access

### Build Gradle (`android/app/build.gradle`)
- **compileSdkVersion:** 34
- **minSdkVersion:** 21 (Android 5.0+)
- **targetSdkVersion:** 34
- **Java Version:** 11
- **Code Shrinking:** Enabled (minifyEnabled)
- **Resource Shrinking:** Enabled (shrinkResources)

### ProGuard Rules (`android/app/proguard-rules.pro`)
- Preserves Flutter classes
- Keeps critical dependencies (Picovoice, Speech-to-Text, TTS)
- Optimizes code while maintaining functionality

---

## Prerequisites

Ensure you have:
1. **Flutter SDK** (>=3.16.0)
2. **Android SDK** with API Level 34
3. **Java Development Kit** (JDK 11+)
4. **Android Gradle Plugin** configured

---

## Troubleshooting

### Build Fails
```bash
flutter clean
flutter pub get
flutter build apk --release
```

### Gradle Issues
Check your `android/local.properties` file includes:
```properties
sdk.dir=/path/to/android/sdk
flutter.sdk=/path/to/flutter
```

### Dependency Errors
Update dependencies:
```bash
flutter pub upgrade
```

### APK Installation Issues
Test with debug APK first:
```bash
flutter install --debug
```

---

## APK Signing (Optional for Distribution)

For production release, sign your APK:

1. **Create a keystore:**
```bash
keytool -genkey -v -keystore ~/pawan-key.jks -keyalg RSA -keysize 2048 -validity 10000
```

2. **Create `android/key.properties`:**
```properties
storePassword=<your_store_password>
keyPassword=<your_key_password>
keyAlias=pawan-key
storeFile=/path/to/pawan-key.jks
```

3. **Build signed release APK:**
```bash
flutter build apk --release
```

---

## App Information

- **Package Name:** com.example.pawan_ai_assistant
- **Min SDK:** 21 (Android 5.0+)
- **Target SDK:** 34 (Android 14)
- **Architecture Support:** ARM64, ARMv7, x86_64

---

For more information, visit: https://flutter.dev/docs/deployment/android
