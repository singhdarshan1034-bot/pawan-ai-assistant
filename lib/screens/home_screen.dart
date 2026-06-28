import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pawan_provider.dart';
import '../widgets/conversation_bubble.dart';
import '../widgets/mic_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pawan AI Assistant'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Consumer<PawanProvider>(
        builder: (context, provider, _) {
          return Column(
            children: [
              // Conversation History
              Expanded(
                child: provider.conversationHistory.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.assistant,
                              size: 80,
                              color: Colors.grey[700],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Hey! I\'m Pawan',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Your AI Assistant',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey,
                                  ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(16),
                        itemCount: provider.conversationHistory.length,
                        itemBuilder: (context, index) {
                          return ConversationBubble(
                            response: provider.conversationHistory[index],
                          );
                        },
                      ),
              ),
              // Input Area
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    if (provider.errorMessage != null)
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.red),
                        ),
                        child: Text(
                          provider.errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _textController,
                            decoration: InputDecoration(
                              hintText: 'Type or speak...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
                            onSubmitted: (value) {
                              if (value.isNotEmpty && !provider.isProcessing) {
                                provider.processUserInput(value);
                                _textController.clear();
                                _scrollToBottom();
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        MicButton(
                          isListening: provider.isListening,
                          isProcessing: provider.isProcessing,
                          onPress: () async {
                            if (provider.isListening) {
                              await provider.stopListening();
                            } else {
                              await provider.startListening();
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}