import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

import '../../widgets/appbar_main.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      child: Column(
        children: [
          AppBarMain(
            onTapButton: () {},
            text: "Qayerga //ketmoqdasiz?//",
          ),
          const PopupMenu(
            
          ),
          const CommitTextField(),
          AppCheckBox(onTap: () {}, isCheck: false),
          BalancePopupMenu(),
        ],
      ),
    );
  }
}
