import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/o_booking/widgets/o_booking_widgets.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OBookingModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          OBookingPage.routeName,
          child: (context, args) => const OBookingPage(),
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

class OBookingPage extends StatefulWidget {
  static const String routeName = "/oBookingPage";
  const OBookingPage({Key? key}) : super(key: key);

  @override
  State<OBookingPage> createState() => _OBookingPageState();
}

class _OBookingPageState extends State<OBookingPage> {
  final List<String> firstTextNameItems = [
    "Скидка",
    "Тип направления",
    "Тип цены",
    "Склад",
    "Бонус",
    "Заказ добавлен",
    "Дата отгрузки",
    "Срок консигнации",
  ];
  final List<String> secondTextNameItems = [
    "Без скидки",
    "Торговое направления",
    "Перечисления",
    "Основной склад",
    "10%",
    "16 окт, 1:43",
    "12.10.2022",
    "12.10.2022",
  ];
  String? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorName.background,
        body: Column(
          children: [
            OBookingWidgets.appBar(
              title: "О заказе",
              ontap: (key) {},
              context: context,
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var i = 0; i < firstTextNameItems.length; i++)
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 21),
                                OBookingWidgets.bookingItems(
                                  firstName: firstTextNameItems[i],
                                  secondName: secondTextNameItems[i],
                                ),
                              ],
                            ),
                          AppWidgets.textLocale(
                            localeKey: "Комментарии к заказу",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ColorName.gray2,
                          ).marginOnly(top: 16),
                          AppWidgets.text(
                            text:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                            fontSize: 14,
                          ).marginOnly(top: 12),
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            height: 1.h,
                            width: 1.sw,
                            color: Colors.grey,
                          ),
                          AppWidgets.textLocale(
                                  localeKey: "Закрепленные файлы",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: ColorName.gray2)
                              .marginOnly(top: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                height: 104.h,
                                width: 104.w,
                                decoration: BoxDecoration(
                                  color: ColorName.white,
                                  borderRadius: BorderRadius.circular(8),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/reportImage.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 72,
                                    left: 8,
                                    right: 72,
                                    bottom: 8,
                                  ),
                                  child: SizedBox(
                                    height: 24.h,
                                    width: 24.w,
                                    child:
                                        Assets.images.icons.bin.svg(height: 15),
                                  ),
                                ),
                              )
                            ],
                          ).marginOnly(bottom: 100),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppWidgets.textLocale(
                                localeKey: "Заказанные товары",
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: ColorName.black)
                            .marginOnly(top: 18),
                        AppWidgets.textLocale(
                                localeKey: "Напитки",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ColorName.black)
                            .marginOnly(top: 16),
                        const SizedBox(
                          height: 15,
                        ),
                        OBookingWidgets.cocaColaItems(),
                        const SizedBox(
                          height: 18,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            OBookingWidgets.textBuilder(
                              "Общая объем",
                              "1365 о",
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            OBookingWidgets.textBuilder(
                              "Общее кол-во",
                              "1258 шт",
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            OBookingWidgets.textBuilder(
                              "Общая сумма",
                              "150 000 000 UZS",
                              color: ColorName.button,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        )
                      ],
                    ),
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
