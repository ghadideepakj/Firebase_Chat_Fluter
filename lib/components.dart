import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  Buttons(
      {required this.colorString,
      required this.textString,
      required this.onPressed});
  final Color colorString;
  final String textString;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Material(
        elevation: 5.0,
        color: colorString,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 50.0,
          child: Text(textString),
        ),
      ),
    );
  }
}
