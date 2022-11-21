import 'package:flutter/material.dart';

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
            text: "Qayerga //ketmoqdasiz?//",
            menuTab: () {},
          ),
        ],
      ),
    );
  }
}
