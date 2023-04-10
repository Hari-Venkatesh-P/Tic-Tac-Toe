import 'package:tic_tac_toe/utils/constants.dart';

class GameStates{
  String gameLevel;
  String playerOne;
  String playerTwo;
  GameStates({required this.gameLevel, required this.playerOne, required this.playerTwo});
}

class InitialState extends GameStates{
  InitialState():super(gameLevel: easy, playerOne: EMPTY_STRING, playerTwo:  EMPTY_STRING);
}