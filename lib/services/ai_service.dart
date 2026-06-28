import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/ai_response.dart';

class AIService {
  // Get API key from: https://makersuite.google.com/app/apikey
  static const String _apiKey = 'YOUR_GOOGLE_GEMINI_API_KEY';
  static const String _baseUrl = 'https://generativelanguage.googleapis.com/v1beta/models';

  Future<AIResponse> getResponse(String userMessage) async {
    final url = '$_baseUrl/gemini-pro:generateContent?key=$_apiKey';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'contents': [
            {
              'parts': [
                {'text': userMessage}
              ]
            }
          ]
        }),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final text = jsonData['candidates'][0]['content']['parts'][0]['text'] ?? 'No response';
        
        return AIResponse(
          text: text,
          userMessage: userMessage,
          timestamp: DateTime.now(),
        );
      } else {
        throw 'Failed to get AI response: ${response.statusCode}';
      }
    } catch (e) {
      throw 'Error: $e';
    }
  }
}
