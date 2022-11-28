import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/ui/pages/draft_page/draft_page_widget/order_card_widget.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/colors.gen.dart';
import '../order_page/order_page_widget/order_appbar_icon_widget.dart';
import 'draft_page_widget/equipment_widget.dart';

class DraftPageModule extends Module {
  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      DraftPage.routeName,
      child: (context, args) => const DraftPage(),
    ),
  ];
}

class DraftPage extends StatelessWidget {
  const DraftPage({Key? key}) : super(key: key);
  static const String routeName = "/draftPage";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // AppBar Container
            Container(
              height: 127.h,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  color: ColorName.primaryColor
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppBarIcon.menuIcon(
                          () { },
                    ),
                  ).paddingOnly(top: 20.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppWidgets.textLocale(
                        localeKey: "Черновик",
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                        color: ColorName.white,
                        isRichText: true
                      ),
                      AppWidgets.textLocale(
                          localeKey: "Очистить черновик",
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: ColorName.red,
                          isRichText: true
                      ),
                    ],
                  ).paddingOnly(top: 20.w),
                ],
              ).paddingSymmetric(horizontal: 20.w),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    OrderWidget().paddingOnly(top: 24.w),
                    EquipmentWidget().paddingOnly(top: 24.w),
                  ],
                ).paddingSymmetric(horizontal: 20.w),
              ),
            )
          ],
        ),
      ),
    );
  }
}
