import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_button_auth.dart';
import 'package:go_router/go_router.dart';

void showButtomSheet(BuildContext context, String text) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
          child: Column(
            children: [
              Center(
                child: Icon(
                  Icons.check_circle_outline,
                  size: SizeConfig.defaultSize! * 20,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const VirticalSpace(1),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                    color: Colors.black),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  borderSide: const BorderSide(width: 0),
                  color: Theme.of(context).primaryColor,
                  textcolor: Colors.white,
                  width: SizeConfig.defaultSize! * 2,
                  text: "Go To Login",
                  onPressed: () {
                    GoRouter.of(context).push("/login");
                  },
                ),
              ),
            ],
          ),
        );
      });
}
