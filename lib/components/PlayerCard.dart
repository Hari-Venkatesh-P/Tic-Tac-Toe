import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils/colors.dart';

class PlayerCard extends StatelessWidget {
  final String playerName;

  final bool isPlayerX;

  final Map<String, Color> cardStyles;

  const PlayerCard(this.playerName, this.cardStyles, this.isPlayerX);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        color: cardStyles!.containsKey('backgroundColor')
            ? cardStyles!['backgroundColor']!
            : AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 1,
          color: AppColors.blackColor,
        ),
      ),

      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            playerName,
            style: TextStyle(
              fontSize: 24,
              color: cardStyles!.containsKey('textColor')
                  ? cardStyles!['textColor']!
                  : AppColors.blackColor,
            ),
          ),
          Text(
            isPlayerX ? "Player X" : "Player O",
            style: TextStyle(
              fontSize: 18,
              color: cardStyles!.containsKey('textColor')
                  ? cardStyles!['textColor']!
                  : AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
