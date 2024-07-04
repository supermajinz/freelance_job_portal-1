import 'package:flutter/material.dart';

class CustomDate extends StatefulWidget {
  const CustomDate({super.key});

  @override
  State<CustomDate> createState() => _CustomDateState();
}

class _CustomDateState extends State<CustomDate> {
  void _showDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: _showDatePicker,
        icon: const Icon(Icons.date_range_outlined,size: 30,));
  }
}
