import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sary_assessment/constants.dart';
import 'package:sary_assessment/providers/transactions_provider.dart';
import 'package:sary_assessment/screens/transactions/components/components.dart';

class SearchArea extends StatefulWidget {
  const SearchArea({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchArea> createState() => _SearchAreaState();
}

class _SearchAreaState extends State<SearchArea> {
  final _controller = TextEditingController();
  @override
  void initState() {
    _controller.addListener(
      () => Provider.of<TransactionsProvider>(context, listen: false)
          .updateQuery(_controller.text),
    );
    super.initState();
  }

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
                  controller: _controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: xHeadingFontColor,
                    ),
                    suffixIcon: IconButton(
                      color: Colors.black,
                      onPressed: _controller.clear,
                      icon: const Icon(Icons.clear),
                    ),
                    hintText: "Search",
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            const FilterButton(),
          ],
        ),
      ),
    );
  }
}
