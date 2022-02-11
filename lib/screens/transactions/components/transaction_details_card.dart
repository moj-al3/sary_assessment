import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sary_assessment/constants.dart';
import 'package:sary_assessment/models/item.dart';
import 'package:sary_assessment/models/transaction.dart';
import 'badge.dart';
import 'package:path_provider/path_provider.dart' as syspaths;

class TransactionDetailsCard extends StatelessWidget {
  final Transaction transaction;
  const TransactionDetailsCard({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String stockStatus =
        transaction.type == "inbound" ? "Stock In" : "Stock Out";
    String stockIconPath = transaction.type == "inbound"
        ? "assets/icons/arrow_down.svg"
        : "assets/icons/arrow_up.svg";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ItemInfo(item: transaction.item),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Badge(
                    title: "Quantity",
                    value: transaction.quantity.toString(),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Badge(
                    title: "Price",
                    value: "${transaction.item.price} SR",
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        stockStatus,
                        style: const TextStyle(
                          color: xHeadingFontColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 12),
                      SvgPicture.asset(stockIconPath),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  transaction.type,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: xHeadingFontColor,
                    fontSize: 21,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Badge(
                    title: "Date",
                    value: transaction.date,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Badge(
                    title: "Time",
                    value: transaction.date,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FutureBuilder<Directory>(
          future: syspaths.getApplicationDocumentsDirectory(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Image.asset(
                "${snapshot.data!.path}/${item.image}",
                width: 125,
                height: 75,
              );
            } else {
              return Container();
            }
          },
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
              const SizedBox(height: 16),
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
            ],
          ),
        ),
      ],
    );
  }
}
