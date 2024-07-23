import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/chat/presentation/views/widget/chat_body.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ChatBody()),
    );
  }
}
