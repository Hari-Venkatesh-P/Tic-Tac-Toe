import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils/colors.dart';

class CustomRadioButton extends StatelessWidget {
  final String value;

  final List<String> options;

  final Map<String, Color> cardStyles;

  final ValueChanged<String> onRadioButtonSelected;

  const CustomRadioButton(this.value, this.options, this.cardStyles, this.onRadioButtonSelected, {super.key});

  Widget radioButton(String title, ValueChanged<String> onRadioButtonSelected, isOptionSelected) {
    return GestureDetector(
        onTap: () => onRadioButtonSelected(title),
        child: Container(
          padding: EdgeInsets.all(10),
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              width: 1,
              color: AppColors.primaryColor,
            ),
            color: isOptionSelected ? cardStyles!['selectedBackgroundColor']! : AppColors.whiteColor,
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ));
  }

  List<Widget> generateRadioButtons(String val) {
    var list = options.map<List<Widget>>(
      (data) {
        var widgetList = <Widget>[];
        widgetList
            .add(radioButton(data, (val) => onRadioButtonSelected(val), value == data));
        return widgetList;
      },
    ).toList();
    var flat = list.expand((i) => i).toList();
    return flat;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: generateRadioButtons(value),
    );
  }
}
