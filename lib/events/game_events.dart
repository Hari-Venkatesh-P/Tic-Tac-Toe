
abstract class GameEvents{}
class UpdateGameLevelEvent extends GameEvents{
  String gameLevel;
  UpdateGameLevelEvent(this.gameLevel);
}
class UpdatePlayerOneNameEvent extends GameEvents{
  String playerName;
  UpdatePlayerOneNameEvent(this.playerName);
}

class UpdatePlayerTwoNameEvent extends GameEvents{
  String playerName;
  UpdatePlayerTwoNameEvent(this.playerName);
}
