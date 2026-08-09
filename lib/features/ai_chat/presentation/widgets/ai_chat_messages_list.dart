import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ai_chat_message_bubble.dart';

class AiChatMessagesList extends StatelessWidget {
  const AiChatMessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    // final messages = context.watch<AiChatCubit>().messages;

    // if (messages.isEmpty) {
    //   return const SizedBox.shrink();
    // }

    return Column(children: []
        //    messages
        //       .map(
        //         (message) => AiChatMessageBubble(
        //           message: message,
        //         ),
        //       )
        //       .toList(),
        );
  }
}
