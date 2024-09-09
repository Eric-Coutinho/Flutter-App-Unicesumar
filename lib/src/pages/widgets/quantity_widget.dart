// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/custom_colors.dart';

class QuantityWidget extends StatelessWidget {
  final int value;
  final String unity;
  final Function(int amount) result;
  final bool isRemovable;

  const QuantityWidget(
      {super.key,
      required this.value,
      required this.unity,
      required this.result,
      this.isRemovable = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ]),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Button_Quantity(
            color: !isRemovable || value > 1 ? Colors.grey : Colors.red,
            icon:
                !isRemovable || value > 1 ? Icons.remove : Icons.delete_forever,
            onPressed: () {
              if (value == 1 && !isRemovable) return;

              int total = value - 1;
              result(total);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "$value $unity",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _Button_Quantity(
            color: CustomColors.customizedAppColor,
            icon: Icons.add,
            onPressed: () {
              int total = value + 1;
              result(total);
            },
          ),
        ],
      ),
    );
  }
}

class _Button_Quantity extends StatelessWidget {
  const _Button_Quantity({
    required this.color,
    required this.icon,
    required this.onPressed,
  });
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onPressed,
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 17,
          ),
        ),
      ),
    );
  }
}
