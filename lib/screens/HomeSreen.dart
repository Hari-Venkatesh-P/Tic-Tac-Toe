import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/blocs/game_blocs.dart';
import 'package:tic_tac_toe/events/game_events.dart';
import 'package:tic_tac_toe/molecules/CustomRadioButton.dart';
import 'package:tic_tac_toe/molecules/CustomTextInput.dart';
import 'package:tic_tac_toe/screens/GameScreen.dart';
import 'package:tic_tac_toe/state/game_states.dart';
import 'package:tic_tac_toe/utils/colors.dart';
import 'package:tic_tac_toe/utils/constants.dart';
import 'package:tic_tac_toe/utils/utility.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bool shouldPop = false;
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

  @override
  Widget build(BuildContext context) {
    final GameBlocs gameBlocs = BlocProvider.of<GameBlocs>(context);
    void playGame() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GameScreen(
                  rows: getRowCountFromGameLevel(gameBlocs.state.gameLevel),
                  playerOne: gameBlocs.state.playerOne,
                  playerTwo: gameBlocs.state.playerTwo,
                )),
      );
    }

    void floatingButtonPressed() {
      if (gameBlocs.state.playerOne.isEmpty ||
          gameBlocs.state.playerTwo.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Add player names'),
          action: SnackBarAction(
            textColor: AppColors.primaryColor,
            label: 'Ok',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ));
      } else {
        playGame();
      }
    }

    void onNativeBackButtonPressed() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Are you sure want to exit ?'),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          textColor: AppColors.primaryColor,
          label: 'Yes',
          onPressed: () {
            exit(0);
          },
        ),
      ));
    }

    return BlocBuilder<GameBlocs, GameStates>(builder: (context, state) {
      return WillPopScope(
          onWillPop: () async {
            onNativeBackButtonPressed();
            return shouldPop;
          },
          child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            appBar: AppBar(
              title: Text(
                TIC_TAC_TOE,
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.blackColor,
                ),
              ),
              backgroundColor: AppColors.primaryColor,
              automaticallyImplyLeading: false,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    child: CustomTextInput(
                        state.playerOne,
                        'Player name',
                        'Player one',
                        playerOneTextController,
                        (val) => {
                              BlocProvider.of<GameBlocs>(context)
                                  .add(UpdatePlayerOneNameEvent(val)),
                            }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    child: CustomTextInput(
                        state.playerTwo,
                        'Player name',
                        'Player Two',
                        playerTwoTextController,
                        (val) => {
                              BlocProvider.of<GameBlocs>(context)
                                  .add(UpdatePlayerTwoNameEvent(val)),
                            }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    child: CustomRadioButton(
                        state.gameLevel,
                        game_level_options,
                        getStyles(),
                        (val) => {
                              BlocProvider.of<GameBlocs>(context)
                                  .add(UpdateGameLevelEvent(val)),
                            }),
                  ),
                ],
              ),
            ),
            floatingActionButton: SizedBox(
                width: 100,
                height: 40,
                child: FloatingActionButton(
                  onPressed: () => floatingButtonPressed(),
                  tooltip: 'Play Tic Tac Toe',
                  backgroundColor: AppColors.primaryColor,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    'START',
                    style: TextStyle(color: AppColors.blackColor),
                  ),
                )),
          ));
    });
  }
}
