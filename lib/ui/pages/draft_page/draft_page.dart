import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/ui/pages/draft_page/bloc/draft_page_cubit.dart';
import 'package:agent/ui/pages/draft_page/draft_page_widget/order_card_widget.dart';
import 'package:agent/ui/pages/home/home_page.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/localization/locale_keys.g.dart';
import '../../../core/utils/colors.gen.dart';
import 'draft_page_widget/equipment_widget.dart';

class DraftPageModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<DraftPageCubit>(
          (i) => DraftPageCubit(),
          onDispose: (v) => v.close(),
        ),
      ];

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
    return buildSafeArea();
  }

  Widget buildSafeArea() {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Column(
          children: [
            // AppBar Container
            buildAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    OrderWidget().paddingOnly(top: 24.w),
                    EquipmentWidget(),
                  ],
                ).paddingSymmetric(horizontal: 20.w),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildAppBar() {
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
          AppWidgets.iconButton(
            onPressed: () {
              HomePage.globalKey.currentState!.openDrawer();
            },
            icon: Assets.images.icons.menu,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.textLocale(
                localeKey: LocaleKeys.draft,
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
                color: ColorName.white,
              ),
              AppWidgets.textLocale(
                localeKey: LocaleKeys.clear_draft,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: ColorName.red,
              ),
            ],
          ).paddingOnly(top: 20.w),
        ],
      ),
    );
  }
}
