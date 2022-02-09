import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sary_assessment/constants.dart';
import 'package:sary_assessment/screens/items/items_screen.dart';
import 'package:sary_assessment/screens/transactions/components/components.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Transactions",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: SvgPicture.asset("assets/icons/items.svg"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ItemsScreen()),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: xbgColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              const SizedBox(height: 8),
              const SearchArea(),
              const SizedBox(height: 5),
              Expanded(
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (BuildContext context, int index) =>
                      TransactionCard(transaction: transactions[index]),
                ),
              )
            ],
          ),
          const FloatingArea(),
        ],
      ),
    );
  }
}