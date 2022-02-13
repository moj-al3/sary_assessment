import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sary_assessment/components/components.dart';
import 'package:sary_assessment/constants.dart';
import 'package:sary_assessment/core/util/validators.dart';
import 'package:sary_assessment/providers/transactions_provider.dart';

class FiltersMenu extends StatelessWidget {
  FiltersMenu({
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int? quantity;
  String? transactionType;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    Map filters = Provider.of<TransactionsProvider>(context).filters;
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  "Filters",
                  fontSize: 24,
                ),
                TextButton(
                  child: const CustomText(
                    "Clear",
                    color: Colors.red,
                  ),
                  onPressed: () {
                    Provider.of<TransactionsProvider>(context, listen: false)
                        .clearFilters();
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            CustomTextFormField(
              label: "Quantity",
              keyboardType: TextInputType.number,
              initialValue: filters["quantity"] != null
                  ? filters["quantity"].toString()
                  : "",
              validator: Validators.isNumber,
              onSave: (String value) => quantity = int.tryParse(value),
            ),
            CustomDropDownFormField<String>(
              label: "Transaction Type",
              list: const ["inbound", "outbound"],
              mapper: (type) => type,
              initalObject: filters["transactionType"],
              onSave: (value) => transactionType = value!,
            ),
            CustomDateInput(
              initialValue: filters["date"],
              onSave: (date) => selectedDate = date,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: "Apply",
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Provider.of<TransactionsProvider>(context, listen: false)
                          .updateFilters({
                        "quantity": quantity,
                        "transactionType": transactionType,
                        "date": selectedDate,
                      });
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
