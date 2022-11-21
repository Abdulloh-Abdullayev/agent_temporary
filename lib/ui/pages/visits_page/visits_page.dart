import 'dart:ui';

import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/ui/pages/visits_page/widget/visits_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import '../../../core/utils/assets.gen.dart';
import '../../../core/utils/colors.gen.dart';
import '../../widgets/app_widgets.dart';

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
          height: 1.sh - sbh,
          width: 1.sw,
          color: ColorName.background,
          child: Column(
            children: [
              VisitWidgets.Appbar(
                  title: "Визиты",
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
                    localeKey: "Фильтр",
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
                    title: "Все категории",
                    onChange: () {},
                  ),
                ],
              ).marginSymmetric(horizontal: 20),
              SizedBox(height: 12),
              Expanded(
                child: ListView.separated(
                  itemCount: 5,
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 12,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return VisitWidgets.items(
                      url:
                          "https://cdn.pixabay.com/photo/2015/04/24/08/16/supermarket-737418_960_720.jpg",
                      name: "name",
                      percent: "60-70%",
                      sum: "100 000",
                    ).marginSymmetric(horizontal: 20);
                  },
                ),
              ),
              AppTabBar(
                tabTitle: [
                  "title 1",
                  "title 2",
                  "title 3",
                ],
                onTap: (p0) {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
