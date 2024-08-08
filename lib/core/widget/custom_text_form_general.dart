import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';

class CustomTextFormGeneral extends StatelessWidget {
  final String hinttext;
  final String lable;
  final TextEditingController? mycontroller;
  final bool isNumber;
  final bool? obs;
  final void Function()? onTapicon;
  const CustomTextFormGeneral(
      {super.key,
      required this.hinttext,
      required this.lable,
      this.mycontroller,
      required this.isNumber,
      this.obs,
      this.onTapicon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 1,
      maxLines: 5,
      inputFormatters: [if (isNumber) FilteringTextInputFormatter.digitsOnly],
      keyboardType: isNumber
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      obscureText: obs == null || obs == false ? false : true,
      controller: mycontroller,
      decoration: InputDecoration(
          alignLabelWithHint: true,
          hintText: hinttext,
          hintStyle: const TextStyle(fontSize: 12),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(
              vertical: SizeConfig.defaultSize! * 2,
              horizontal: SizeConfig.defaultSize! * 3),
          label: Container(
              margin:
                  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 4),
              child: CustomSubTitleMedium(text: lable)),
          isDense: true,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          border: const OutlineInputBorder(
              // borderRadius:
              //     BorderRadius.circular(SizeConfig.defaultSize! * 10)
              )),
    );
  }
}
