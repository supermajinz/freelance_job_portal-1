import 'package:flutter/material.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widget/custom_container.dart';
import '../../../../../core/widget/custom_meony.dart';
import '../../../../../core/widget/custom_subtitle_medium.dart';
import '../../../../../core/widget/space.dart';
import '../../../../projects/presentation/views/widget/custom_chip_project.dart';

class CustomBodyStatusDetails extends StatelessWidget {
  const CustomBodyStatusDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSubTitleMedium(text: "Description:"),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.defaultSize! * .5,
            ),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus",
              textAlign: TextAlign.start,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const VirticalSpace(.5),
          InkWell(
            onTap: () {},
            child: Text(
              "show more",
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decorationThickness: 2,
                    decoration: TextDecoration.underline,
                  ),
            ),
          ),
          const VirticalSpace(4),
          const Row(
            children: [
              Expanded(child: CustomSubTitleMedium(text: "Price:")),
              Expanded(
                child: CustomMeony(
                  text: "7,500,000",
                ),
              ),
            ],
          ),
          const VirticalSpace(3),
          const Row(
            children: [
              Expanded(child: CustomSubTitleMedium(text: "Delivery Time:")),
              Expanded(
                child: CustomContainer(
                  text: "12/4/2024",
                ),
              ),
            ],
          ),
          const VirticalSpace(3),
          const CustomSubTitleMedium(text: "Skills Required:"),
          const VirticalSpace(1),
          const CustomChipProject(),
          const VirticalSpace(3),
        ],
      ),
    );
  }
}
