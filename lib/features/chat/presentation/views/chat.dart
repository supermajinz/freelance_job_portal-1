import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/chat/presentation/views/widget/chat_body.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        centerTitle: true,
         leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_back)),
      ),
      body: const ChatBody(),
    );
  }
}