import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String value;

  final String placeHolderText;

  final String labelText;

  final TextEditingController textEditingController;

  const CustomTextInput(this.value, this.placeHolderText, this.labelText, this.textEditingController,  {super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        filled: false,
        hintText: placeHolderText,
        hintStyle: const TextStyle(color: Colors.grey),
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }
}
