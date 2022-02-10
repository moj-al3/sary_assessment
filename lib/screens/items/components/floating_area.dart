import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sary_assessment/components/components.dart';
import 'package:sary_assessment/providers/items_provider.dart';
import 'package:sary_assessment/screens/items/dialog/add_item_dialog.dart';

class FloatingArea extends StatelessWidget {
  const FloatingArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FloatingButton(
                label: "Add Item",
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const AddItemDialog(),
                        fullscreenDialog: true),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
