import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/constants/colors.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class WalletBody extends StatelessWidget {
  const WalletBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(
          left: SizeConfig.defaultSize! * 2,
          right: SizeConfig.defaultSize! * 2,
          top: SizeConfig.defaultSize! * 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin:
                EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  IconlyBold.wallet,
                  size: SizeConfig.defaultSize! * 15,
                ),
                const HorizintalSpace(1),
                const Column(
                  children: [
                    CustomSubTitle(
                      text: "Balance:",
                    ),
                    CustomSubTitleMedium(
                      text: "SYP 20,000,000",
                      color: Colors.grey,
                    ),
                    CustomSubTitle(
                      text: "Withheld Funds:",
                    ),
                    CustomSubTitleMedium(
                      text: "SYP 7,500,000",
                      color: Colors.grey,
                    ),
                  ],
                )
              ],
            ),
          ),
          const VirticalSpace(2),
          Row(
            children: [
              CustomButtonGeneral(
                  onPressed: () {
                    GoRouter.of(context).push("/deposit");
                  },
                  color: Colors.deepPurple,
                  textcolor: Colors.white,
                  text: "Deposit",
                  borderSide: const BorderSide(width: 0),
                  width: SizeConfig.defaultSize! * 16),
              const Spacer(),
              CustomButtonGeneral(
                  onPressed: () {
                    GoRouter.of(context).push("/withdraw");
                  },
                  color: primaryColer,
                  textcolor: Colors.white,
                  text: "Withdraw",
                  borderSide: const BorderSide(width: 0),
                  width: SizeConfig.defaultSize! * 16)
            ],
          ),
          const VirticalSpace(3),
          const CustomSubTitle(
            text: "Transaction History:",
          ),
          const VirticalSpace(1),
          SizedBox(
            height: SizeConfig.defaultSize! * 44.3,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          CustomBody(text: "SYP 5,000,000 "),
                          CustomBody(
                            text: "has been sent to ",
                            color: Colors.grey,
                          ),
                          CustomBody(
                            text: "Ahmad Murad ",
                          ),
                          CustomBody(
                            text: "for ",
                            color: Colors.grey,
                          ),
                          CustomBody(
                            text: "Order Management App",
                          )
                        ],
                      ),
                      CustomBody(
                        text: "Date: 12/2/2024",
                      ),
                      CustomBody(
                        text: "Transaction ID: 94786746873743876",
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: 6),
          )
        ],
      ),
    );
  }
}
