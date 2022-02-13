import 'package:flutter/material.dart';
import 'package:sary_assessment/constants.dart';

class FloatingButton extends StatelessWidget {
  final Widget icon;
  final String label;
  final void Function()? onPressed;
  const FloatingButton({
    Key? key,
    required this.icon,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: Text(
        label,
        style: const TextStyle(fontSize: 24, color: Colors.white),
      ),
      icon: icon,
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(xprimaryColor),
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
