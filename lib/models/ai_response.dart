class AIResponse {
  final String text;
  final String userMessage;
  final DateTime timestamp;
  final String? actionType; // call, sms, search, etc.
  final Map<String, dynamic>? actionData;

  AIResponse({
    required this.text,
    required this.userMessage,
    required this.timestamp,
    this.actionType,
    this.actionData,
  });

  factory AIResponse.fromJson(Map<String, dynamic> json) {
    return AIResponse(
      text: json['text'] ?? '',
      userMessage: json['userMessage'] ?? '',
      timestamp: DateTime.parse(json['timestamp'] ?? DateTime.now().toIso8601String()),
      actionType: json['actionType'],
      actionData: json['actionData'],
    );
  }

  Map<String, dynamic> toJson() => {
    'text': text,
    'userMessage': userMessage,
    'timestamp': timestamp.toIso8601String(),
    'actionType': actionType,
    'actionData': actionData,
  };
}