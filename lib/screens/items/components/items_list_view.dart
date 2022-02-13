import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:provider/provider.dart';
import 'package:sary_assessment/components/components.dart';
import 'package:sary_assessment/providers/items_provider.dart';
import 'package:sary_assessment/screens/items/components/item_card.dart';

class ItemsListVIew extends StatelessWidget {
  const ItemsListVIew({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Directory>(
      future: syspaths.getApplicationDocumentsDirectory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Consumer<ItemsProvider>(
            builder: (context, itemsProvider, child) => ListView.builder(
              itemCount: itemsProvider.items.length,
              itemBuilder: (context, index) => ItemCard(
                appPath: snapshot.data!.path,
                item: itemsProvider.items[index],
              ),
            ),
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
