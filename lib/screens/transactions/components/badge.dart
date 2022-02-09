import 'package:flutter/material.dart';
import 'package:sary_assessment/constants.dart';

class Badge extends StatelessWidget {
  final String value;
  final String title;
  const Badge({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: xHeadingFontColor,
            fontSize: 19,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
