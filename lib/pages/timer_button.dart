import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const TimerButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        side: const BorderSide(width: 2, color: Colors.blue),
      ),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(fontSize: 20)),
    );
  }
}
