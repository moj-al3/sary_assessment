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
  final String? Function(String?)? validator;

  const CustomDateInput({
    Key? key,
    this.label,
    this.fieldTextAlign,
    this.initialValue,
    this.controller,
    this.keyboardType,
    this.includeTime = false,
    this.validator,
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
    date = widget.initialValue;
    dateinput.text = formateDate(date);
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
      validator: widget.validator,
    );
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
    //in case the user canceld picking the date there is no need to continue
    if (pickedDate == null) return;

    if (widget.includeTime) {
      pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime == null) return;
    }
    //in case the date picker includes time then merge it with the picked date
    if (widget.includeTime) {
      date = DateTime(pickedDate.year, pickedDate.month, pickedDate.day,
          pickedTime!.hour, pickedTime.minute);
    } else {
      date = pickedDate;
    }
    setState(() => dateinput.text = formateDate(date));
  }

  String formateDate(DateTime? dateToFormat) {
    if (dateToFormat == null) return "";
    if (widget.includeTime) {
      return DateFormat('yyyy-MM-dd hh:mm a').format(dateToFormat);
    } else {
      return DateFormat('yyyy-MM-dd').format(dateToFormat);
    }
  }
}
