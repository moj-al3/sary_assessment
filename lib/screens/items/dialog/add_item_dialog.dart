import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sary_assessment/components/components.dart';
import 'package:sary_assessment/core/util/input_validator.dart';
import 'package:sary_assessment/providers/items_provider.dart';

class AddItemDialog extends StatelessWidget {
  const AddItemDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String name = "", description = "", sku = "", selectedFileName = "";
    double price = 0;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const CustomText('New Item'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () async {
              if (_formKey.currentState!.validate() &&
                  selectedFileName.isNotEmpty) {
                _formKey.currentState!.save();
                await Provider.of<ItemsProvider>(context, listen: false)
                    .addItem(
                  name: name,
                  sku: sku,
                  description: description,
                  imagePath: selectedFileName,
                  price: price,
                );
                Navigator.pop(context, true);
              }
            },
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              children: [
                CustomImageInput(
                  onImageSelect: (fileName) => selectedFileName = fileName,
                ),
                CustomTextFormField(
                  label: 'Sku',
                  validator: InputValidator.isRequiredText,
                  onSave: (value) => sku = value!,
                ),
                const SizedBox(
                  height: 6,
                ),
                CustomTextFormField(
                  label: 'Name',
                  validator: InputValidator.isRequiredText,
                  onSave: (value) => name = value!,
                ),
                const SizedBox(
                  height: 6,
                ),
                CustomTextFormField(
                  label: 'Description',
                  validator: InputValidator.isRequiredText,
                  onSave: (value) => description = value!,
                ),
                const SizedBox(
                  height: 6,
                ),
                CustomTextFormField(
                  label: 'Price',
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  validator: InputValidator.isRequiredNumber,
                  onSave: (value) => price = double.parse(value!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
