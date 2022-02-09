import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sary_assessment/components/components.dart';
import 'package:sary_assessment/providers/transactions_provider.dart';

class FloatingArea extends StatelessWidget {
  const FloatingArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FloatingButton(
                label: "Sends",
                icon: SvgPicture.asset(
                  "assets/icons/arrow_up.svg",
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: FloatingButton(
                label: "Receive",
                icon: SvgPicture.asset(
                  "assets/icons/arrow_down.svg",
                  color: Colors.white,
                ),
                onPressed:
                    Provider.of<TransactionsProvider>(context).popTransaction,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
