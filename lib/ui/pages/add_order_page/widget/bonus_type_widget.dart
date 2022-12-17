import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BonusTypeWidget extends StatefulWidget {
  const BonusTypeWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<BonusTypeWidget> createState() => _BonusTypeWidgetState();
}

bool isShow = false;

class _BonusTypeWidgetState extends State<BonusTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isShow = !isShow;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppWidgets.text(
            text: LocaleKeys.bonus_15.tr(),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          Container(
            height: 20.w,
            width: 20.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorName.gray,
              ),
              borderRadius: BorderRadius.circular(4),
              color: ColorName.background,
            ),
            child: isShow
                ? Icon(
                    Icons.check,
                    size: 20.w,
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}

class CategoryListWidget extends StatefulWidget {
  const CategoryListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

bool isCheck = false;

class _CategoryListWidgetState extends State<CategoryListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isCheck = !isCheck;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.textLocale(
                localeKey: "Snikers",
                fontSize: 14.sp,
              ),
              Container(
                height: 20.w,
                width: 20.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorName.gray,
                  ),
                  borderRadius: BorderRadius.circular(4),
                  color: ColorName.background,
                ),
                child: isCheck
                    ? Icon(
                        Icons.check,
                        size: 20.w,
                      )
                    : const SizedBox(),
              ),
            ],
          ).paddingOnly(right: 15.w, left: 15.w, bottom: 15.w),
        ),
      ],
    );
  }
}
