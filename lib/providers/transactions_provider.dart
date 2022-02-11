import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sary_assessment/models/item.dart';
import 'package:sary_assessment/models/transaction.dart';

class TransactionsProvider with ChangeNotifier {
  final box = Hive.box("transactionsBox");
  List<Transaction> get transactions => box.values.toList().cast();
  Future<void> addTransaction({
    required String type,
    required Item item,
    required int quantity,
    required DateTime date,
  }) async {
    //add dummy data to reserve a key to be used for the item as id
    int id = await box.add("");
    Transaction transaction = Transaction(
      id: id,
      type: type,
      item: item,
      quantity: quantity,
      date: date,
    );
    await box.put(id, transaction);
    notifyListeners();
  }

  Transaction? getTransaction(int id) {
    return box.get(id);
  }

  Future<void> deleteTransaction(int id) async {
    await box.delete(id);
    notifyListeners();
  }

  Future<void> deleteAll() async {
    await box.clear();
    notifyListeners();
  }
}
