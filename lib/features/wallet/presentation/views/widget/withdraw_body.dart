import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/custom_text_form_general.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/wallet/presentation/views/widget/custom_payment.dart';
import 'package:freelance_job_portal/features/wallet/presentation/views/widget/custom_text_field_mony.dart';

class WithdrawBody extends StatelessWidget {
  const WithdrawBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(
              left: SizeConfig.defaultSize! * 1.7,
              right: SizeConfig.defaultSize! * 1.7,
              bottom: SizeConfig.defaultSize! * 2,
              top: SizeConfig.defaultSize! * 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSubTitle(
                text: "Choose Payment Method:",
              ),
              const VirticalSpace(3),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomPayment(
                    text: "Syriatel Cash",
                    url: "assets/images/p1.png",
                  ),
                  CustomPayment(
                    text: "Bank Bemo",
                    url: "assets/images/p2.png",
                  ),
                  CustomPayment(
                    text: "Al-HARAM",
                    url: "assets/images/p3.png",
                  ),
                ],
              ),
              const VirticalSpace(4),
              const CustomBody(
                  text: "Send desired amount to the following address: "),
              const CustomBody(
                text: "XXXX-XXXX-XXXX-XXXX",
                color: Colors.grey,
              ),
              const CustomBody(
                text: "and then enter the information below",
              ),
              const VirticalSpace(2),
              const CustomSubTitle(
                text: "Amount:",
              ),
              const VirticalSpace(1),
              const CustomTextFieldMony(isNumber: true),
              const VirticalSpace(5),
              const CustomTextFormGeneral(
                  hinttext: "", lable: "Your Wallet Address", isNumber: false),
              const VirticalSpace(1),
              Text(
                "Note: Your transaction will be processed shortly, thank you for your patience.",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const VirticalSpace(12),
              Center(
                child: CustomButtonGeneral(
                    onPressed: () {},
                    color: Theme.of(context).primaryColor,
                    textcolor: Colors.white,
                    text: "Withdraw",
                    borderSide: const BorderSide(width: 0),
                    width: SizeConfig.defaultSize! * 20),
              )
            ],
          ),
        ),
      ],
    );
  }
}
