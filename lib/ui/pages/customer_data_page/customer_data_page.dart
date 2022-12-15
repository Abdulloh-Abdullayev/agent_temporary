import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/customer_data_editing_page/customer_data_editing_page.dart';
import 'package:agent/ui/pages/customer_data_page/customer_page_widgets/app_title_widget.dart';
import 'package:agent/ui/pages/customer_data_page/customer_page_widgets/customer_row_widget.dart';
import 'package:agent/ui/pages/order_page/order_page_widget/order_appbar_icon_widget.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerDataPageModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          CustomerDataPage.routeName,
          child: (context, args) => const CustomerDataPage(),
        ),
      ];
}

class CustomerDataPage extends StatefulWidget {
  const CustomerDataPage({Key? key}) : super(key: key);
  static const String routeName = "/CustomerDataPage";

  @override
  State<CustomerDataPage> createState() => _CustomerDataPageState();
}

class _CustomerDataPageState extends State<CustomerDataPage> {
  late ScrollController scrolController;

  var color = ColorName.black.withOpacity(0.3);
  dynamic appTitle = const AppTitleWidget();

  @override
  void initState() {
    scrolController = ScrollController();
    scrolController.addListener(scrollListener);
    super.initState();
  }

  scrollListener() {
    if (scrolController.offset >= scrolController.position.extentAfter &&
        !scrolController.position.outOfRange) {
      setState(() {
        color = ColorName.primaryColor;
        appTitle = const AppTitleWidget();
      });
    }
    if (scrolController.offset <= scrolController.position.minScrollExtent &&
        !scrolController.position.outOfRange) {
      setState(() {
        color = ColorName.black.withOpacity(0.6);
        appTitle = const SizedBox();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: scrolController,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      SizedBox(
                        height: 306.w,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          child: PageView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Image.network(
                                "https://img.freepik.com/premium-photo/astronaut-outer-open-space-planet-earth-stars-provide-background-erforming-space-planet-earth-sunrise-sunset-our-home-iss-elements-this-image-furnished-by-nasa_150455-16829.jpg?w=2000",
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 22.w,
                          right: 20.w,
                        ),
                        height: 31.w,
                        width: 45.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorName.black.withOpacity(0.3),
                        ),
                        child: Center(
                          child: AppWidgets.textLocale(
                              localeKey: "1/10",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              isRichText: true,
                              color: ColorName.white),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 12.w,
                      top: 18.w,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ColorName.white),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AppWidgets.textLocale(
                              localeKey: "Общие данные",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorName.gray3,
                              isRichText: true),
                        ).paddingOnly(bottom: 16.w),
                        rowWidget("Наз. торговой точки", "Osiyo market")
                            .paddingOnly(bottom: 16.w),
                        const Divider(),
                        rowWidget(LocaleKeys.category.tr(), "Розница")
                            .paddingOnly(bottom: 16.w, top: 16.w),
                        const Divider(),
                        rowWidget("Территория", "Toshkent, Yunusobod")
                            .paddingOnly(bottom: 16.w, top: 16.w),
                        const Divider(),
                        rowWidget("Тип клиента", "Lorem ipsum")
                            .paddingOnly(bottom: 16.w, top: 16.w),
                        const Divider(),
                        rowWidget("Канал сбыта", "Lorem ipsum")
                            .paddingOnly(bottom: 16.w, top: 16.w),
                      ],
                    ).paddingSymmetric(horizontal: 20.w, vertical: 18.w),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 12.w,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ColorName.white),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AppWidgets.textLocale(
                              localeKey: "Контактные данные",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorName.gray3,
                              isRichText: true),
                        ).paddingOnly(bottom: 16.w),
                        rowWidget("Адрес", "Toshkent yunusobod")
                            .paddingOnly(bottom: 16.w),
                        const Divider(),
                        rowWidget("Ориентир", "64-avtobaza")
                            .paddingOnly(bottom: 16.w, top: 16.w),
                        const Divider(),
                        rowWidget("Контактное лицо", "Faxxriyorbek")
                            .paddingOnly(bottom: 16.w, top: 16.w),
                        const Divider(),
                        rowWidget("Примечание", "Lorem ipsum")
                            .paddingOnly(bottom: 16.w, top: 16.w),
                        const Divider(),
                        rowWidget("Номер телефона", "+998 97 628 28 82")
                            .paddingOnly(bottom: 16.w, top: 16.w),
                        const Divider(),
                        rowWidget("Дни посещения", "ПН. ВТ. СР")
                            .paddingOnly(bottom: 16.w, top: 16.w),
                        const Divider(),
                        rowWidget("Местоположения", "Посмотреть на карте",
                                ColorName.button)
                            .paddingOnly(bottom: 16.w, top: 16.w),
                      ],
                    ).paddingSymmetric(horizontal: 20.w, vertical: 18.w),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 35.w),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ColorName.white),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AppWidgets.textLocale(
                              localeKey: "Реквизиты клиента",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorName.gray3,
                              isRichText: true),
                        ).paddingOnly(bottom: 16.w),
                        rowWidget("ИНН", "465894132").paddingOnly(bottom: 16.w),
                        const Divider(),
                        rowWidget("Р/C", "465894132")
                            .paddingOnly(bottom: 16.w, top: 16.w),
                        const Divider(),
                        rowWidget("Банк", "Hamkorbank")
                            .paddingOnly(bottom: 16.w, top: 16.w),
                        const Divider(),
                        rowWidget("МФО", "Lorem ipsum")
                            .paddingOnly(bottom: 16.w, top: 16.w),
                        const Divider(),
                        rowWidget("ОКЕД", "465894132")
                            .paddingOnly(bottom: 16.w, top: 16.w),
                      ],
                    ).paddingSymmetric(horizontal: 20.w, vertical: 18.w),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Container(
                color: color,
                height: 82.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        AppBarIcon.backButton(() {
                          Modular.to.pop();
                        }).paddingOnly(right: 18.w),
                        appTitle,
                      ],
                    ),
                    AppBarIcon.editeButton(() {
                      Modular.to.pushNamed(CustomerDataEditingPage.routeName);
                    })
                  ],
                ).paddingSymmetric(horizontal: 20.w),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
