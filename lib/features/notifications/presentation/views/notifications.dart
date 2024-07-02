import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/notifications/presentation/views/widget/notifications_body.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
      ),
      body: const SafeArea(child: NotificationsBody()),
    );
  }
}
