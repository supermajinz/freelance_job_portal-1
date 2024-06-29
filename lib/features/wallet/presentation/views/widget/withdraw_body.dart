import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
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
              top: SizeConfig.defaultSize! * 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Choose Payment Method:",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
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
              const Text(
                "Send desired amount to the following address: ",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w200,
                    color: Colors.black),
              ),
              const Text(
                "XXXX-XXXX-XXXX-XXXX",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
              ),
              const Text(
                "and then enter the information below",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w200,
                    color: Colors.black),
              ),
              const VirticalSpace(2),
              const Text(
                "Amount:",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
              ),
              const VirticalSpace(1),
              const CustomTextFieldMony(isNumber: true),
              const VirticalSpace(5),
              const CustomTextFormGeneral(
                  hinttext: "", lable: "Your Wallet Address", isNumber: false),
              const VirticalSpace(1),
              const Text(
                "Note: Your transaction will be processed shortly, thank you for your patience.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
              ),
              const VirticalSpace(8),
              Center(
                child: CustomButtonGeneral(
                    onPressed: () {},
                    color: Theme.of(context).primaryColor,
                    textcolor: Colors.white,
                    text: "Withdraw",
                    borderSide: const BorderSide(width: 0),
                    width: 200),
              )
            ],
          ),
        ),
      ],
    );
  }
}
