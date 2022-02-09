import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sary_assessment/models/item.dart';

class ItemsProvider with ChangeNotifier {
  final box = Hive.box("itemsBox");
  List<Item> get items => box.values.toList().cast();
  Future<void> addItem({
    required String name,
    required String sku,
    required String description,
    required String imagePath,
    required double price,
  }) async {
    //add dummy data to reserve a key to be used for the item as id
    int id = await box.add("");
    Item item = Item(
      id: id,
      name: "Barbican Beer Drink",
      price: 92.61,
      sku: "PRO-SA1",
      description: "320 x 6 ml",
      image: "assets/images/Barbican.png",
    );
    await box.put(id, item);
    notifyListeners();
  }

  Item? getItem(int id) {
    return box.get(id);
  }

  Future<void> deleteItem(int id) async {
    await box.delete(id);
    notifyListeners();
  }

  Future<void> deleteAll() async {
    await box.clear();
    notifyListeners();
  }
}
