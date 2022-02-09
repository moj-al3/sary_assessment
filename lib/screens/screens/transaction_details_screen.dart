import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sary_assessment/constants.dart';
import 'package:sary_assessment/models/transaction.dart';
import 'package:sary_assessment/screens/transactions/components/components.dart';

class TransactionDetailsScreen extends StatelessWidget {
  final Transaction transaction;
  const TransactionDetailsScreen({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: xbgColor,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Transactions Details"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/icons/arrow_back.svg"),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: TransactionDetailsCard(transaction: transaction),
      ),
    );
  }
}
