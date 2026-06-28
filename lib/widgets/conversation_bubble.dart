import 'package:flutter/material.dart';
import '../models/ai_response.dart';

class ConversationBubble extends StatelessWidget {
  final AIResponse response;

  const ConversationBubble({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // User Message
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            response.userMessage,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        // AI Response
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                response.text,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 4),
              Text(
                '${response.timestamp.hour}:${response.timestamp.minute.toString().padLeft(2, '0')}',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}