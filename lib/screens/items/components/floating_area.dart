import 'package:flutter/material.dart';
import 'package:sary_assessment/components/components.dart';
import 'package:sary_assessment/core/util/custom_toast.dart';
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
                  var result = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const AddItemDialog(),
                      fullscreenDialog: true,
                    ),
                  );
                  if (result == true) {
                    CustomToast.showToast(
                      context,
                      msg: "Item added",
                      duration: const Duration(seconds: 3),
                      textColor: Colors.white,
                      backgroundColor: Colors.green,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
