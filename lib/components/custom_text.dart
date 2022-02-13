import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment? alignment;
  final int maxLine;
  final double height;
  final FontWeight weight;

  const CustomText(
    this.text, {
    Key? key,
    this.fontSize = 16,
    this.color = Colors.black,
    this.alignment,
    this.maxLine = 20,
    this.height = 1,
    this.weight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          height: height,
          fontSize: fontSize,
          fontWeight: weight,
        ),
        maxLines: maxLine,
      ),
    );
  }
}
