import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/order_page/order_page_widget/market_image_widget.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import '../../../../core/localization/locale_keys.g.dart';

class RemainsPageWidgets {
  static Widget bookingItems({
    required String firstName,
    required String secondName,
    TextStyle firstStyle = const TextStyle(
      color: ColorName.gray2,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    TextStyle secondStyle = const TextStyle(
      color: ColorName.black,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AppWidgets.text(
              text: firstName,
              textStyle: firstStyle,
            ),
            AppWidgets.text(text: secondName, textStyle: secondStyle),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 16),
          height: 1.h,
          width: 1.sw,
          color: ColorName.gray,
        ),
      ],
    );
  }

  static Widget appBar(
          {required title,
          required BuildContext context,
          required Function(String key) ontap}) =>
      Stack(
        children: [
          Container(
            height: 113.h,
            width: 1.sw,
            padding: const EdgeInsets.only(top: 19, left: 20, right: 20),
            decoration: const BoxDecoration(
              color: ColorName.primaryColor,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 28.h,
                      width: 28.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.10),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Assets.images.icons.left.svg(height: 9.5),
                        ),
                      ),
                    ),
                    Container(
                      height: 28.w,
                      width: 28.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.10),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: PopupMenuTools(
                        onTap: (p0) {
                          if (p0 == 1) {
                            showDialog(
                              context: context,
                              builder: (ctx) => const AlertDialog(
                                content: CommitTextField(
                                  text: "Добавление комментарии",
                                ),
                              ),
                            );
                          } else if (p0 == 2) {
                            showDialog(
                              context: context,
                              builder: (ctx) => Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: DateTimeDialog(
                                    title: "Добавить дату отгрузки",
                                    closeTitle: "Закрыть",
                                    addTitle: "Добавить",
                                    addTap: () {}),
                              ),
                            );
                          } else if (p0 == 3) {
                            showDialog(
                              context: context,
                              builder: (ctx) => Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: DateTimeDialog(
                                    title: "Добавить консигнация",
                                    closeTitle: "Закрыть",
                                    addTitle: "Добавить",
                                    addTap: () {}),
                              ),
                            );
                          }
                        },
                        textName: const [
                          "Редактрировать",
                          "Комментария к заказу",
                          "Дата отгрузки",
                          "Срок Консигнация",
                          "Закрепить фото",
                          'Отменить',
                        ],
                        icons: [
                          Assets.images.icons.edit.svg(),
                          Assets.images.icons.chat.svg(),
                          Assets.images.icons.date.svg(),
                          Assets.images.icons.clock.svg(),
                          Assets.images.icons.uploadingFile.svg(),
                          const SizedBox.shrink(),
                        ],
                        textColor: const [
                          ColorName.button,
                          ColorName.black,
                          ColorName.black,
                          ColorName.black,
                          ColorName.black,
                          ColorName.red,
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                AppWidgets.textLocale(
                  color: ColorName.white,
                  localeKey: title,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
          ),
          const MarketImage(image: "assets/images/market.png")
              .paddingOnly(top: 60.w, left: 140.w)
        ],
      );
  static Widget remainsEditAppBar(
          {required title,
          required BuildContext context,
          required Function(String key) ontap}) =>
      Container(
        height: 113.h,
        width: 1.sw,
        padding: const EdgeInsets.only(top: 19, left: 20, right: 20),
        decoration: const BoxDecoration(
          color: ColorName.primaryColor,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 28.h,
                  width: 28.h,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.10),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Modular.to.pop();
                    },
                    child: Center(
                      child: Assets.images.icons.left.svg(height: 9.5),
                    ),
                  ),
                ),
                Container(
                  height: 28.w,
                  width: 28.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.10),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: PopupMenuTools(
                    onTap: (p0) {
                      if (p0 == 1) {
                        showDialog(
                          context: context,
                          builder: (ctx) => const AlertDialog(
                            content: CommitTextField(
                              text: "Добавление комментарии",
                            ),
                          ),
                        );
                      } else if (p0 == 2) {
                        showDialog(
                          context: context,
                          builder: (ctx) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: DateTimeDialog(
                                title: "Добавить дату отгрузки",
                                closeTitle: "Закрыть",
                                addTitle: "Добавить",
                                addTap: () {}),
                          ),
                        );
                      } else if (p0 == 3) {
                        showDialog(
                          context: context,
                          builder: (ctx) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: DateTimeDialog(
                                title: "Добавить консигнация",
                                closeTitle: "Закрыть",
                                addTitle: "Добавить",
                                addTap: () {}),
                          ),
                        );
                      }
                    },
                    textName: const [
                      "Редактрировать",
                      "Комментария к заказу",
                      "Дата отгрузки",
                      "Срок Консигнация",
                      "Закрепить фото",
                      'Отменить',
                    ],
                    icons: [
                      Assets.images.icons.edit.svg(),
                      Assets.images.icons.chat.svg(),
                      Assets.images.icons.date.svg(),
                      Assets.images.icons.clock.svg(),
                      Assets.images.icons.uploadingFile.svg(),
                      const SizedBox.shrink(),
                    ],
                    textColor: const [
                      ColorName.button,
                      ColorName.black,
                      ColorName.black,
                      ColorName.black,
                      ColorName.black,
                      ColorName.red,
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            AppWidgets.textLocale(
              color: ColorName.white,
              localeKey: title,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      );

  static Widget textBuilder(
    String text1,
    String text2, {
    Color? color,
    TextStyle? textStyle,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
  }) =>
      Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppWidgets.textLocale(
            localeKey: text1,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: ColorName.gray2,
          ),
          AppWidgets.text(
            text: text2,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color ?? ColorName.black,
          ).marginOnly(
            left: 4,
          ),
        ],
      );

  static Widget remainsAppBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorName.primaryColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(12.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.backButton(
                () {
                  Modular.to.pop();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppWidgets.iconButton(
                    onPressed: () {
                      // Modular.to.pushNamed(RemainStockPage.routeName);
                    },
                    icon: Assets.images.icons.search,
                  ),
                  AppWidgets.iconButton(
                    onPressed: () {
                      // Modular.to.pushNamed(SalaryPage.routeName);
                    },
                    icon: Assets.images.icons.filter,
                  ).paddingOnly(left: 12.w),
                ],
              )
            ],
          ),
          AppWidgets.textLocale(
            localeKey: "Остатки",
            fontWeight: FontWeight.w600,
            fontSize: 24.sp,
            color: Colors.white,
          ).paddingOnly(top: 20.w),
        ],
      ),
    );
  }

  static Widget buildAppButton() {
    return Container(
      height: 141.w,
      padding: EdgeInsets.all(20.w),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.04),
            blurRadius: 5,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.textLocale(
                localeKey: "Обший Блок",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: ColorName.gray2,
              ),
              AppWidgets.textLocale(
                localeKey: "1365 о",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: ColorName.black,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.textLocale(
                localeKey: "Общее кол-во",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: ColorName.gray2,
              ),
              AppWidgets.textLocale(
                localeKey: "1258 шт",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: ColorName.black,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: AppWidgets.appButton(
                  color: ColorName.gray,
                  textColor: ColorName.mainColor,
                  title: LocaleKeys.draft,
                  onTap: () {},
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: AppWidgets.appButton(
                  title: "Добавить",
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
