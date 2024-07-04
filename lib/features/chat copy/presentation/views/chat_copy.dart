import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/chat%20copy/presentation/views/widget/chat_body.dart';

class ChatCopy extends StatelessWidget {
  const ChatCopy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        centerTitle: true,
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
      ),
      body: const SafeArea(child: ChatBodyCopy()),
    );
  }
}
