import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import '../../../../../core/utils/functions/utils.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widget/custom_subtitle_medium.dart';
import '../../../data/model/offers_model/offers_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class CustomOffer extends StatelessWidget {
  const CustomOffer({super.key, required this.offer});

  final OffersModel offer;
  @override
  Widget build(BuildContext context) {
    final createDate = offer.createDate?.toLocal() ?? DateTime.now();
    final formattedCreateDate = timeago.format(createDate, locale: 'ar');
    final workerName =
        '${offer.worker!.userDto!.firstname ?? 'Unknown'} ${offer.worker!.userDto!.lastname ?? ''}';
    final workerPhotoUrl = offer.worker!.photoDtOs!.isNotEmpty == true
        ? "${DependencyInjection.baseUrl}file/photo/${offer.worker!.photoDtOs![0].photo}"
        : null;
    final backgroundColor =
        workerPhotoUrl == null ? Utils.getBackgroundColor(workerName) : null;
    return Container(
      padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
      decoration: BoxDecoration(
        color: Theme.of(context).unselectedWidgetColor,
        borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                  radius: SizeConfig.defaultSize! * 4,
                  backgroundColor: backgroundColor,
                  backgroundImage: workerPhotoUrl != null
                      ? NetworkImage(workerPhotoUrl)
                      : null,
                  child: workerPhotoUrl == null
                      ? Center(
                          child: Text(
                            Utils.getInitials(workerName),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        )
                      : null),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSubTitleMedium(
                    text:
                        "${offer.worker!.userDto!.firstname} ${offer.worker!.userDto!.lastname}",
                    color: Colors.white,
                  ),
                  CustomBody(
                    text: offer.worker!.jobTitleDto!.title!,
                    color: Colors.white,
                  ),
                  const VirticalSpace(0.2),
                  Row(
                    children: [
                      CustomLabel(
                        text: offer.worker!.rate.toString(),
                        color: Colors.white,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              CustomLabel(
                text: formattedCreateDate,
                color: Colors.white,
              ),
            ],
          ),
          const VirticalSpace(1),
          Padding(
            padding: EdgeInsets.only(right: SizeConfig.defaultSize! * 1),
            child: CustomBody(
              text: offer.message!,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
