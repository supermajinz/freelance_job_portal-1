import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';

class CustomTextFormChat extends StatelessWidget {
  final TextEditingController controller;
  final Function() onSend;
  const CustomTextFormChat(
      {super.key, required this.controller, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return MessageBar(replying: true,textFieldTextStyle: const TextStyle(fontSize: 20),
      // ignore: avoid_print
      onSend: (_) {
        onSend();
        controller.clear();
      },
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
          padding:  EdgeInsets.only(left: SizeConfig.defaultSize!*.8, right: SizeConfig.defaultSize!*.8),
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
