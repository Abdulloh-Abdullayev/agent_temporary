import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'market_image_widget.dart';

Widget marketImage(){
  return Positioned(
    top: 50.w,
      right: 0,
      left: 0,
      child: MarketImage(image: "assets/images/market.png")
  );
}