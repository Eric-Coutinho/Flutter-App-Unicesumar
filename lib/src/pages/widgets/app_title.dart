import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/custom_colors.dart';

class AppTitle extends StatelessWidget {
  final Color? titleColor;
  final double fontSize;

  const AppTitle({
    super.key, this.titleColor, this.fontSize = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
      style: TextStyle(fontSize: fontSize),
      children: [
        TextSpan(
            text: 'Hortifruti ',
            style: TextStyle(
                color: titleColor ?? CustomColors.customizedAppColor,
                fontWeight: FontWeight.bold)),
        TextSpan(
            text: 'Comunitária',
            style: TextStyle(color: CustomColors.customizedContrastColor)),
      ],
    ));
  }
}
