import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'filters_menu.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
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
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (_) => FiltersMenu(),
        ),
      ),
    );
  }
}
