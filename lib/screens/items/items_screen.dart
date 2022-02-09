import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sary_assessment/constants.dart';
import 'package:sary_assessment/providers/items_provider.dart';
import 'package:sary_assessment/screens/items/components/components.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({Key? key}) : super(key: key);

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
          Column(
            children: [
              Expanded(
                child: Consumer<ItemsProvider>(
                  builder: (context, itemsProvider, child) => ListView.builder(
                    itemCount: itemsProvider.items.length,
                    itemBuilder: (context, index) => ItemCard(
                      item: itemsProvider.items[index],
                    ),
                  ),
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
