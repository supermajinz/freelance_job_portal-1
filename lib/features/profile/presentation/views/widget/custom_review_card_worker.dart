import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:intl/intl.dart' as intl;
import '../../../../review/data/model/rate_model/rate.dart';

class CustomReviewCardWorker extends StatelessWidget {
  const CustomReviewCardWorker({super.key, required this.rate});
  final Rate rate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.defaultSize! * .5),
              child: CircleAvatar(
                maxRadius: SizeConfig.defaultSize! * 3,
                backgroundImage: const AssetImage(
                  "assets/images/pro.jpg",
                ),
              ),
            ),
            const HorizintalSpace(1),
            CustomSubTitleMedium(
              text: rate.client.userDto!.firstname!,
            ),
            const HorizintalSpace(23),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_sweep_outlined,
                  size: 25,
                )),
          ],
        ),
        const VirticalSpace(1.5),
        Row(
          children: [
            RatingBar(
              initialRating: rate.totalRate,
              allowHalfRating: true,
              onRatingUpdate: (rating) {
                debugPrint(rating.toString());
              },
              ignoreGestures: true,
              itemSize: 17,
              ratingWidget: RatingWidget(
                  full: const Icon(Icons.star, color: Colors.yellow),
                  half: const Icon(
                    Icons.star_half,
                    color: Colors.yellow,
                    textDirection: TextDirection.ltr,
                  ),
                  empty: const Icon(Icons.star_outline, color: Colors.yellow)),
            ),
            const HorizintalSpace(1.5),
            CustomLabel(
              text: intl.DateFormat('yyyy-MM-dd').format(rate.createDate),
            )
          ],
        ),
        const VirticalSpace(1),
        Container(
          margin:
              EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * .8),
          height: SizeConfig.defaultSize! * 7,
          child: Text(rate.description,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              maxLines: 3,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.grey)),
        ),
      ],
    );
  }
}
