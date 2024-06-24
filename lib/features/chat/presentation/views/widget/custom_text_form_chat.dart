import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';

class CustomTextFormChat extends StatelessWidget {
  const CustomTextFormChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MessageBar(
      // ignore: avoid_print
      onSend: (_) => print(_),
      actions: [
        InkWell(
          child: const Icon(
            Icons.add,
            color: Colors.black,
            size: 24,
          ),
          onTap: () {},
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: InkWell(
            child: const Icon(
              Icons.camera_alt,
              color: Colors.green,
              size: 24,
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
