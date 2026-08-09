import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AiChatInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const AiChatInput({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        16,
        10,
        16,
        12,
      ),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              constraints: const BoxConstraints(
                minHeight: 42,
                maxHeight: 110,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xffC8CDD5),
                ),
              ),
              child: TextField(
                controller: controller,
                minLines: 1,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'Ask or search about anything...',
                  hintStyle: TextStyle(
                    fontSize: 12,
                    color: Color(0xff9AA9BE),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 12,
                  ),
                  suffixIcon: Icon(
                    LucideIcons.paperclip,
                    color: Color(0xff8995A7),
                    size: 21,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          GestureDetector(
            onTap: onSend,
            child: const SizedBox(
              width: 45,
              height: 45,
              child: Icon(
                LucideIcons.send,
                color: Color(0xff087CFF),
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}