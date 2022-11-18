import 'package:agent/core/utils/colors.gen.dart';
import 'package:flutter/material.dart';

class MarketImage extends StatelessWidget {
  const MarketImage({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorName.primaryDark,
          ),
          child: SizedBox(
            height: 37,
            width: 43,
            child: Image.asset(image),
          )),
    );
  }
}
