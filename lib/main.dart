import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sary_assessment/providers/items_provider.dart';
import 'package:sary_assessment/providers/transactions_provider.dart';

import 'screens/transactions/transactions_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ItemsProvider>(create: (_) => ItemsProvider()),
        ChangeNotifierProvider<TransactionsProvider>(
            create: (_) => TransactionsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sary Assessment',
        theme: ThemeData(fontFamily: 'Futura'),
        home: const TransactionsScreen(),
      ),
    );
  }
}
