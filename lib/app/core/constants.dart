import 'package:flutter/material.dart';

const kPrimary = Color.fromARGB(255, 60, 41, 153);
const kPrimaryGradient = [
  Color(0xff6E66D7),
  Color.fromARGB(255, 102, 95, 202),
  Color.fromARGB(255, 98, 91, 196),
];

const kHintColor = Color.fromARGB(255, 48, 65, 223);
const kButtonBorder = Color.fromARGB(255, 44, 60, 211);

Color getTaskColor(String taskType) {
  switch (taskType) {
    case 'Basic':
      return const Color.fromARGB(255, 255, 251, 226);
    case 'Important':
      return const Color.fromARGB(255, 218, 233, 230);
    case 'Urgent':
      return const Color.fromARGB(255, 255, 208, 216);
    default:
      return Colors.grey;
  }
}

Color getTaskColorBorder(String taskType) {
  switch (taskType) {
    case 'Basic':
      return const Color.fromARGB(255, 226, 223, 199);
    case 'Important':
      return const Color.fromARGB(255, 198, 211, 208);
    case 'Urgent':
      return const Color.fromARGB(255, 228, 186, 193);
    default:
      return Colors.grey;
  }
}
