import 'package:flutter/material.dart';
import 'package:sary_assessment/models/item.dart';

class ItemsProvider with ChangeNotifier {
  final List<Item> _items = [
    Item(
      id: 1,
      name: "Barbican Beer Drink",
      price: 92.61,
      sku: "PRO-SA1",
      description: "320 x 6 ml",
      image: "assets/images/Barbican.png",
    ),
    Item(
      id: 2,
      name: "Afia Corn Oil",
      price: 12.13,
      sku: "PRO-SA2",
      description: "6 x 320 ml",
      image: "assets/images/Afia.png",
    ),
    Item(
      id: 3,
      name: "Pringles Barbeque Potato Chips",
      price: 100.25,
      sku: "PRO-SA3",
      description: "165 GM x 19",
      image: "assets/images/Pringles.png",
    ),
    Item(
      id: 4,
      name: "Barbican Beer Drink",
      price: 92.61,
      sku: "PRO-SA4",
      description: "320 x 6 ml",
      image: "assets/images/Barbican.png",
    ),
    Item(
      id: 5,
      name: "Afia Corn Oil",
      price: 12.13,
      sku: "PRO-SA5",
      description: "6 x 320 ml",
      image: "assets/images/Afia.png",
    ),
    Item(
      id: 6,
      name: "Pringles Barbeque Potato Chips",
      price: 100.25,
      sku: "PRO-SA6",
      description: "165 GM x 19",
      image: "assets/images/Pringles.png",
    ),
  ];

  List<Item> get items => [..._items];

  void popItem() {
    if (_items.isEmpty) return;
    _items.removeLast();
    notifyListeners();
  }
}
