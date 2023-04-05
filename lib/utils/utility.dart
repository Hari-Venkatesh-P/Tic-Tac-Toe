import 'package:tic_tac_toe/utils/constants.dart';

int getSum(n)
{
  var sum = 0;
  while (n != 0) {
    sum = (sum + (n % 10).toInt()).toInt();
    n = (n / 10).toInt();
  }
  return sum;
}

int getMatrixNumberForIndex(int index, int rows){
  var updatedIndex = index + 1;
  var unitDigit = updatedIndex % rows != 0 ? updatedIndex % rows : rows;
  var tensDigit = index ~/ rows + 1;
  return (tensDigit *10) + unitDigit;
}

int getIndexForMatrixNumber(int matrixNumber, int rows){
  var unitDigit = matrixNumber % 10 ;
  var tensDigit = (matrixNumber / 10) > 1 ? (matrixNumber / 10).toInt() - 1 : 0;
  return (tensDigit * rows) + unitDigit;
}


int getRowCountFromGameLevel(String gameLevel){
    if(gameLevel == easy){
      return 3;
    } else if(gameLevel == medium){
      return 4;
    } else {
      return 5;
    }
}