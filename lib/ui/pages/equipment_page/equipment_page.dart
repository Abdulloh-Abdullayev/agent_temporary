import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/equipment_page/pages/add_equipment_page.dart';
import 'package:agent/ui/pages/equipment_page/widgets/equipment_widgets.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class EquipmentModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          EquipmentPage.routeName,
          child: (context, args) => const EquipmentPage(),
        ),
      ];

  // @override
  // List<Bind<Object>> get binds => [
  //       Bind<AppNavigationBloc>(
  //         (i) => AppNavigationBloc(),
  //         onDispose: (value) => value.close(),
  //       ),
  //     ];
}

class EquipmentPage extends StatelessWidget {
  static const String routeName = "/equipment-page";
  const EquipmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            EquipmentWidgets.appBar(
              title: "Оборудование",
              context: context,
              ontap: () {},
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox.shrink(),
                  Column(
                    children: [
                      Container(
                        height: 40.h,
                        width: 40.w,
                        color: ColorName.gray2,
                        child: Assets.images.icons.pin.svg(),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      AppWidgets.text(
                        textAlign: TextAlign.center,
                        text: "Пока что ничего не \nнайдено",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  AppButton(
                    text: "Добавить оборудование",
                    splashColor: ColorName.button,
                    onPressed: () {
                      Modular.to.pushNamed(AddEquipmentPage.routeName);
                    },
                    width: 335.w,
                    textColor: ColorName.white,
                  ).marginOnly(
                    bottom: 18.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
