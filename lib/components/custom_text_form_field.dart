import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final TextAlign? fieldTextAlign;
  final String? initialValue;
  final bool hidden;
  final String? Function(String?)? validator;
  final void Function(String?) onSave;

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
    this.validator,
    required this.onSave,
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
          onSaved: onSave,
          validator: validator,
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
