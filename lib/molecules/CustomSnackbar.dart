import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils/colors.dart';

class CustomSnackBar extends StatelessWidget {

  final String contentText;

  final String actionBtnText;

  final VoidCallback onActionBtnPressed;

  const CustomSnackBar(this.contentText, this.actionBtnText,  this.onActionBtnPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(contentText),
      action: SnackBarAction(
        textColor: AppColors.primaryColor,
        label: actionBtnText,
        onPressed: onActionBtnPressed,
      ),
    );
  }
}
