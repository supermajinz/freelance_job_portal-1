import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:iconly/iconly.dart';

void showBottomSheetOffer(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled:
        true, // Allow the BottomSheet to take full screen height if needed
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height *
            0.70, // Set the height to 75% of the screen height

        padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
        child: Column(
          children: [
            const CustomSubTitle(text: "Are you sure you want to accept?"),
            const VirticalSpace(1),
            const CustomSubTitleMedium(text: "Order Management App"),
            const VirticalSpace(3),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: CustomSubTitleMedium(text: "Price"),
                ),
                Expanded(
                  child: CustomBody(text: "15,000,000"),
                )
              ],
            ),
            const VirticalSpace(2),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: CustomSubTitleMedium(text: "Delivery Time"),
                ),
                Expanded(
                  child: CustomBody(text: "12/4/2024"),
                )
              ],
            ),
            const VirticalSpace(3),
            Text(
              "7,500,000 will be withheld from your funds until the end of the project",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const VirticalSpace(3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  IconlyBold.wallet,
                  size: SizeConfig.defaultSize! * 13,
                ),
                const HorizintalSpace(1),
                const Column(
                  children: [
                    CustomSubTitle(text: "Balance:"),
                    CustomSubTitleMedium(
                      text: "SYP 20,000,000",
                      color: Colors.grey,
                    ),
                    CustomSubTitle(text: "Withheld Funds:"),
                    CustomSubTitleMedium(
                      text: "SYP 7,500,000",
                      color: Colors.grey,
                    ),
                  ],
                )
              ],
            ),
            const VirticalSpace(9),
            // Add Spacer to push the button to the bottom
            CustomButtonGeneral(
              onPressed: () {},
              color: Colors.white,
              textcolor: Colors.black,
              text: "Slide to Accept",
              borderSide: const BorderSide(color: Colors.grey),
              width: SizeConfig.defaultSize! * 40,
            ),
            // Add space below the button if needed
          ],
        ),
      );
    },
  );
}
