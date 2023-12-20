import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField(
      {super.key,
      required this.onChanged,
      this.error,
      this.hintText,
      required String initValue});

  final Function(String) onChanged;
  final String? error, hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: hintText,
            errorText: error,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
      ),
    );
  }
}
