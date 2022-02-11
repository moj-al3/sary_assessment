import 'package:flutter/material.dart';
import 'package:sary_assessment/components/custom_text.dart';

class CustomDropDownFormField<T> extends StatefulWidget {
  final List<T> list;
  final String label;
  final Function(T) mapper;
  final Function(T?) onSave;
  final Function(T?) validator;
  final int? initalIndex;
  final T? initalObject;
  const CustomDropDownFormField({
    Key? key,
    required this.label,
    required this.list,
    required this.mapper,
    required this.validator,
    required this.onSave,
    this.initalIndex,
    this.initalObject,
  }) : super(key: key);

  @override
  State<CustomDropDownFormField<T>> createState() =>
      _CustomDropDownFormFieldState<T>();
}

class _CustomDropDownFormFieldState<T>
    extends State<CustomDropDownFormField<T>> {
  late List<DropdownMenuItem<T>> dropDownList;
  T? currentItem;

  @override
  void initState() {
    dropDownList = widget.list
        .map(
          (item) => DropdownMenuItem<T>(
            value: item,
            child: Text(widget.mapper(item)),
          ),
        )
        .toList();
    if (widget.initalObject != null) {
      currentItem = widget.initalObject;
    } else if (widget.initalIndex != null) {
      currentItem = widget.list[widget.initalIndex!];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          widget.label,
          fontSize: 14,
          color: Colors.grey.shade900,
        ),
        DropdownButtonFormField<T>(
          hint: const Text("Please Select Item"),
          validator: (str) => widget.validator(str),
          onSaved: (item) => widget.onSave(item),
          isExpanded: true,
          value: currentItem,
          items: dropDownList,
          onChanged: (value) {
            setState(() {
              currentItem = value;
            });
          },
        )
      ],
    );
  }
}
