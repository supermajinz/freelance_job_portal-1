import 'package:flutter/material.dart';

class Utils {
  // Function to get background color based on the first letter of the name
  static Color getBackgroundColor(String name) {
    final firstLetter = name.trim().toUpperCase().isNotEmpty
        ? name.trim().toUpperCase()[0]
        : ' ';
    return _getColorByLetter(firstLetter);
  }

  // Function to map the letter to a color
  static Color _getColorByLetter(String letter) {
    // English alphabet ranges
    if ('ABC'.contains(letter)) return Colors.blue;
    if ('DEF'.contains(letter)) return Colors.red;
    if ('GHI'.contains(letter)) return Colors.green;
    if ('JKL'.contains(letter)) return Colors.orange;
    if ('MNO'.contains(letter)) return Colors.purple;
    if ('PQR'.contains(letter)) return Colors.teal;
    if ('STU'.contains(letter)) return Colors.yellow;
    if ('VWX'.contains(letter)) return Colors.pink;
    if ('YZ'.contains(letter)) return Colors.brown;

    // Arabic letters ranges
    if ('أبج'.contains(letter)) return Colors.cyan;
    if ('دهز'.contains(letter)) return Colors.lime;
    if ('طظى'.contains(letter)) return Colors.indigo;
    if ('عبس'.contains(letter)) return Colors.amber;
    if ('موي'.contains(letter)) return Colors.deepOrange;
    if ('نقف'.contains(letter)) return Colors.grey;
    if ('ركل'.contains(letter)) return Colors.deepPurple;
    if ('شصض'.contains(letter)) return Colors.lightBlue;
    if ('غعظ'.contains(letter)) return Colors.lightGreen;

    // Default color if letter doesn't match
    return Colors.grey;
  }

  // Function to get initials from a name
  static String getInitials(String name) {

    List<String> nameParts = name.split(' ');
    if(nameParts.isEmpty){
      return name;
    }
    String initials = '';

    if (nameParts.isNotEmpty) {
      initials = nameParts[0][0];
      if (nameParts.length > 1) {
        initials += nameParts[1][0];
      }
    }

    return initials;
  }
}
