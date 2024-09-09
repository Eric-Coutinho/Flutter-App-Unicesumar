import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/custom_colors.dart';

class TituloCategoria extends StatelessWidget {
  const TituloCategoria({super.key, required this.categoria, required this.onPressed, required this.isSelected});

  final String categoria;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Align(
        alignment: Alignment.center,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected ? CustomColors.customizedAppColor : Colors.transparent,
            ),
            child: Text(
              categoria,
              style: TextStyle(
                  color:  isSelected ? Colors.white : CustomColors.customizedContrastColor, 
                  fontWeight: FontWeight.bold, 
                  fontSize: 16
                  ),
            )),
      ),
    );
  }
}
