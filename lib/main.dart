import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/molecules/CustomRadioButton.dart';
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void playGame(String gameLevel) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>  GameScreen(
                rows: getRowCountFromGameLevel(gameLevel),
                playerOne: 'Hari',
                playerTwo: 'Venkat',
              )),
    );
  }

  String gameLevel = easy;

  Map<String, Color> getStyles() {
    var styles = Map<String, Color>();
    styles['selectedBackgroundColor'] = AppColors.primaryColor;
    return styles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomRadioButton(
                gameLevel,
                game_level_options,
                getStyles(),
                (val) => {
                      setState(() {
                        gameLevel = val;
                      })
                    }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => playGame(gameLevel),
        tooltip: 'Play Tic Tac Toe',
        child: Text(
          'Play',
        ),
      ),
    );
  }
}
