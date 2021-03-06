import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:sary_assessment/models/item.dart';
import 'package:sary_assessment/models/transaction.dart';
import 'package:sary_assessment/providers/items_provider.dart';
import 'package:sary_assessment/providers/transactions_provider.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:sary_assessment/screens/transactions/transactions_screen.dart';

void main() {
  //load and open all boxes
  WidgetsFlutterBinding.ensureInitialized();
  loadBoxes().then((value) => runApp(const MyApp()));
}

Future<void> loadBoxes() async {
  final appDocumentDir = await syspaths.getApplicationDocumentsDirectory();
  Hive
    ..init(appDocumentDir.path)
    ..registerAdapter(ItemAdapter())
    ..registerAdapter(TransactionAdapter());
  await Hive.openBox("itemsBox");
  await Hive.openBox("transactionsBox");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //register all providers in the main root to be accessed everywhere
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
