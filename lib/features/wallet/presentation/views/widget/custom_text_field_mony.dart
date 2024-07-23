import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';

class CustomTextFieldMony extends StatelessWidget {
  const CustomTextFieldMony(
      {super.key,

      // this.mycontroller,
      this.valid,
      required this.isNumber,
      this.obs,
      this.onTapicon});

  //final TextEditingController? mycontroller;
  final String? Function(String?)? valid;
  final bool isNumber;
  final bool? obs;
  final void Function()? onTapicon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 4),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: SizeConfig.defaultSize! * 6.2,
            width: SizeConfig.defaultSize! * 8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(SizeConfig.defaultSize! * 10),
                    topRight: Radius.circular(SizeConfig.defaultSize! * 10)),
                color: Theme.of(context).primaryColor),
            child: const CustomSubTitleMedium(
              text: "SYP",
              color: Colors.white,
            ),
          ),
          Expanded(
            child: TextFormField(
              keyboardType: isNumber
                  ? const TextInputType.numberWithOptions(decimal: true)
                  : TextInputType.text,
              obscureText: obs == null || obs == false ? false : true,
              validator: valid,
              // controller: mycontroller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft:
                              Radius.circular(SizeConfig.defaultSize! * 10),
                          topLeft:
                              Radius.circular(SizeConfig.defaultSize! * 10))),
                  hintText: "",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: SizeConfig.defaultSize! * 1.5,
                      horizontal: SizeConfig.defaultSize! * 2.5),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft:
                              Radius.circular(SizeConfig.defaultSize! * 10),
                          topLeft:
                              Radius.circular(SizeConfig.defaultSize! * 10)))),
            ),
          ),
        ],
      ),
    );
  }
}
