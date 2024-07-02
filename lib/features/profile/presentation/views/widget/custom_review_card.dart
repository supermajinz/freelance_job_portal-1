import 'package:animated_rating_bar/widgets/animated_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/space.dart';

class CustomReviewCard extends StatelessWidget {
  const CustomReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(margin: EdgeInsets.symmetric(horizontal:SizeConfig.defaultSize!*.5),
              child:  CircleAvatar(
                maxRadius: SizeConfig.defaultSize!*3,
                backgroundImage: const AssetImage(
                  "assets/images/pro.jpg",
                ),
              ),
            ),
            const HorizintalSpace(1),
            const Text(
              "Sara",
              style: TextStyle(fontSize: 20),
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
            AnimatedRatingBar(
              activeFillColor: Theme.of(context).colorScheme.inversePrimary,
              strokeColor: Colors.green,
              initialRating: 0,
              height: SizeConfig.defaultSize!*2,
              width: SizeConfig.defaultSize!*8,
              animationColor: Colors.red,
              onRatingUpdate: (rating) {
                debugPrint(rating.toString());
              },
            ),
            const HorizintalSpace(1.5),
            const Text(
              "15/4/2024",
              style: TextStyle(fontSize: 13),
            )
          ],
        ),
        const VirticalSpace(1),
        Container(
          margin:  EdgeInsets.symmetric(horizontal:SizeConfig.defaultSize!*.8),
          height:SizeConfig.defaultSize!*7,
          child: const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus....",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            maxLines: 3,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
