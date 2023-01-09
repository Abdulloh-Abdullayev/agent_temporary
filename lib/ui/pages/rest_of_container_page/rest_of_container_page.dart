import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class RestContainerPageModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          RestContainerPage.routeName,
          child: (context, args) => const RestContainerPage(),
        )
      ];
}

class RestContainerPage extends StatelessWidget {
  const RestContainerPage({Key? key}) : super(key: key);
  static const String routeName = "/restContainerPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              refundAppBar().paddingOnly(bottom: 18.w),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return tableTitle();
                  } else {
                    return tableItem(isLast: index == 4);
                  }
                },
                separatorBuilder: (context, index) => Container(
                  height: 1,
                  color: ColorName.gray,
                ),
                itemCount: 5,
              ).paddingSymmetric(
                horizontal: 20.w,
              ),
              SizedBox(
                height: 12.w,
              ),
              Widgets.showData(
                height: 100.w,
                count: "20",
                title: LocaleKeys.number_of_containers.tr(),
                color: ColorName.white,
                hasBorder: true,
                width: 1.sw,
                countSize: 24.sp,
                titleSize: 12.sp,
              ).paddingSymmetric(
                horizontal: 20.w,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tableTitle() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      height: 40,
      decoration: BoxDecoration(
        color: ColorName.input,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppWidgets.text(
            text: LocaleKeys.data.tr(),
            maxLines: 1,
            color: ColorName.gray2,
            fontSize: 12.sp,
            textAlign: TextAlign.center,
          ),
          AppWidgets.text(
            text: LocaleKeys.qty.tr(),
            maxLines: 1,
            color: ColorName.gray2,
            fontSize: 12.sp,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget tableItem({bool isLast = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      height: 40.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: isLast
            ? BorderRadius.vertical(
                bottom: Radius.circular(8.r),
              )
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppWidgets.text(
            text: "Тара 1",
            maxLines: 1,
            color: ColorName.gray3,
            fontSize: 12.sp,
            textAlign: TextAlign.center,
          ),
          AppWidgets.text(
            text: "5",
            maxLines: 1,
            color: ColorName.gray3,
            fontSize: 12.sp,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

Widget refundAppBar() {
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
          ],
        ),
        AppWidgets.textLocale(
          localeKey: LocaleKeys.rest_of_container,
          fontWeight: FontWeight.w600,
          fontSize: 24.sp,
          color: Colors.white,
        ).paddingOnly(top: 20.w),
      ],
    ),
  );
}
