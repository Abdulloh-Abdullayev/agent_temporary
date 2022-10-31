

import 'package:flutter/material.dart';

import '../../widgets/appbar_main.dart';

class CommunicationPage extends StatelessWidget {
  const CommunicationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child:  Column(
        children: [
          AppBarMain(
            onTapButton: () {},
            text: "Aloqa",
          ),
        ],
      ),
    );
  }
}
