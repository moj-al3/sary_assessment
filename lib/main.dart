import 'package:flutter/material.dart';

import 'screens/transactions/transactions_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sary Assessment',
      theme: ThemeData(fontFamily: 'Futura'),
      home: const TransactionsScreen(),
    );
  }
}
