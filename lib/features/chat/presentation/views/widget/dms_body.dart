import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/chat/data/message.dart';
import 'package:freelance_job_portal/features/chat/presentation/views/widget/custom_text_form_chat.dart';

class DmsBody extends StatelessWidget {
  const DmsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 25),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                const HorizintalSpace(7),
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    "assets/images/pro.jpg",
                  ),
                ),
                const HorizintalSpace(1.5),
                const Text(
                  "Xabi Alonso",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: chat.length,
                itemBuilder: (context, index) {
                  return BubbleSpecialThree(
                    isSender: false,
                    text: chat[index].toString(),
                    color: const Color(0xFF1B97F3),
                    tail: true,
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 16),
                  );
                },
              ),
            ),
            const CustomTextFormChat()
          ],
        ),
      ),
    );
  }
}
