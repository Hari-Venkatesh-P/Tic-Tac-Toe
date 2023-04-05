import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/PlayerCard.dart';
import 'package:tic_tac_toe/components/XOGrid.dart';
import 'package:tic_tac_toe/utils/colors.dart';
import 'package:tic_tac_toe/utils/constants.dart';
import 'package:tic_tac_toe/utils/utility.dart';

class GameScreen extends StatefulWidget {
  final int rows;

  final String playerOne;

  final String playerTwo;

  const GameScreen(
      {Key? key,
      required this.rows,
      required this.playerOne,
      required this.playerTwo})
      : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState(rows: this.rows);
}

List<String> getInitialValueHolderData(int number) {
  List<String> valueHolder = List.filled(number * number, EMPTY_STRING);
  return valueHolder;
}

class _GameScreenState extends State<GameScreen> {
  bool isPlayerOneEnabled = true;
  int rows;
  List<String> valueHolder = [];

  @override
  void initState() {
    super.initState();
    valueHolder = getInitialValueHolderData(rows);
  }

  _GameScreenState({required this.rows});

  Map<String, Color> getGridStyles(int matrixNumber) {
    var gridStyles = Map<String, Color>();
    gridStyles['backgroundColor'] =
        matrixNumber % 2 == 0 ? AppColors.primaryColor : AppColors.whiteColor;
    gridStyles['textColor'] =
        matrixNumber % 2 == 0 ? AppColors.blackColor : AppColors.blackColor;
    return gridStyles;
  }

  Map<String, Color> getPlayerCardStyles(bool isPlayerX) {
    var cardStyles = Map<String, Color>();
    var flag = isPlayerX ? isPlayerOneEnabled : !isPlayerOneEnabled;
    cardStyles['backgroundColor'] =
        flag ? AppColors.primaryColor : AppColors.whiteColor;
    cardStyles['textColor'] =
        flag ? AppColors.blackColor : AppColors.blackColor;
    return cardStyles;
  }

  void onXOGridTap(int index) {
    var char = isPlayerOneEnabled ? 'X' : 'O';
    if (valueHolder[index] == '') {
      setState(() {
        valueHolder[index] = char;
        isPlayerOneEnabled = !isPlayerOneEnabled;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: GridView.builder(
                    itemCount: 2,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return PlayerCard(
                        index == 0 ? widget.playerOne : widget.playerTwo,
                        getPlayerCardStyles(index == 0),
                        index == 0,
                      );
                    })),
            Expanded(
                flex: 4,
                child: GridView.builder(
                    itemCount: widget.rows * widget.rows,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: widget.rows,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      var matrixNumber =
                          getMatrixNumberForIndex(index, widget.rows);
                      var index1 =
                          getIndexForMatrixNumber(matrixNumber, widget.rows);
                      return XOGrid(
                          valueHolder.isNotEmpty ? valueHolder[index] : '',
                          getGridStyles(getSum(matrixNumber)),
                          () => {onXOGridTap(index)});
                    })),
          ],
        ),
      ),
    );
  }
}
