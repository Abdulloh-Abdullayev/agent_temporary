import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DebtorsItem extends StatelessWidget {
  const DebtorsItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: ColorName.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg",
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const CupertinoActivityIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ).paddingOnly(right: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgets.textLocale(
                              localeKey: "Osiyo market",
                              fontWeight: FontWeight.w400,
                              color: ColorName.black,
                              fontSize: 16)
                          .paddingOnly(bottom: 4.w),
                      Row(
                        children: [
                          AppWidgets.textLocale(
                              localeKey: "Balance:",
                              fontWeight: FontWeight.w400,
                              color: ColorName.black,
                              fontSize: 12),
                          AppWidgets.textLocale(
                            localeKey: " 0",
                            fontWeight: FontWeight.w400,
                            color: ColorName.red,
                            fontSize: 12,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 11,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Assets.images.icons.calendarIcon
                          .svg(color: ColorName.gray, height: 13.w),
                      AppWidgets.textLocale(
                              localeKey: "20.10.2022",
                              fontWeight: FontWeight.w400,
                              color: ColorName.black,
                              fontSize: 12.sp)
                          .paddingOnly(left: 8.w),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
