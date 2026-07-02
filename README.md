# Pawan AI Assistant 🤖

Your personal Jarvis-like voice assistant for Android with Ghost Rider theme, Google Gemini AI integration, offline mode, and 40+ features.

## ✨ Features

### 🎙️ Voice Control
- Real-time speech-to-text recognition
- Natural language processing with Google Gemini AI
- Text-to-speech responses
- Wake word detection ("Hey Pawan")
- Audio visualization and waveform display

### 🧠 AI Integration
- Google Gemini API for intelligent responses
- Context-aware conversations
- Smart command recognition
- Multi-language support

### 📱 Device Control (40+ Features)
- **Calls**: Make calls, check history
- **SMS**: Send/receive messages
- **Contacts**: Search and manage contacts
- **Camera**: Take photos/videos
- **Flashlight**: Toggle torch/flashlight
- **Settings**: Quick access to device settings
- **WiFi/Bluetooth**: Control connectivity
- **Display**: Adjust brightness and orientation
- **Audio**: Control volume levels
- **Battery**: Check battery status
- **Location**: GPS location services
- **Calendar**: Schedule events
- **Reminders**: Set voice reminders
- **Music**: Control playback
- **Screen**: Lock/unlock device

### 🎨 UI/UX
- Ghost Rider theme (Dark mode with orange/gold accents)
- Smooth animations and transitions
- Real-time conversation display
- Responsive design
- Intuitive voice command interface

### 🔐 Security & Privacy
- Local processing support
- Permission handling
- Secure API communication
- Privacy-focused design

## 🚀 Getting Started

### Prerequisites
- Flutter 3.16.0 or higher
- Android SDK 21 or higher
- Google Gemini API key

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/pawan-ai-assistant.git
   cd pawan-ai-assistant
   ```

2. **Get your Google Gemini API key**
   - Visit: https://makersuite.google.com/app/apikey
   - Create a new API key
   - Copy the key

3. **Add your API key**
   - Open `lib/services/ai_service.dart`
   - Replace `AQ.Ab8RN6Kn_D_v92OLQyG_2hJcApiYzYiwb_aTcCzSFzqat0VWng` with your actual key
   ```dart
   static const String _apiKey = 'AQ.Ab8RN6Kn_D_v92OLQyG_2hJcApiYzYiwb_aTcCzSFzqat0VWng';
   ```

4. **Install dependencies**
   ```bash
   flutter pub get
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry point
├── providers/
│   └── pawan_provider.dart     # State management
├── models/
│   └── ai_response.dart        # Response model
├── services/
│   ├── ai_service.dart         # Gemini API integration
│   └── speech_service.dart     # Voice control
├── screens/
│   └── home_screen.dart        # Main UI
├── widgets/
│   ├── conversation_bubble.dart # Message display
│   └── mic_button.dart         # Voice button
└── utils/
    └── theme.dart              # Theme configuration
```

## 🛠️ Configuration

### API Setup
1. Get API key from Google Gemini
2. Update `lib/services/ai_service.dart`
3. Set your API key in the `AQ.Ab8RN6Kn_D_v92OLQyG_2hJcApiYzYiwb_aTcCzSFzqat0VWng` constant

### Permissions
The app requires:
- Microphone access
- Phone permissions
- Contact access
- Camera access
- Location access
- SMS access

### Theme Customization
Edit `lib/utils/theme.dart` to customize:
- Colors
- Typography
- Button styles
- Card designs

## 📦 Dependencies

### Core
- `speech_to_text`: Voice input
- `flutter_tts`: Text-to-speech
- `http`: API communication
- `provider`: State management

### UI/UX
- `lottie`: Animations
- `google_fonts`: Typography
- `animated_text_kit`: Text effects
- `shimmer`: Loading effects

### Device Integration
- `permission_handler`: Permission management
- `torch_controller`: Flashlight control
- `url_launcher`: App launching
- `app_settings`: System settings
- `contacts_service`: Contact management
- `telephony`: Phone/SMS control
- `connectivity_plus`: Network status
- `sensors_plus`: Device sensors
- `battery_plus`: Battery info

## 🎯 Usage

### Voice Commands
- "Hey Pawan" - Activate voice mode
- "Call [contact name]" - Make a call
- "Send message to [contact]" - Send SMS
- "Take a photo" - Capture image
- "What's the weather?" - Get weather info
- "Set a reminder" - Create reminder
- "Turn on flashlight" - Toggle torch
- "What time is it?" - Get current time
- "Open [app name]" - Launch app
- "Battery status" - Check battery

### Text Input
- Type directly in the input field
- Press Enter to send
- Long press microphone to start voice input

## 🔨 Building for Release

### Android APK
```bash
flutter build apk --release
```

### Android App Bundle
```bash
flutter build appbundle --release
```

### Signed APK
```bash
flutter build apk --release --verbose
```

## 🐛 Troubleshooting

### Voice not working
- Check microphone permissions
- Ensure internet connection
- Verify speech-to-text is available for your language

### API not responding
- Check your API key
- Verify internet connection
- Check API quota and rate limits

### Permissions denied
- Grant permissions in app settings
- Reinstall app
- Check Android manifest

## 📚 API Documentation

### Google Gemini API
- [Documentation](https://ai.google.dev/)
- [API Reference](https://ai.google.dev/api)

### Speech to Text
- [speech_to_text docs](https://pub.dev/packages/speech_to_text)

### Flutter TTS
- [flutter_tts docs](https://pub.dev/packages/flutter_tts)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- Google Gemini API for AI capabilities
- Flutter community for excellent packages
- All contributors and testers

## 📞 Support

For issues, questions, or suggestions, please open a GitHub issue.

---

**Built with ❤️ using Flutter | Powered by Google Gemini**
