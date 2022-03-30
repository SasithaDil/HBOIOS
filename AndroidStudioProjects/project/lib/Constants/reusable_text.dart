
import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final Color colour;
  const ReusableText({
    Key? key,
    required this.text,
    required this.size,
    required this.weight,
    required this.colour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, fontWeight: weight, color: colour),
    );
  }
}
