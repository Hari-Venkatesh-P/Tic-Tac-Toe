import 'package:bloc/bloc.dart';
import 'package:tic_tac_toe/events/game_events.dart';
import 'package:tic_tac_toe/state/game_states.dart';

class GameBlocs extends Bloc<GameEvents, GameStates>{
  GameBlocs():super(InitialState()){
    on<UpdateGameLevelEvent>((event, emit){
      emit(GameStates(gameLevel: event.gameLevel, playerOne: state.playerOne, playerTwo: state.playerTwo));
    });
    on<UpdatePlayerOneNameEvent>((event, emit){
      emit(GameStates(gameLevel: state.gameLevel, playerOne: event.playerName, playerTwo: state.playerTwo));
    });
    on<UpdatePlayerTwoNameEvent>((event, emit){
      emit(GameStates(gameLevel: state.gameLevel, playerOne: state.playerOne, playerTwo: event.playerName));
    });
  }
}