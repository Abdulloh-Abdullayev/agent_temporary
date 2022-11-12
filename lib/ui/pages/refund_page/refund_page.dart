import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/extensions/app_extensions.dart';
import 'package:uikit/uikit.dart';

import '../../widgets/app_widgets.dart';

class RefundPageModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          RefundPage.routeName,
          child: (context, args) => const RefundPage(),
        )
      ];
}

class RefundPage extends StatelessWidget {
  static const String routeName = '/refundPage';

  const RefundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            refundAppBar().paddingOnly(bottom: 18.w),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(8.r),
                      ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Cards.cards_9(
                            width: 71,
                            name: "name",
                            sht: "sht",
                            shtNumber: "1",
                            image: "image",
                            shtRemove: () {},
                            shtAdd: () {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      decoration: const BoxDecoration(
                        // color: Colors.lightBlueAccent,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.04),
                            blurRadius: 12,
                            offset: Offset(0, -4)
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppWidgets.iconButton(
                    onPressed: () {},
                    icon: Assets.images.icons.searchActive,
                  ),
                  AppWidgets.iconButton(
                    onPressed: () {},
                    icon: Assets.images.icons.filtrIcon,
                  ).paddingOnly(left: 12.w),
                ],
              )
            ],
          ),
          AppWidgets.textLocale(
            localeKey: "Возврат тары",
            fontWeight: FontWeight.w600,
            fontSize: 24.sp,
            color: Colors.white,
          ).paddingOnly(top: 20.w),
        ],
      ),
    );
  }
}
