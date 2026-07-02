# Flutter
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Your app
-keepclasseswithmembernames class * {
    native <methods>;
}

# Keep permissions
-keep class * extends android.app.Service { *; }
-keep class * extends android.content.BroadcastReceiver { *; }

# Picovoice (Wake Word Detection)
-keep class com.picovoice.** { *; }

# Speech to Text & TTS
-keep class com.google.android.** { *; }
