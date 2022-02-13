import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateInput extends StatefulWidget {
  final String? label;
  final TextAlign? fieldTextAlign;
  final DateTime? initialValue;
  final Function onSave;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool includeTime;
  final Function validator;

  const CustomDateInput({
    Key? key,
    this.label,
    this.fieldTextAlign,
    this.initialValue,
    this.controller,
    this.keyboardType,
    this.includeTime = false,
    required this.validator,
    required this.onSave,
  }) : super(key: key);

  @override
  State<CustomDateInput> createState() => _CustomDateInputState();
}

class _CustomDateInputState extends State<CustomDateInput> {
  TextEditingController dateinput = TextEditingController();
  DateTime? date;
  @override
  void initState() {
    if (widget.initialValue != null) {
      date = widget.initialValue;
      dateinput.text = formateDate(date);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: dateinput,
      decoration: const InputDecoration(
        labelText: "Date",
      ),
      readOnly: true,
      onTap: pickDate,
      onSaved: (value) => widget.onSave(date),
      validator: (value) => widget.validator(value),
    );
  }

  String formateDate(DateTime? dateToFormat) {
    if (dateToFormat == null) return "";
    if (widget.includeTime) {
      return DateFormat('yyyy-MM-dd hh:mm a').format(dateToFormat);
    } else {
      return DateFormat('yyyy-MM-dd').format(dateToFormat);
    }
  }

  Future<void> pickDate() async {
    TimeOfDay? pickedTime;
    DateTime? pickedDate;

    pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate == null) return;

    if (widget.includeTime) {
      pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime == null) return;
    }

    date = widget.includeTime
        ? DateTime(pickedDate.year, pickedDate.month, pickedDate.day,
            pickedTime!.hour, pickedTime.minute)
        : pickedDate;
    setState(() => dateinput.text = formateDate(date));
  }
}
