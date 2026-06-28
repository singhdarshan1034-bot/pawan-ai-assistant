import 'package:flutter/material.dart';

class MicButton extends StatelessWidget {
  final bool isListening;
  final bool isProcessing;
  final VoidCallback onPress;

  const MicButton({
    super.key,
    required this.isListening,
    required this.isProcessing,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: isProcessing ? null : onPress,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isListening ? Colors.red : Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: (isListening ? Colors.red : Theme.of(context).primaryColor)
                  .withOpacity(0.3),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: isProcessing
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                )
              : Icon(
                  isListening ? Icons.mic : Icons.mic_none,
                  color: Colors.white,
                  size: 24,
                ),
        ),
      ),
    );
  }
}