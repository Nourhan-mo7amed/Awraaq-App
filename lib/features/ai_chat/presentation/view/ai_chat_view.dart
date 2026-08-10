import 'package:awraq/features/ai_chat/presentation/widgets/ai_chat_app_bar.dart';
import 'package:awraq/features/ai_chat/presentation/widgets/ai_chat_input.dart';
import 'package:awraq/features/ai_chat/presentation/widgets/ai_chat_intro_card.dart';
import 'package:awraq/features/ai_chat/presentation/widgets/ai_chat_messages_list.dart';
import 'package:awraq/features/ai_chat/presentation/widgets/ai_chat_service_list.dart';
import 'package:flutter/material.dart';


class AiChatView extends StatelessWidget {
  const AiChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AiChatBody();
  }
}

class _AiChatBody extends StatefulWidget {
  const _AiChatBody();

  @override
  State<_AiChatBody> createState() => _AiChatBodyState();
}

class _AiChatBodyState extends State<_AiChatBody> {
  final TextEditingController messageController =
      TextEditingController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  void sendMessage() {
    final message = messageController.text.trim();

    if (message.isEmpty) return;

    //context.read<AiChatCubit>().sendMessage(message);

    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FC),
      appBar: const AiChatAppBar(),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
      
                    const AiChatIntroCard(),
      
                    const SizedBox(height: 20),
      
                    AiChatServiceList(
                      onServiceSelected: (service) {
                        messageController.text = service;
                      },
                    ),
      
                    const SizedBox(height: 15),
      
                    const AiChatMessagesList(),
      
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
      
            AiChatInput(
              controller: messageController,
              onSend: sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}