import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CalcButton({super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
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

class CalcField extends StatefulWidget {
  const CalcField({super.key});

  @override
  Widget build(BuildContext context){
    return Placeholder();
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}