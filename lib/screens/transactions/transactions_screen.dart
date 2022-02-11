import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sary_assessment/components/components.dart';
import 'package:sary_assessment/constants.dart';
import 'package:sary_assessment/providers/transactions_provider.dart';
import 'package:sary_assessment/screens/items/items_screen.dart';
import 'package:sary_assessment/screens/transactions/components/components.dart';
import 'package:path_provider/path_provider.dart' as syspaths;

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
                child: FutureBuilder<Directory>(
                  future: syspaths.getApplicationDocumentsDirectory(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Consumer<TransactionsProvider>(
                        builder: (context, transactionsProvider, child) =>
                            ListView.builder(
                          itemCount: transactionsProvider.transactions.length,
                          itemBuilder: (BuildContext context, int index) =>
                              TransactionCard(
                            transaction:
                                transactionsProvider.transactions[index],
                          ),
                        ),
                      );
                    } else {
                      return const LoadingWidget();
                    }
                  },
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
