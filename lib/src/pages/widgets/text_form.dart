import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/custom_colors.dart';

class TextForm extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;
  final String? initialValue;
  final bool isReadOnly;
  final String? Function(String?)? validate;
  final TextEditingController? controller;

  const TextForm({
    super.key,
    required this.icon,
    required this.label,
    this.isSecret = false,
    this.initialValue,
    this.isReadOnly = false,
    this.validate,
    this.controller,
  });

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  bool isObscure = false;
  @override
  void initState() {
    super.initState();
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: TextFormField(
          initialValue: widget.initialValue,
          readOnly: widget.isReadOnly,
          style: TextStyle(color: CustomColors.inputTextColor),
          obscureText: isObscure,
          validator: widget.validate,
          controller: widget.controller,
          decoration: InputDecoration(
            prefixIcon: Icon(widget.icon),
            suffixIcon: widget.isSecret
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(
                        isObscure ? Icons.visibility : Icons.visibility_off))
                : null,
            labelText: widget.label,
            isDense: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
            labelStyle: TextStyle(color: CustomColors.inputTextColor),
          ),
        ));
  }
}
