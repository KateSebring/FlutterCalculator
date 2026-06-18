import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String buttonText;
  final void Function(String) onPressed;

  const CalcButton({super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(buttonText),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 24,
          color: Colors.blue[900],
        ),
      ),
    );
  }
}