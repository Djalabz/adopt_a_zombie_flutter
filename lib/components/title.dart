import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreepText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final TextAlign? alignment;

  const CreepText({
    super.key,
    required this.text,
    required this.fontSize,
    this.color,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment ?? TextAlign.left,
      style: GoogleFonts.creepster(
        fontSize: fontSize,
        color: color ?? const Color.fromARGB(255, 139, 23, 0),
      ),
    );
  }
}
