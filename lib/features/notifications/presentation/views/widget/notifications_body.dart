import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/notifications/presentation/views/widget/custom_notification_card.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return const CustomNotificationCard();
      },
    );
  }
}
