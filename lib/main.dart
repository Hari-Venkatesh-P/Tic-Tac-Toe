import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/molecules/CustomRadioButton.dart';
import 'package:tic_tac_toe/molecules/CustomTextInput.dart';
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String gameLevel = easy;
  final playerOneTextController = TextEditingController();
  final playerTwoTextController = TextEditingController();

  @override
  void dispose() {
    playerOneTextController.dispose();
    playerTwoTextController.dispose();
    super.dispose();
  }

  Map<String, Color> getStyles() {
    var styles = Map<String, Color>();
    styles['selectedBackgroundColor'] = AppColors.primaryColor;
    return styles;
  }

  void playGame(String gameLevel) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => GameScreen(
                rows: getRowCountFromGameLevel(gameLevel),
                playerOne: playerOneTextController.text,
                playerTwo: playerTwoTextController.text,
              )),
    );
  }

  void floatingButtonPressed() {
    if(playerOneTextController.text.isEmpty || playerTwoTextController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Add player names'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ));
    } else {
      playGame(gameLevel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text(
           TIC_TAC_TOE,
          style: TextStyle(
            fontSize: 18,
            color: AppColors.blackColor,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: CustomTextInput(playerOneTextController.text,
                  'Player name', 'Player one', playerOneTextController),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: CustomTextInput(
                playerTwoTextController.text,
                'Player name',
                'Player Two',
                playerTwoTextController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: CustomRadioButton(
                  gameLevel,
                  game_level_options,
                  getStyles(),
                  (val) => {
                        setState(() {
                          gameLevel = val;
                        })
                      }),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
          width: 100,
          child: FloatingActionButton(
            onPressed: () => floatingButtonPressed(),
            tooltip: 'Play Tic Tac Toe',
            backgroundColor: AppColors.primaryColor,
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Text(
              'Start',
              style: TextStyle(color: AppColors.blackColor),
            ),
          )),
    );
  }
}
