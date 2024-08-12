import 'package:flutter/material.dart';

class CustomBody extends StatelessWidget {
  const CustomBody({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.isCurrency = false,
    this.isday = false,
  });
  final String text;
  final Color color;
  final bool isCurrency;
  final bool isday;

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatText(text),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: color),
    );
  }

  String _formatText(String text) {
    final RegExp numberPattern = RegExp(r'\d+'); // نمط لتحديد الأرقام

    // البحث عن الأرقام في النص
    final matches = numberPattern.allMatches(text);
    if (matches.isEmpty) {
      return text; // إذا لم يكن هناك أرقام، عرض النص كما هو
    }

    String formattedText = text;

    for (final match in matches) {
      final numberString = match.group(0)!;
      final formattedNumber = _formatNumber(int.parse(numberString));
      formattedText = formattedText.replaceFirst(numberString, formattedNumber);
    }

    return formattedText;
  }

  String _formatNumber(int number) {
    if (number == 0) {
      return '0'; // إذا كانت القيمة صفرًا، نعيدها كما هي
    }

    String partText = '';

    if (number >= 1000000) {
      int millions = number ~/ 1000000;
      partText += '$millions مليون';
      number %= 1000000;
    }

    if (number >= 1000) {
      if (partText.isNotEmpty) partText += ' و ';
      int thousands = number ~/ 1000;
      partText += '$thousands ألف';
      number %= 1000;
    }

    if (number > 0) {
      if (partText.isNotEmpty) partText += ' و ';
      partText += '$number';
    }

    // إضافة "ل.س" إذا كان isCurrency = true
    if (isCurrency) {
      partText += ' ل.س';
    }
    // إضافة "يوم" إذا كان isday = true
    if (isday) {
      partText += ' يوم';
    }

    return partText.trim();
  }
}
