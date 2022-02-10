import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sary_assessment/components/components.dart';
import 'package:sary_assessment/providers/items_provider.dart';

class AddItemDialog extends StatelessWidget {
  const AddItemDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String name = "", description = "", sku = "", selectedImagePath = "";
    double price = 0;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Add New Item'),
        actions: [
          IconButton(
            onPressed: () async {
              if (_formKey.currentState!.validate() &&
                  selectedImagePath.isNotEmpty) {
                _formKey.currentState!.save();
                await Provider.of<ItemsProvider>(context, listen: false)
                    .addItem(
                        name: name,
                        sku: sku,
                        description: description,
                        imagePath: selectedImagePath,
                        price: price);
                Navigator.pop(context);
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
          child: Column(
            children: [
              CustomImageInput(
                onImageSelect: (File newLogo) =>
                    selectedImagePath = newLogo.path,
              ),
              CustomTextFormField(
                label: 'Sku',
                onSave: (value) {
                  sku = value;
                },
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 6,
              ),
              CustomTextFormField(
                label: 'Name',
                onSave: (value) {
                  name = value;
                },
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 6,
              ),
              CustomTextFormField(
                label: 'Description',
                onSave: (String value) {
                  description = value;
                },
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 6,
              ),
              CustomTextFormField(
                label: 'Price',
                onSave: (String value) {
                  price = double.parse(value);
                },
                validator: (String value) {
                  if (value.isEmpty) return "Required";
                  if (double.tryParse(value) == null) {
                    return "Only numbers are accepted";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
