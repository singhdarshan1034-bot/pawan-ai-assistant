import 'package:flutter/material.dart';
import '../models/ai_response.dart';
import '../services/ai_service.dart';
import '../services/speech_service.dart';

class PawanProvider extends ChangeNotifier {
  final AIService _aiService = AIService();
  final SpeechService _speechService = SpeechService();

  List<AIResponse> _conversationHistory = [];
  String _currentTranscription = '';
  bool _isListening = false;
  bool _isProcessing = false;
  String? _errorMessage;
  String _userPreference = 'default';

  // Getters
  List<AIResponse> get conversationHistory => _conversationHistory;
  String get currentTranscription => _currentTranscription;
  bool get isListening => _isListening;
  bool get isProcessing => _isProcessing;
  String? get errorMessage => _errorMessage;
  String get userPreference => _userPreference;

  PawanProvider() {
    _initialize();
  }

  Future<void> _initialize() async {
    await _speechService.initialize();
  }

  Future<void> startListening() async {
    _isListening = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _speechService.startListening(
        onResult: (text) {
          _currentTranscription = text;
          notifyListeners();
        },
      );
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isListening = false;
      notifyListeners();
    }
  }

  Future<void> stopListening() async {
    await _speechService.stopListening();
    _isListening = false;
    notifyListeners();
  }

  Future<void> processUserInput(String userMessage) async {
    _isProcessing = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _aiService.getResponse(userMessage);
      _conversationHistory.add(response);
      await _speechService.speak(response.text);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isProcessing = false;
      notifyListeners();
    }
  }

  void clearHistory() {
    _conversationHistory.clear();
    _currentTranscription = '';
    notifyListeners();
  }

  void setUserPreference(String preference) {
    _userPreference = preference;
    notifyListeners();
  }
}