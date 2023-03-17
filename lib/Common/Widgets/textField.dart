import 'package:amazon/Constants/global_variable.dart';
import 'package:flutter/material.dart';

class TextAreas extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const TextAreas(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black38)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black38)),
      ),
      validator: (value) {
        return null;
      },
    );
  }
}
