import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateInput extends StatefulWidget {
  final String? label;
  final TextAlign? fieldTextAlign;
  final String? initialValue;
  final Function onSave;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const CustomDateInput({
    Key? key,
    this.label,
    this.fieldTextAlign,
    this.initialValue,
    this.controller,
    this.keyboardType,
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
    dateinput.text = "";
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
      validator: (String? value) {
        if (value == null || value.isEmpty) return "Please Pick a Date";
        return null;
      },
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
    if (pickedDate != null) {
      pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
    }
    if (pickedDate != null && pickedTime != null) {
      date = pickedDate = DateTime(pickedDate.year, pickedDate.month,
          pickedDate.day, pickedTime.hour, pickedTime.minute);
      String formattedDate = DateFormat('yyyy-MM-dd hh:mm a').format(date!);
      setState(() {
        dateinput.text = formattedDate;
      });
    } else {
      date = null;
      setState(() {
        dateinput.text = "";
      });
    }
  }
}
