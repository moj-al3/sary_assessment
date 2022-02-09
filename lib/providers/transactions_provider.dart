import 'package:flutter/material.dart';
import 'package:sary_assessment/models/transaction.dart';

class TransactionsProvider with ChangeNotifier {
  final _transactions = [
    Transaction(
      id: 1,
      type: "inbound",
      itemId: 2,
      quantity: 1,
      date: "20/01/2022",
    ),
    Transaction(
      id: 2,
      type: "outbound",
      itemId: 2,
      quantity: 45,
      date: "20/01/2022",
    ),
    Transaction(
      id: 3,
      type: "inbound",
      itemId: 2,
      quantity: 45,
      date: "20/01/2022",
    ),
    Transaction(
      id: 3,
      type: "inbound",
      itemId: 2,
      quantity: 45,
      date: "20/01/2022",
    ),
    Transaction(
      id: 3,
      type: "inbound",
      itemId: 2,
      quantity: 45,
      date: "20/01/2022",
    ),
    Transaction(
      id: 3,
      type: "inbound",
      itemId: 2,
      quantity: 45,
      date: "20/01/2022",
    ),
    Transaction(
      id: 1,
      type: "inbound",
      itemId: 1,
      quantity: 45,
      date: "20/01/2022",
    ),
    Transaction(
      id: 2,
      type: "outbound",
      itemId: 2,
      quantity: 45,
      date: "20/01/2022",
    ),
    Transaction(
      id: 3,
      type: "inbound",
      itemId: 2,
      quantity: 45,
      date: "20/01/2022",
    ),
    Transaction(
      id: 3,
      type: "inbound",
      itemId: 2,
      quantity: 45,
      date: "20/01/2022",
    ),
    Transaction(
      id: 3,
      type: "inbound",
      itemId: 2,
      quantity: 45,
      date: "20/01/2022",
    ),
    Transaction(
      id: 3,
      type: "inbound",
      itemId: 2,
      quantity: 45,
      date: "20/01/2022",
    ),
  ];

  List<Transaction> get transactions => [..._transactions];

  void popTransaction() {
    if (_transactions.isEmpty) return;
    _transactions.removeLast();
    notifyListeners();
  }
}
