import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sary_assessment/constants.dart';
import 'package:sary_assessment/models/item.dart';
import 'package:path_provider/path_provider.dart' as syspaths;

class ItemCard extends StatelessWidget {
  final String appPath;
  final Item item;
  const ItemCard({
    Key? key,
    required this.appPath,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Image.asset(
                "$appPath/${item.image}",
                width: 125,
                height: 75,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        item.name,
                        softWrap: false,
                        style: const TextStyle(
                          color: xHeadingFontColor,
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.sku,
                      style: const TextStyle(
                        color: xnormalFontColor,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item.description,
                      softWrap: false,
                      style: const TextStyle(
                        color: xnormalFontColor,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${item.price} SR",
                      style: const TextStyle(
                          color: xHeadingFontColor,
                          fontSize: 11.53,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
