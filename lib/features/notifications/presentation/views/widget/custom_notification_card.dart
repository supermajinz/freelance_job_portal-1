import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/constants/colors.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/notifications/presentation/data/notificaiton_model.dart';
import 'package:timeago/timeago.dart';

class CustomNotificationCard extends StatelessWidget {
  const CustomNotificationCard(
      {super.key, required this.notification, required this.onDelete});

  final NotificationModel notification;
  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color.fromARGB(255, 246, 248, 250),
        margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.defaultSize! * 1.5,
            vertical: SizeConfig.defaultSize! * .5),
        child: Container(
          padding: EdgeInsets.all(SizeConfig.defaultSize! * 1.5),
          height: SizeConfig.defaultSize! * 18,
          width: double.infinity,
          child: Column(children: [
            Row(
              children: [
                if (!notification.read)
                  Container(
                    height: SizeConfig.defaultSize! * 1.3,
                    width: SizeConfig.defaultSize! * 1.3,
                    decoration: BoxDecoration(
                        color: primaryColer,
                        borderRadius: BorderRadius.all(
                            Radius.circular(SizeConfig.defaultSize! * 2))),
                  ),
                const HorizintalSpace(1),
                CustomSubTitleMedium(
                  text: notification.title,
                ),
                const Spacer(),
                IconButton(onPressed: () => onDelete(), icon: const Icon(Icons.delete))
              ],
            ),
            const VirticalSpace(1),
            Text(
              notification.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.grey),
            ),
            const VirticalSpace(1.5),
            Row(
              children: [
                const Icon(
                  Icons.access_time_filled_outlined,
                  color: Colors.green,
                ),
                const HorizintalSpace(1),
                CustomLabel(
                  text: format(notification.date, locale: 'ar'),
                  color: Colors.black,
                )
              ],
            )
          ]),
        ));
  }
}
