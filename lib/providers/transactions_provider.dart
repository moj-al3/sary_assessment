import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sary_assessment/core/util/datetime_extensions.dart';
import 'package:sary_assessment/models/item.dart';
import 'package:sary_assessment/models/transaction.dart';

class TransactionsProvider with ChangeNotifier {
  final box = Hive.box("transactionsBox");
  List<Transaction> get transactions => box.values.toList().cast();

  Map filters = {
    "quantity": null,
    "transactionType": null,
    "date": null,
  };
  String query = "";

  void updateFilters(Map newFilters) {
    filters = newFilters;
    notifyListeners();
  }

  void updateQuery(String newQuery) {
    query = newQuery;
    notifyListeners();
  }

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

  List<Transaction> getFilterd() {
    List<Transaction> filterdList = transactions;

    if (filters["quantity"] != null) {
      filterdList = filterdList
          .where((element) => element.quantity == filters["quantity"])
          .toList();
    }
    if (filters["transactionType"] != null) {
      filterdList = filterdList
          .where((element) => element.type == filters["transactionType"])
          .toList();
    }

    if (filters["date"] != null) {
      filterdList = filterdList
          .where((element) => element.date.isSameDate(filters["date"]))
          .toList();
    }

    if (query.isNotEmpty) {
      filterdList = filterdList.where((element) {
        final elementLower = element.item.name.toLowerCase();
        final queryLower = query.toLowerCase();
        return elementLower.contains(queryLower);
      }).toList();
    }

    return filterdList;
  }

  void clearFilters() {
    filters = {
      "quantity": null,
      "transactionType": null,
      "date": null,
    };
    notifyListeners();
  }
}
