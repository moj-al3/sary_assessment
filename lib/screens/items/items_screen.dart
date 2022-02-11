import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sary_assessment/components/components.dart';
import 'package:sary_assessment/constants.dart';
import 'package:sary_assessment/providers/items_provider.dart';
import 'package:sary_assessment/screens/items/components/components.dart';
import 'package:path_provider/path_provider.dart' as syspaths;

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  State<ItemsScreen> createState() => ItemsScreenState();
}

class ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Items",
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/icons/arrow_back.svg"),
        ),
      ),
      backgroundColor: xbgColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          FutureBuilder<Directory>(
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
          ),
          const FloatingArea(),
        ],
      ),
    );
  }
}
