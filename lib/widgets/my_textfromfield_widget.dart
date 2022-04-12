// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class MyTextFromField extends StatelessWidget {
  final String hintText;
  bool obscureText = false;
  MyTextFromField({required this.hintText, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: Colors.grey[100],
          filled: true,
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius : BorderRadius.circular(10),
          )

        ),
      ),
    );
  }
}
