import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String error;
  final bool? hidden;

  const MyTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.error,
    this.hidden,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Theme.of(context).colorScheme.primary,
      style: TextStyle(color: Theme.of(context).colorScheme.primary),

      // Style de l'input
      decoration: InputDecoration(
        labelText: labelText,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        floatingLabelStyle:
            TextStyle(color: Theme.of(context).colorScheme.primary),
      ),

      obscureText: hidden ?? false,

      // Le validator vérifie que le champ n'est pas vide
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your name';
        }
        return null;
      },
    );
  }
}
