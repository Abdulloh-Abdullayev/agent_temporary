import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTitleWidget extends StatelessWidget {
  const AppTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
            radius: 13,
            backgroundImage: NetworkImage("https://img.freepik.com/premium-photo/astronaut-outer-open-space-planet-earth-stars-provide-background-erforming-space-planet-earth-sunrise-sunset-our-home-iss-elements-this-image-furnished-by-nasa_150455-16829.jpg?w=2000")
        ).paddingOnly(right: 8.w),
        AppWidgets.textLocale(
            localeKey: "Osiyo Market",
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: ColorName.white
        )
      ],
    );
  }
}
