import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';

class CustomTextForm extends StatelessWidget {
  final String hinttext;
  final String lable;
  final IconData icon;
  final TextEditingController? mycontroller;
  final String? Function(String?)? valid;
  final bool isNumber;
  final bool? obs;
  final void Function()? onTapicon;
  const CustomTextForm(
      {super.key,
      required this.hinttext,
      required this.lable,
      required this.icon,
      this.mycontroller,
      required this.valid,
      required this.isNumber,
      this.obs,
      this.onTapicon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: SizeConfig.defaultSize! * 2,
          left: SizeConfig.defaultSize! * 2,
          right: SizeConfig.defaultSize! * 2),
      child: TextFormField(
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        obscureText: obs == null || obs == false ? false : true,
        validator: valid,
        controller: mycontroller,
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
            suffixIcon: InkWell(onTap: onTapicon, child: Icon(icon)),
            border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(SizeConfig.defaultSize! * 10))),
      ),
    );
  }
}
