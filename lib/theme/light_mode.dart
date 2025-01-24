import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: const ColorScheme.light(
    surface: Color.fromARGB(255, 255, 211, 194),
    brightness: Brightness.light,
    primary: Color.fromARGB(255, 139, 23, 0),
    secondary: Color.fromARGB(255, 255, 211, 194),
    tertiary: Color.fromARGB(255, 255, 255, 255),
  ),
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: const Color.fromARGB(255, 139, 23, 0),
        displayColor: const Color.fromARGB(255, 139, 23, 0),
      ),
);
