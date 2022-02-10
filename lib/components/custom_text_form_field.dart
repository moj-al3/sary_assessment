import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final TextAlign? fieldTextAlign;
  final String? initialValue;
  final bool hidden;

  final Function onSave;
  final Function validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    Key? key,
    this.label,
    this.fieldTextAlign,
    this.initialValue,
    this.hidden = false,
    this.controller,
    this.keyboardType,
    required this.onSave,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          textAlign: fieldTextAlign ?? TextAlign.start,
          initialValue: initialValue,
          keyboardType: keyboardType,
          controller: controller,
          onSaved: (str) => onSave(str),
          validator: (str) => validator(str),
          obscureText: hidden,
          decoration: InputDecoration(
            label: label != null ? CustomText(label!) : null,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            fillColor: Colors.white,
          ),
        )
      ],
    );
  }
}
