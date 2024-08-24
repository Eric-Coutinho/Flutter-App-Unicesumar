import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  final IconData icon;
  final String label;
  bool hideText;
  TextForm(
      {super.key,
      required this.icon,
      required this.label,
      this.hideText = false});

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        obscureText: widget.hideText,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.hideText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      widget.hideText = !widget.hideText;
                    });
                  },
                  icon: const Icon(Icons.visibility))
              : null,
          labelText: widget.label,
          isDense: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
        ),
      ),
    );
  }
}
