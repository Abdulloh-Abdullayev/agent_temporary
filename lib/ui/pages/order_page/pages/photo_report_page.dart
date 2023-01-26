import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/order_page/order_page_widget/delete_dilaog_widget.dart';
import 'package:agent/ui/pages/order_page/order_page_widget/image_widget.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhotoReportPage extends StatelessWidget {
  const PhotoReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: ColorName.white,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: AppWidgets.textLocale(
                localeKey: LocaleKeys.out_of_sync,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: ColorName.black,
              ),
            ).paddingOnly(bottom: 12.w),
            SizedBox(
              height: 104.w,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ImageWidget(
                    image:
                        "https://img.freepik.com/premium-photo/astronaut-outer-open-space-planet-earth-stars-provide-background-erforming-space-planet-earth-sunrise-sunset-our-home-iss-elements-this-image-furnished-by-nasa_150455-16829.jpg?w=2000",
                    onPressedDelete: () {
                      deleteDialog(context);
                    },
                  ).paddingOnly(right: 12.w);
                },
              ),
            ).paddingOnly(bottom: 24.w),
            Align(
              alignment: Alignment.centerLeft,
              child: AppWidgets.textLocale(
                localeKey: LocaleKeys.synchronized,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: ColorName.black,
              ),
            ).paddingOnly(bottom: 12.w),
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 2 / 2,
                    maxCrossAxisExtent: 150,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 9),
                itemCount: 11,
                itemBuilder: (BuildContext ctx, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      height: 104.w,
                      width: 104.w,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://img.freepik.com/premium-photo/astronaut-outer-open-space-planet-earth-stars-provide-background-erforming-space-planet-earth-sunrise-sunset-our-home-iss-elements-this-image-furnished-by-nasa_150455-16829.jpg?w=2000",
                        placeholder: (context, url) =>
                            const CupertinoActivityIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.person),
                      ),
                    ),
                  );
                }),
          ],
        ).paddingOnly(
          top: 18.w,
          left: 20.w,
          right: 20.w,
          bottom: 18.w,
        ),
      ),
    );
  }
}
