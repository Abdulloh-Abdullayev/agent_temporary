import 'package:flutter/material.dart';

import '../../widgets/appbar_main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child:  Column(
        children: [
          AppBarMain(
            onTapButton: () {},
            text: "Shaxsiy //Profilga kirish//",
          ),
        ],
      ),
    );
  }
}
