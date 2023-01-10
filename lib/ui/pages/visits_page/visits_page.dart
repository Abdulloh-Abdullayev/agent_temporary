import 'dart:ui';

import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/ui/pages/visits_page/widget/visits_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import '../../../core/localization/locale_keys.g.dart';
import '../../../core/utils/assets.gen.dart';
import '../../../core/utils/colors.gen.dart';
import '../../widgets/app_widgets.dart';
import '../order_page/order_page.dart';

class VisitsPageModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          VisitsPage.routeName,
          child: (context, args) => const VisitsPage(),
        ),
      ];

  @override
  List<Bind<Object>> get binds => [
        // Bind<AppNavigationBloc>(
        //   (i) => AppNavigationBloc(),
        //   onDispose: (value) => value.close(),
        // ),
      ];
}

class VisitsPage extends StatefulWidget {
  static const String routeName = "/visits_page";

  const VisitsPage({super.key});

  @override
  State<VisitsPage> createState() => _VisitsPageState();
}

class _VisitsPageState extends State<VisitsPage> {
  var textfieldIsOpen = false;
  var sbh = MediaQueryData.fromWindow(window).padding.top;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: ColorName.background,
          child: Column(
            children: [
              VisitWidgets.Appbar(
                  title: LocaleKeys.visits.tr(),
                  ontap: (key) {
                    if (key == "0") {
                      print(key);
                    }
                    if (key == "1") {
                      setState(() {
                        textfieldIsOpen = !textfieldIsOpen;
                      });
                      print(key);
                    }
                    if (key == "2") {
                      print(key);
                    }
                  }),
              textfieldIsOpen
                  ? AppInputTextField(
                      prefix: Center(
                        child: Assets.images.icons.search.svg(
                            color: Colors.black, height: 17.4, width: 17.4),
                      ),
                    ).marginLTRB(20, 18, 20, 0)
                  : SizedBox.shrink(),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppWidgets.textLocale(
                    localeKey: LocaleKeys.filter,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  DropDown(
                    items: [
                      "date1",
                      "date2",
                      "date3",
                      "date4",
                      "date5",
                    ],
                    width: 184.w,
                    title: LocaleKeys.all_categories.tr(),
                    onChange: (v) {},
                  ),
                ],
              ).marginSymmetric(horizontal: 20),
              SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Cards.cards_12(
                      name: 'Osiyo Market',
                      supermarket: 'supermarket',
                      uzs: 'UZS',
                      image: '',
                      persent: '10-12',
                      summa: '12000',
                      cp: '1',
                      zakaz: LocaleKeys.order.tr(),
                      obmen: LocaleKeys.exchange.tr(),
                      vozvrat: LocaleKeys.return_.tr(),
                      vozvratTar: LocaleKeys.return_of_containers.tr(),
                      plusNumber: '1',
                      card_onTap: () {
                        Modular.to.pushNamed(OrderPage.routeName);
                      },
                    ).marginSymmetric(
                      horizontal: 20,
                      vertical: 10.w,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
