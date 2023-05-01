import 'package:flutter/material.dart';

class Lap extends StatelessWidget {
  final int number;
  final String text;

  const Lap({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text('Lap $number'),
          const Spacer(),
          Text(text),
          const Spacer(),
        ],
      ),
    );
  }
}
