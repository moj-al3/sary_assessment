import 'package:flutter/material.dart';
import 'package:sary_assessment/components/components.dart';
import 'package:sary_assessment/constants.dart';

class Badge extends StatelessWidget {
  final String title;
  final String value;

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
        CustomText(
          value,
          color: xHeadingFontColor,
          fontSize: 19,
          weight: FontWeight.w900,
        ),
        CustomText(
          title,
          fontSize: 16,
        ),
      ],
    );
  }
}
