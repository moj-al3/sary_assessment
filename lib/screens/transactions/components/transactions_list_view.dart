import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sary_assessment/models/transaction.dart';
import 'package:sary_assessment/providers/transactions_provider.dart';
import 'package:sary_assessment/screens/transactions/components/components.dart';

class TransactionsListView extends StatelessWidget {
  const TransactionsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Transaction> filterdTransactions =
        Provider.of<TransactionsProvider>(context).getFilterd();
    return ListView.builder(
      itemCount: filterdTransactions.length,
      itemBuilder: (BuildContext context, int index) => TransactionCard(
        transaction: filterdTransactions[index],
      ),
    );
  }
}
