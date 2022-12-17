import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/order_page/order_page.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class ExchangeWidgetModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          NextExchangeWidget.routeName,
          child: (context, args) => NextExchangeWidget(),
        ),
      ];
}

class NextExchangeWidget extends StatelessWidget {
  NextExchangeWidget({Key? key}) : super(key: key);

  static String routeName = "/exchange-widget";
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorName.bgColor,
      body: Stack(
        children: [
          ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 1.sw,
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
                          children: [
                            AppWidgets.iconButton(
                              onPressed: () {},
                              icon: Assets.images.icons.search1,
                            ).paddingOnly(right: 12.w),
                            AppWidgets.iconButton(
                              onPressed: () {},
                              icon: Assets.images.icons.filter,
                            )
                          ],
                        ),
                      ],
                    ),
                    AppWidgets.textLocale(
                      localeKey: "Обмен товара",
                      color: ColorName.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                    ).paddingOnly(
                      top: 18.w,
                      bottom: 4.w,
                    ),
                  ],
                ).paddingAll(20.w),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppWidgets.iconButton(
                    onPressed: () {
                      Modular.to.pop();
                    },
                    icon: Assets.images.icons.backIcon,
                    bgColor: const Color(0x1A7E7C7C),
                    iconColor: ColorName.black,
                  ),
                  AppWidgets.textLocale(
                    localeKey: "Обменять на",
                    color: ColorName.gray3,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(),
                ],
              ).paddingSymmetric(
                horizontal: 20.w,
                vertical: 16.w,
              ),
              Container(
                width: 1.sw,
                decoration: BoxDecoration(
                  color: ColorName.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.r),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppWidgets.textLocale(
                          localeKey: "Напитки",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        Assets.images.icons.arrowDown.svg(),
                      ],
                    ).paddingOnly(
                      top: 20.w,
                      bottom: 15.w,
                    ),
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 8,
                      controller: controller,
                      itemBuilder: (context, index) {
                        return Cards.cards_7(
                          name: "Coca cola 1.5",
                          context: context,
                          summa: LocaleKeys.amount.tr(),
                          summaNumber: "100 000",
                          blok: "Блок",
                          blokNumber: "1",
                          sht: "Шт",
                          shtNumber: "1",
                          image: "image",
                          blokRemove: () {},
                          blokAdd: () {},
                          shtRemove: () {},
                          shtAdd: () {},
                          nalichi: 'В наличие',
                          nalichiNumber: '20',
                        ).paddingOnly(bottom: 12.w);
                      },
                    ),
                  ],
                ).paddingSymmetric(horizontal: 20.w),
              ).paddingOnly(bottom: 80.w),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 1.sw,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -4),
                    blurRadius: 4,
                    color: Color(0x0A000000),
                  ),
                ],
                color: ColorName.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppWidgets.appButton(
                    width: 150,
                    title: LocaleKeys.draft.tr(),
                    onTap: () {},
                    color: ColorName.gray,
                    textColor: ColorName.mainColor,
                  ),
                  AppWidgets.appButton(
                    width: 150,
                    title: "Продолжить",
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) => ReasomnForReturnSheet(
                          text: 'Причина обмена',
                          textItemsName: const [
                            "Не получается продать",
                            "Lorem ipsum",
                            "Lorem ipsum",
                          ],
                          returnOnTapButton: () {
                            Modular.to.pushNamed(OrderPage.routeName);
                          },
                          quitOnTapButton: () {
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ).paddingSymmetric(
                horizontal: 20.w,
                vertical: 15.w,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
