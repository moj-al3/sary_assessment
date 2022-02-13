import 'package:flutter/material.dart';

class CustomDropDownFormField<T> extends StatefulWidget {
  final List<T> list;
  final String label;
  final Function(T) mapper;

  final int? initalIndex;
  final T? initalObject;
  final Function(T?) onSave;
  final String? Function(T?)? validator;
  const CustomDropDownFormField({
    Key? key,
    required this.label,
    required this.list,
    required this.mapper,
    required this.onSave,
    this.validator,
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
    //use the mapper function provided by the user to create the list of the dropdown
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
    return DropdownButtonFormField<T>(
      decoration: InputDecoration(label: Text(widget.label)),
      hint: const Text("Please Select Item"),
      validator: widget.validator,
      onSaved: (item) => widget.onSave(item),
      isExpanded: true,
      value: currentItem,
      items: dropDownList,
      onChanged: (value) {
        setState(() {
          currentItem = value;
        });
      },
    );
  }
}
