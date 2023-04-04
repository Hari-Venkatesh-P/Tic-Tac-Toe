import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/XOGrid.dart';
import 'package:tic_tac_toe/constants/colors.dart';

class GameScreen extends StatefulWidget {

  final int rows;

  const GameScreen({Key? key, required this.rows}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState  extends State<GameScreen> {

  int getMatrixNumberForIndex(int index, int rows){
    var updatedIndex = index + 1;
    var unitDigit = updatedIndex % rows != 0 ? updatedIndex % rows : rows;
    var tensDigit = (index / rows).toInt() + 1;
    return (tensDigit *10) + unitDigit;
  }

  Map<String, Color> getGridStyles(int matrixNumber) {
    var gridStyles =  Map<String, Color>();
    gridStyles['backgroundColor'] = matrixNumber % 2 == 0 ? AppColors.accentColor :  AppColors.secondaryColor;
    gridStyles['textColor'] = matrixNumber % 2 == 0 ? AppColors.secondaryColor :  AppColors.primaryColor;
    return gridStyles;
  }

  int getSum(n)
  {
    var sum = 0;
    while (n != 0) {
      sum = (sum + (n % 10).toInt()).toInt();
      n = (n / 10).toInt();
    }
    return sum;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.builder(
            itemCount: widget.rows * widget.rows,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.rows,
            ),
            itemBuilder: (BuildContext context, int index) {
              var matrixNumber =  getMatrixNumberForIndex(index, widget.rows);
              return XOGrid(
                  text: matrixNumber.toString(),
                  gridStyles: getGridStyles(getSum(matrixNumber)),
                  onGridTapped: () => {
              });
            }),
      ),
    );
  }
}