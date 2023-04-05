import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils/colors.dart';

class XOGrid extends StatelessWidget {
  final String text;

  final Map<String, Color> gridStyles;

  final VoidCallback onGridTapped;

  const XOGrid(this.text, this.gridStyles, this.onGridTapped);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onGridTapped,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.blackColor,
            ),
            color: gridStyles!.containsKey('backgroundColor')
                ? gridStyles!['backgroundColor']!
                : AppColors.blackColor,
          ),
          child: Center(
            child: Text(
              '${text}',
              style: TextStyle(
                fontSize: 32,
                color: gridStyles!.containsKey('textColor')
                    ? gridStyles!['textColor']!
                    : AppColors.secondaryColor,
              ),
            ),
          ),
        ));
  }
}
