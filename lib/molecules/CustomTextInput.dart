import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils/colors.dart';

class CustomTextInput extends StatelessWidget {
  final String value;

  final String placeHolderText;

  final String labelText;

  final TextEditingController textEditingController;

  final ValueChanged<String> onTextInputBlur;

  const CustomTextInput(this.value, this.placeHolderText, this.labelText,
      this.textEditingController, this.onTextInputBlur,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (!hasFocus) {
          onTextInputBlur(textEditingController.text);
        }
      },
      child: TextField(
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
        cursorColor: AppColors.blackColor,
      ),
    );
  }
}
