import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../order_page/order_page_widget/market_image_widget.dart';


Widget marketImage(){
  return Positioned(
    top: 50.w,
      right: 0,
      left: 0,
      child:const MarketImage(image: "assets/images/market.png")
  );

}

