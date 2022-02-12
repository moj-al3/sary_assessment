import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sary_assessment/constants.dart';
import 'package:sary_assessment/providers/transactions_provider.dart';

class SearchArea extends StatelessWidget {
  final Function(String) onChanged;
  const SearchArea({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: xHeadingFontColor,
                    ),
                    hintText: "Search",
                  ),
                  onChanged: onChanged,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            FilterButton(
              onPressed: () async {
                await Provider.of<TransactionsProvider>(context, listen: false)
                    .deleteAll();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final Function onPressed;
  const FilterButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.white,
      child: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/filter.svg",
          width: 25,
          height: 25,
        ),
        onPressed: () => onPressed(),
      ),
    );
  }
}
