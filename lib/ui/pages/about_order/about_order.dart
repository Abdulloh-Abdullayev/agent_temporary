import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/about_order/widgets/about_order_widgets.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class AboutOrderModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AboutOrderPage.routeName,
          child: (context, args) => const AboutOrderPage(),
        ),
      ];

}

class AboutOrderPage extends StatefulWidget {
  static const String routeName = "/about-order-page";
  const AboutOrderPage({Key? key}) : super(key: key);

  @override
  State<AboutOrderPage> createState() => _AboutOrderPageState();
}

class _AboutOrderPageState extends State<AboutOrderPage> {
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
  bool isShow = true;
  bool isHide = true;
  bool isDeleted = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorName.background,
        body: Column(
          children: [
            AboutOrderWidgets.appBar(
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
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var i = 0; i < firstTextNameItems.length; i++)
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 21),
                                AboutOrderWidgets.bookingTextItems(
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
                          ).marginOnly(top: 16.w),
                          isShow
                              ? Container(
                                  child: AppWidgets.textLocale(
                                      localeKey:
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                                      maxLines: 3,),
                                )
                              : Container(
                                  child: AppWidgets.textLocale(
                                      localeKey:
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                                      maxLines: 100,),
                                ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isShow = !isShow;
                                isHide = !isHide;
                              });
                            },
                            child: isHide
                                ? Text("more",
                                    style: TextStyle(
                                      color: ColorName.button,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline,
                                    ),)
                                : Text(
                                    "hide",
                                    style: TextStyle(
                                      color: ColorName.button,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            height: 1.w,
                            width: 1.sw,
                            color: Colors.grey,
                          ),
                          AppWidgets.textLocale(
                                  localeKey: "Закрепленные файлы",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: ColorName.gray2,)
                              .marginOnly(top: 16.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              isDeleted
                                  ? Container(
                                      margin: const EdgeInsets.only(top: 8),
                                      height: 104.w,
                                      width: 104.w,
                                      decoration: BoxDecoration(
                                        color: ColorName.white,
                                        borderRadius: BorderRadius.circular(8),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/reportImage.png",),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: 72.w,
                                          left: 8.w,
                                          right: 72.w,
                                          bottom: 8.w,
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (ctx) => AlertDialog(
                                                content: PhotoReport(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  image:
                                                      "assets/images/reportImage.png",
                                                  text:
                                                      "Вы дейтвительно хотите удалить данное фото?",
                                                  submit: () {
                                                    setState(() {
                                                      isDeleted = !isDeleted;
                                                      Modular.to.pop();
                                                    });
                                                  },
                                                  quit: () {
                                                    Modular.to.pop();
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                          child: SizedBox(
                                            height: 24.w,
                                            width: 24.w,
                                            child: Assets.images.icons.bin
                                                .svg(height: 15.w),
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ).marginOnly(bottom: 100),
                        ],
                      ),
                    ),
                  ),
                  bookingProductWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bookingProductWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppWidgets.textLocale(
                  localeKey: "Заказанные товары",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorName.black)
              .marginOnly(top: 18),
          AppWidgets.textLocale(
                  localeKey: "Напитки",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorName.black)
              .marginOnly(top: 16),
          SizedBox(
            height: 15.w,
          ),
          AboutOrderWidgets.cocaColaItems(),
          SizedBox(
            height: 18.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AboutOrderWidgets.textBuilder(
                "Общая объем",
                "1365 о",
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              SizedBox(
                height: 12.w,
              ),
              AboutOrderWidgets.textBuilder(
                "Общее кол-во",
                "1258 шт",
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              SizedBox(
                height: 12.w,
              ),
              AboutOrderWidgets.textBuilder(
                "Общая сумма",
                "150 000 000 UZS",
                color: ColorName.button,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ],
          ),
          SizedBox(
            height: 24.w,
          )
        ],
      ),
    );
  }
}
