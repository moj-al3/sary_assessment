import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sary_assessment/constants.dart';
import 'package:sary_assessment/core/util/custom_toast.dart';
import 'package:sary_assessment/models/item.dart';
import 'package:sary_assessment/providers/items_provider.dart';

class ItemCard extends StatelessWidget {
  final String appPath;
  final Item item;
  const ItemCard({
    Key? key,
    required this.appPath,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Dismissible(
        confirmDismiss: (direction) => deleteItem(context),
        onDismissed: (diraction) {},
        background: Container(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(
                  Icons.delete,
                  color: Colors.white,
                )
              ],
            ),
          ),
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
        ),
        key: Key(item.id.toString()),
        direction: DismissDirection.endToStart,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Image.asset(
                  "$appPath/${item.image}",
                  width: 125,
                  height: 75,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          item.name,
                          softWrap: false,
                          style: const TextStyle(
                            color: xHeadingFontColor,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.sku,
                        style: const TextStyle(
                          color: xnormalFontColor,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item.description,
                        softWrap: false,
                        style: const TextStyle(
                          color: xnormalFontColor,
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${item.price} SR",
                        style: const TextStyle(
                            color: xHeadingFontColor,
                            fontSize: 11.53,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> deleteItem(context) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are You Sure?'),
        content: const Text("Do you want to delete this item"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () async {
              await Provider.of<ItemsProvider>(context, listen: false)
                  .deleteItem(item.id);
              CustomToast.showToast(
                context,
                msg: "Item Deleted",
                duration: const Duration(seconds: 3),
                textColor: Colors.white,
                backgroundColor: Colors.red,
              );
              Navigator.pop(context, true);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
