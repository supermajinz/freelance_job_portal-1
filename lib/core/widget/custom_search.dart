import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';

class CustomSearch extends StatelessWidget {
  final String title;
  final void Function()? onPressedNOT;
  final void Function()? onPressedSer;
  final void Function(String)? onSubmit;
  final void Function(String)? onChanged;
  final TextEditingController myController;
  const CustomSearch(
      {super.key,
      required this.title,
      this.onPressedNOT,
      this.onPressedSer,
      this.onChanged,
      required this.myController,
      this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.defaultSize! * 1.5,
          horizontal: SizeConfig.defaultSize! * 1),
      child: TextFormField(
        controller: myController,
        onChanged: onChanged,
        onFieldSubmitted: onSubmit,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: SizeConfig.defaultSize! * 1,
                horizontal: SizeConfig.defaultSize! * 3.5),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 3),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius:
                    BorderRadius.circular(SizeConfig.defaultSize! * 3)),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: IconButton(
                onPressed: onPressedSer,
                icon: const Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 112, 109, 109),
                  size: 28,
                )),
            hintText: title,
            hintStyle: const TextStyle(
                color: Color.fromARGB(255, 151, 150, 150), fontSize: 18)),
      ),
    );
  }
}
