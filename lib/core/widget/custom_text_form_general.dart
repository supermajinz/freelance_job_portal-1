import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';

class CustomTextFormGeneral extends StatelessWidget {
  final String hinttext;
  final String lable;
  //final TextEditingController? mycontroller;
  final bool isNumber;
  final bool? obs;
  final void Function()? onTapicon;
  const CustomTextFormGeneral(
      {super.key,
      required this.hinttext,
      required this.lable,
      // this.mycontroller,
      required this.isNumber,
      this.obs,
      this.onTapicon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: isNumber
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      obscureText: obs == null || obs == false ? false : true,
      //controller: mycontroller,
      decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(fontSize: 12),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(
              vertical: SizeConfig.defaultSize! * 1.5,
              horizontal: SizeConfig.defaultSize! * 2.5),
          label: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.defaultSize! * 1.5),
              child: Text(
                lable,
                style: const TextStyle(fontSize: 20),
              )),
          isDense: true,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(SizeConfig.defaultSize! * 10))),
    );
  }
}
