import 'package:flutter/material.dart';
import 'package:sary_assessment/components/components.dart';
import 'package:sary_assessment/constants.dart';
import 'package:sary_assessment/models/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  const ItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: CustomCard(
        onTap: () {},
        child: Row(
          children: [
            Image.asset(item.image),
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
    );
  }
}
