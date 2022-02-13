import 'package:flutter/material.dart';
import 'package:sary_assessment/constants.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final void Function() onPress;

  const CustomButton({
    Key? key,
    required this.onPress,
    this.text = 'Write text',
    this.color = xprimaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        padding:
            MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      onPressed: onPress,
      child: CustomText(
        text,
        alignment: Alignment.center,
        color: Colors.white,
      ),
    );
  }
}
