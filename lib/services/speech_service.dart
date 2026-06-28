import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SpeechService {
  final SpeechToText _speechToText = SpeechToText();
  final FlutterTts _flutterTts = FlutterTts();
  bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) return;
    
    try {
      _isInitialized = await _speechToText.initialize(
        onError: (error) => print('Error: $error'),
        onStatus: (status) => print('Status: $status'),
      );
      
      await _flutterTts.setLanguage('en-US');
      await _flutterTts.setPitch(1.0);
      await _flutterTts.setSpeechRate(0.5);
    } catch (e) {
      print('Error initializing speech: $e');
    }
  }

  Future<void> startListening({required Function(String) onResult}) async {
    if (!_isInitialized) await initialize();

    if (!_speechToText.isListening) {
      await _speechToText.listen(
        onResult: (result) {
          onResult(result.recognizedWords);
        },
      );
    }
  }

  Future<void> stopListening() async {
    if (_speechToText.isListening) {
      await _speechToText.stop();
    }
  }

  Future<void> speak(String text) async {
    await _flutterTts.speak(text);
  }

  Future<void> stop() async {
    await _flutterTts.stop();
  }
}
