import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/extensions/app_extensions.dart';
import 'package:uikit/uikit.dart';

import 'select_category_widget.dart';

class AddBonusWidget extends StatelessWidget {
  const AddBonusWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      height: 340.w,
      width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        color: ColorName.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    size: 25.w,
                    color: ColorName.gray2,
                  )),
                  InkWell(
                    onTap: () {
                      Modular.to.pop();
                    },
                    child: Assets.images.icons.remove.svg(
                      color: ColorName.gray2,
                      height: 30.w,
                    ),
                  ),
                ],
              ),
              AppWidgets.textLocale(
                localeKey: "Добавление бонуса",
                fontWeight: FontWeight.w600,
                fontSize: 24.sp,
              ).paddingOnly(
                top: 15.w,
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    enableDrag: true,
                    isDismissible: false,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    )),
                    builder: (context) {
                      return const SelectCategoryWidget();
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 12.w,
                  ),
                  width: 1.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    border: Border.all(
                      color: ColorName.button,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppWidgets.textLocale(
                        localeKey: "Выбрать бонус",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 15.w,
                      ),
                    ],
                  ),
                ).paddingOnly(top: 18.w),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppButton(
                height: 45.w,
                width: 115.w,
                text: "Закрыть",
                textSize: 14.sp,
                textColor: ColorName.mainColor,
                color: ColorName.gray,
                splashColor: ColorName.black.withOpacity(0.2),
                onPressed: () {},
              ),
              AppButton(
                height: 45.w,
                width: 200.w,
                text: "Завершить без бонуса",
                textSize: 14.sp,
                textColor: ColorName.white,
                color: ColorName.button,
                splashColor: ColorName.black.withOpacity(0.2),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}

