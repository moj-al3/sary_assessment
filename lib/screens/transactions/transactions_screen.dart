import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sary_assessment/constants.dart';
import 'package:sary_assessment/providers/items_provider.dart';
import 'package:sary_assessment/providers/transactions_provider.dart';
import 'package:sary_assessment/screens/items/items_screen.dart';
import 'package:sary_assessment/screens/transactions/components/components.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: const [
                SearchArea(),
                SizedBox(height: 5),
                Expanded(
                  child: TransactionsListView(),
                )
              ],
            ),
          ),
          const FloatingArea(),
        ],
      ),
    );
  }
}
