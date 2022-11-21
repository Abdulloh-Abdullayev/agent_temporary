import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapListItem extends StatelessWidget {
  final double dept;
  final String title;
  final String categoryName;
  final String percent;
  final String imgUrl;
  final int index;

  const MapListItem({
    this.dept = 0.0,
    this.title = '',
    this.categoryName = '',
    this.percent = '',
    this.imgUrl = '',
    this.index = 1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorName.gray),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CachedNetworkImage(
                      imageUrl: imgUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CupertinoActivityIndicator(),
                      errorWidget: (context, url, error) =>
                          AppWidgets.imgError(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppWidgets.text(
                            text: title,
                            fontWeight: FontWeight.w400,
                            color: ColorName.black,
                            fontSize: 16,
                          ),
                          AppWidgets.text(
                            text: percent,
                            fontWeight: FontWeight.w400,
                            color: ColorName.green,
                            fontSize: 12,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppWidgets.text(
                            text: categoryName,
                            fontWeight: FontWeight.w400,
                            color: ColorName.gray2,
                            fontSize: 12,
                          ),
                          dept > 0
                              ? AppWidgets.textLocale(
                                  localeKey: LocaleKeys.dept_amount,
                                  fontWeight: FontWeight.w400,
                                  color: ColorName.red,
                                  fontSize: 12,
                                  args: ['$dept'],
                                )
                              : AppWidgets.textLocale(
                                  localeKey: LocaleKeys.no_dept,
                                  fontWeight: FontWeight.w400,
                                  color: ColorName.green,
                                  fontSize: 12,
                                  args: ['$dept'],
                                ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 7,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: ColorName.primaryColor,
              ),
              child: Center(
                child: AppWidgets.text(
                  text: '$index',
                  fontWeight: FontWeight.w400,
                  color: ColorName.white,
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
