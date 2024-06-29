import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';

class EditTextForm extends StatelessWidget {
  const EditTextForm(
      {super.key,
      required this.hinttext,
      required this.lable,
      required this.isNumber,
      this.obs,
      this.onTapicon, required this.initvalue});
  final String hinttext;
  final String lable;
  final String initvalue;
  //final TextEditingController? mycontroller;
  final bool isNumber;
  final bool? obs;
  final void Function()? onTapicon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue:
          initvalue,
      minLines: 1, maxLines: 5,
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
              vertical: SizeConfig.defaultSize! * 2,
              horizontal: SizeConfig.defaultSize! * 2),
          label: Container(
              margin:
                  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 4),
              child: Text(
                lable,
                style: const TextStyle(fontSize: 20),
              )),
          isDense: true,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          border: const OutlineInputBorder(
              // borderRadius:
              //BorderRadius.circular(SizeConfig.defaultSize! * 10)
              )),
    );
  }
}
