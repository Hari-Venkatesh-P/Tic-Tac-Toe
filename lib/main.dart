import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/molecules/CustomRadioButton.dart';
import 'package:tic_tac_toe/molecules/CustomSnackbar.dart';
import 'package:tic_tac_toe/molecules/CustomTextInput.dart';
import 'package:tic_tac_toe/screens/SplashScreen.dart';
import 'package:tic_tac_toe/utils/colors.dart';
import 'package:tic_tac_toe/utils/constants.dart';
import 'package:tic_tac_toe/utils/utility.dart';
import 'screens/GameScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

