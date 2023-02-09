import 'dart:ui';

import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/ui/pages/map_page/custom_map.dart';
import 'package:agent/ui/pages/visits_page/widget/visits_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
  bool isTap = false;
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
                    print(key);
                    setState(() {
                      textfieldIsOpen = !textfieldIsOpen;
                    });
                  }
                  if (key == "2") {
                    print(key);
                    Modular.to.pushNamed(CustomMap.routeName);
                  }
                  if (key == "3") {}
                }),
            textfieldIsOpen
                ? Row(
                    children: [
                      Expanded(
                        child: AppInputTextField(
                          hint: "Искать",
                          hintStyle: GoogleFonts.inter(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorName.gray,
                          ),
                          prefix: Center(
                            child: Assets.images.icons.search.svg(
                              color: ColorName.gray2,
                            ),
                          ).marginOnly(right: 10),
                        ),
                      ),
                      //// cancle button
                      SizedBox(width: 10),
                      Material(
                        borderRadius: BorderRadius.circular(30),
                        color: ColorName.background,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          splashColor: ColorName.primaryColor,
                          onTap: () {},
                          child: Assets.images.icons.cencel.svg(
                            color: ColorName.black,
                          ),
                        ),
                      )
                    ],
                  ).marginLTRB(20, 18, 20, 0)
                : SizedBox.shrink(),
            Visibility(
              visible: isTap ? false : true,
              child: SizedBox(height: 18),
            ),
            Visibility(
              visible: isTap ? false : true,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: AppInputTextField(
                      // controller: ,
                      // onChanged: ,
                      hint: "  Искать",
                      hintStyle: TextStyle(
                        color: ColorName.gray,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      prefix: Icon(
                        Icons.search,
                        color: ColorName.gray2,
                      ),
                    ).paddingOnly(left: 20.w),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isTap = true;
                        });
                      },
                      child: Assets.images.icons.remove
                          .svg(color: ColorName.black)
                          .paddingOnly(right: 10.w),
                    ),
                  ),
                ],
              ),
            ),
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
                itemCount: 6,
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 12,
                  );
                },
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemBuilder: (BuildContext context, int index) {
                  return VisitWidgets.items(
                    index: index,
                    url:
                        "https://cdn.pixabay.com/photo/2015/04/24/08/16/supermarket-737418_960_720.jpg",
                    name: "Osiyo market",
                    type: "super market",
                    percent: "60-70%",
                    sum: "100 000",

                    /// item ontap
                    onTap: () {},
                  ).marginSymmetric(horizontal: 20);
                },
              ).marginSymmetric(vertical: 2),
            ),
          ],
        ),
      ),
    ));
  }
}
