import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/ui/pages/diagnostics_page/diagnostics_page_widgets/chekbox_widget.dart';
import 'package:agent/ui/pages/diagnostics_page/diagnostics_page_widgets/listview_widget.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.gen.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
          color: ColorName.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12),
          )),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            children: [
              InkWell(
                autofocus: false,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 26.w),
                  child: Assets.images.icons.downIcon.svg(
                    fit: BoxFit.cover,
                  ),
                ),
                onTap: () {
                  Modular.to.pop(context);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppWidgets.textLocale(
                      localeKey: "Фильтр",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorName.black,
                      isRichText: true),
                  AppWidgets.textLocale(
                      localeKey: "Сброс фильтра",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorName.red,
                      isRichText: true)
                ],
              ).paddingOnly(top: 28.w),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: AppWidgets.textLocale(
                                localeKey: "Напитки",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: ColorName.black,
                                isRichText: true)
                            .paddingOnly(top: 24.w, bottom: 17.w),
                      ),
                      listview_widget(
                        ChekBoxWidget(
                          text: "Lorem Ipsum",
                        ),
                        5,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: AppWidgets.textLocale(
                                localeKey: "Напитки",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: ColorName.black,
                                isRichText: true)
                            .paddingOnly(top: 24.w, bottom: 17.w),
                      ),
                      listview_widget(
                          ChekBoxWidget(
                            text: "Lorem Ipsum",
                          ),
                          5),
                    ],
                  ),
                ),
              )
            ],
          ).paddingSymmetric(horizontal: 20.w),
          InkWell(
            autofocus: false,
            child: Container(
              padding: EdgeInsets.only(top: 20.w, right: 29.w),
              child: Assets.images.icons.remove.svg(
                fit: BoxFit.cover,
              ),
            ),
            onTap: () {
              Modular.to.pop(context);
            },
          )
        ],
      ),
    );
  }
}
