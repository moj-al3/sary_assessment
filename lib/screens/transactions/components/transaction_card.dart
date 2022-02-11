import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:sary_assessment/components/components.dart';
import 'package:sary_assessment/constants.dart';
import 'package:sary_assessment/models/transaction.dart';
import 'package:sary_assessment/screens/transactions/transaction_details_screen.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  const TransactionCard({
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
      child: CustomCard(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TransactionDetailsScreen(
                transaction: transaction,
              ),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.item.name,
                  style: const TextStyle(
                    color: xHeadingFontColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  transaction.item.sku,
                  style: const TextStyle(
                    color: xnormalFontColor,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  transaction.item.description,
                  style: const TextStyle(
                    color: xnormalFontColor,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  "${transaction.item.price} SR",
                  style: const TextStyle(
                      color: xHeadingFontColor,
                      fontSize: 11.53,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      stockStatus,
                      style: const TextStyle(
                        color: xHeadingFontColor,
                        fontSize: 11.53,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 12),
                    SvgPicture.asset(stockIconPath)
                  ],
                ),
                const SizedBox(height: 29),
                Text(
                  DateFormat('yyyy-MM-dd').format(transaction.date),
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: xnormalFontColor,
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
