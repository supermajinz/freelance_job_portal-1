import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';

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
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 62,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(SizeConfig.defaultSize! * 10),
                    topRight: Radius.circular(SizeConfig.defaultSize! * 10)),
                color: Theme.of(context).primaryColor),
            child: const Text(
              "SYP",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
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
