import 'package:flutter/material.dart';

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
      margin: const EdgeInsets.only(bottom: 25,left:20 ,right: 20),
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
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  lable,
                  style: const TextStyle(fontSize: 20),
                )),
            isDense: true,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            suffixIcon: InkWell(onTap: onTapicon, child: Icon(icon)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(40))),
      ),
    );
  }
}
