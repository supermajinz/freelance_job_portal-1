import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_empty.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/notifications/presentation/data/notificaiton_model.dart';
import 'package:freelance_job_portal/features/notifications/presentation/views/widget/custom_notification_card.dart';

class NotificationsBody extends StatefulWidget {
  const NotificationsBody({super.key});

  @override
  State<NotificationsBody> createState() => _NotificationsBodyState();
}

class _NotificationsBodyState extends State<NotificationsBody> {
  List<NotificationModel>? notification = <NotificationModel>[];

  @override
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
      notification = await DependencyInjection.provideNotificationsRepo()
          .getMessages()
          .fold((l) => null, (r) => r);
    print(notification);
    setState(() {});
    markAsRead();
  }

  @override
  Widget build(BuildContext context) {
    print("ىخفه $notification");
    if (notification?.isEmpty ?? true) {
      return const CustomEmpty();
    }
    return ListView(
      children: [
        const VirticalSpace(1),
        ListView.builder(
          shrinkWrap: true,
          reverse: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: notification!.length,
          itemBuilder: (context, index) {
            return CustomNotificationCard(notification: notification![index], onDelete: () {
              DependencyInjection.provideNotificationsRepo().removeMessage(index);
              fetch();
            });
          },
        ),
      ],
    );
  }

  void markAsRead() {
    DependencyInjection.provideNotificationsRepo().markAsRead();
  }
}
