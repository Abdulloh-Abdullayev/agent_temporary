import 'dart:async';

import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/outlets_page/widgets/switch_button.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'widgets/outlets_bottom_sheet.dart';

class OutletsMapModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          OutletsMapPage.routeName,
          child: (context, args) => const OutletsMapPage(),
        )
      ];
}

class OutletsMapPage extends StatefulWidget {
  static const String routeName = '/outletsMapPage';

  const OutletsMapPage({Key? key}) : super(key: key);

  @override
  State<OutletsMapPage> createState() => _OutletsMapPageState();
}

class _OutletsMapPageState extends State<OutletsMapPage> {
  Completer<YandexMapController> completer = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 84,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppWidgets.backButton(
              () {
                Modular.to.pop();
              },
              color: ColorName.background,
              iconColor: Colors.black,
            ),
            SwitchButton(
              onChange: () {},
              title: LocaleKeys.inventory,
              initialValue: false,
            ),
            SwitchButton(
              onChange: () {},
              title: LocaleKeys.client_with_dept,
              initialValue: true,
            ),
          ],
        ).paddingSymmetric(horizontal: 20.w),
      ),
      body: Stack(
        children: [
          YandexMap(
            onMapCreated: _onMapCreated,
          ),
          bottomSection()
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            elevation: 0,
            backgroundColor: ColorName.green,
            child: Assets.images.icons.mapArrowIcon.svg(),
          ),
          FloatingActionButton(
            onPressed: () {},
            elevation: 0,
            backgroundColor: ColorName.buttonColor,
            child: const Icon(Icons.remove),
          ).paddingOnly(top: 13.w),
        ],
      ).paddingOnly(bottom: 220.w),
    );
  }

  Widget bottomSection() {
    return Positioned(
      bottom: 48,
      right: 0,
      left: 0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          bottomButton(
            title: LocaleKeys.visited,
            text: "3 из 5",
          ),
          SizedBox(width: 12.w),
          bottomButton(
            title: LocaleKeys.show_on_map,
            text: "3 из 5",
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => const OutletsBottomSheet(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget bottomButton({
    VoidCallback? onTap,
    required String title,
    required String text,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        width: 163,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.08),
              offset: Offset(0, 8),
              blurRadius: 8,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppWidgets.text(
                  text: "3 из 5",
                  fontSize: 18.sp,
                ),
                FittedBox(
                  child: AppWidgets.textLocale(
                    localeKey: title,
                    fontSize: 12.sp,
                    color: ColorName.gray2,
                  ).paddingOnly(top: 8),
                ),
              ],
            ),
            onTap != null
                ? const Icon(
                    Icons.keyboard_arrow_right_sharp,
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  void _onMapCreated(YandexMapController controller) {
    completer.complete(controller);
  }
}
