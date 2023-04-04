import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/colors.dart';

class XOGrid extends StatefulWidget {

  final String text;

  final Map<String, Color>? gridStyles;

  final VoidCallback onGridTapped;

  const XOGrid({Key? key, required this.text, required this.onGridTapped, this.gridStyles}) : super(key: key);


  @override
  State<XOGrid> createState() => _XOGridState();
}

class _XOGridState  extends State<XOGrid> {



  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: widget.onGridTapped,
      child : Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 1,
            color: widget.gridStyles!.containsKey('backgroundColor') ? widget.gridStyles!['backgroundColor']! : AppColors.blackColor,
          ),
          color: AppColors.blackColor,
        ),
        child: Center(
          child: Text(
            '${widget.text}',
            style: TextStyle(
              fontSize: 32,
              color: widget.gridStyles!.containsKey('textColor') ? widget.gridStyles!['textColor']! : AppColors.secondaryColor,
            ),
          ),
        ),
      )
    );

  }
}