import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/notifications/presentation/views/widget/custom_notification_card.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const VirticalSpace(1),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return const CustomNotificationCard();
          },
        ),
      ],
    );
  }
}
