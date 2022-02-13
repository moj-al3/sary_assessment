import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sary_assessment/components/components.dart';
import 'package:sary_assessment/core/util/input_validator.dart';
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
        title: CustomText('New $type Transaction'),
        actions: [
          IconButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Provider.of<TransactionsProvider>(context, listen: false)
                    .addTransaction(
                      type: type,
                      item: selectedItem!,
                      quantity: quantity,
                      date: selectedDate!,
                    )
                    .then(
                      (value) => Navigator.pop(context, true),
                    );
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
                  validator: InputValidator.isRequiredObject,
                  onSave: (value) => selectedItem = value,
                ),
                CustomTextFormField(
                  label: 'Quantity',
                  keyboardType: TextInputType.number,
                  validator: InputValidator.isRequiredNumber,
                  onSave: (value) => quantity = int.parse(value!),
                ),
                CustomDateInput(
                  includeTime: true,
                  validator: InputValidator.isRequiredObject,
                  onSave: (value) => selectedDate = value,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
