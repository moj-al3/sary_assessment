import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sary_assessment/components/components.dart';
import 'package:sary_assessment/models/item.dart';
import 'package:sary_assessment/providers/items_provider.dart';
import 'package:sary_assessment/providers/transactions_provider.dart';

class AddTransactionDialog extends StatelessWidget {
  final String type;
  const AddTransactionDialog({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    int quantity = 0;
    Item? selectedItem;
    DateTime? selectedDate;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text('New $type Transaction'),
        actions: [
          IconButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                await Provider.of<TransactionsProvider>(context, listen: false)
                    .addTransaction(
                  type: type,
                  item: selectedItem!,
                  quantity: quantity,
                  date: selectedDate!,
                );
                Navigator.pop(context, true);
              }
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomDropDownFormField<Item>(
                  label: "Item",
                  list: Provider.of<ItemsProvider>(context).items,
                  mapper: (item) => item.name,
                  onSave: (value) {
                    selectedItem = value;
                  },
                  validator: (value) {
                    if (value == null) return "required";
                    return null;
                  },
                ),
                CustomTextFormField(
                  label: 'Quantity',
                  keyboardType: TextInputType.number,
                  onSave: (String value) {
                    quantity = int.parse(value);
                  },
                  validator: (String value) {
                    if (value.isEmpty) return "Required";
                    if (int.tryParse(value) == null) {
                      return "Only Whole numbers are accepted";
                    }
                    return null;
                  },
                ),
                CustomDateInput(
                  includeTime: true,
                  validator: (String? value) {
                    if (value == null || value.isEmpty)
                      return "Please Pick a Date";
                    return null;
                  },
                  onSave: (value) {
                    selectedDate = value;
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
