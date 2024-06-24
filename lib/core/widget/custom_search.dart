import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  final String title;
  final void Function()? onPressedNOT;
  final void Function()? onPressedSer;
  final void Function(String)? onChanged;
  //final TextEditingController myController;
  const CustomSearch({
    super.key,
    required this.title,
    this.onPressedNOT,
    this.onPressedSer,
    this.onChanged,
    //required this.myController
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: TextFormField(
        // controller: myController,
        onChanged: onChanged,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Colors.cyan),
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Colors.cyanAccent),
                borderRadius: BorderRadius.circular(30)),
             filled: true,
             fillColor:  Colors.cyanAccent,
            prefixIcon: IconButton(
                onPressed: onPressedSer,
                icon: const Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 209, 204, 204),
                  size: 28,
                )),
            hintText: title,
            hintStyle: const TextStyle(
                color: Color.fromARGB(255, 209, 204, 204), fontSize: 20)),
      ),
    );
  }
}
