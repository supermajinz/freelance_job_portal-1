import 'package:flutter/material.dart';

class CustomDate extends StatefulWidget {
  final DateTime initialDate;
  final Function(DateTime) onDateSelected;

  const CustomDate({
    super.key,
    required this.initialDate,
    required this.onDateSelected,
  });

  @override
  State<CustomDate> createState() => _CustomDateState();
}

class _CustomDateState extends State<CustomDate> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((pickedDate) {
      if (pickedDate != null && pickedDate != _selectedDate) {
        setState(() {
          _selectedDate = pickedDate;
        });
        widget.onDateSelected(pickedDate);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _showDatePicker,
      icon: const Icon(
        Icons.date_range_outlined,
        size: 35,
      ),
    );
  }
}
