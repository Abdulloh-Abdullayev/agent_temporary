import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/customer_data_editing_page/customer_data_editing_page.dart';
import 'package:agent/ui/pages/customer_data_page/bloc/customer_data_page_cubit.dart';
import 'package:agent/ui/pages/customer_data_page/customer_page_widgets/app_title_widget.dart';
import 'package:agent/ui/pages/customer_data_page/customer_page_widgets/customer_row_widget.dart';
import 'package:agent/ui/pages/order_page/order_page_widget/order_appbar_icon_widget.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerDataPageModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<CustomerDataPageCubit>(
          (i) => CustomerDataPageCubit(),
          onDispose: (v) => v.close(),
        ),
      ];

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
    appTitle = SizedBox();
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
    return BlocBuilder<CustomerDataPageCubit, CustomerDataPageState>(
      bloc: Modular.get<CustomerDataPageCubit>(),
      builder: (context, state) {
        return buildSafeArea(context);
      },
    );
  }

  Widget buildSafeArea(BuildContext context) {
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
                              return CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl:
                                    "https://img.freepik.com/premium-photo/astronaut-outer-open-space-planet-earth-stars-provide-background-erforming-space-planet-earth-sunrise-sunset-our-home-iss-elements-this-image-furnished-by-nasa_150455-16829.jpg?w=2000",
                                placeholder: (context, url) =>
                                    const CupertinoActivityIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.person),
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
                  buildGeneralInfo(),
                  builContactDetail(),
                  buildCustomerDetail(),
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

  Container buildCustomerDetail() {
    return Container(
      margin: EdgeInsets.only(bottom: 35.w),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: ColorName.white),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: AppWidgets.textLocale(
                localeKey: LocaleKeys.customer_details,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: ColorName.gray3,
                isRichText: true),
          ).paddingOnly(bottom: 16.w),
          rowWidget(LocaleKeys.inn.tr(), "465894132").paddingOnly(bottom: 16.w),
          const Divider(),
          rowWidget(LocaleKeys.rs.tr(), "465894132")
              .paddingOnly(bottom: 16.w, top: 16.w),
          const Divider(),
          rowWidget(LocaleKeys.bank.tr(), "Hamkorbank")
              .paddingOnly(bottom: 16.w, top: 16.w),
          const Divider(),
          rowWidget(LocaleKeys.mfo.tr(), "Lorem ipsum")
              .paddingOnly(bottom: 16.w, top: 16.w),
          const Divider(),
          rowWidget(LocaleKeys.oked.tr(), "465894132")
              .paddingOnly(bottom: 16.w, top: 16.w),
        ],
      ).paddingSymmetric(horizontal: 20.w, vertical: 18.w),
    );
  }

  Container builContactDetail() {
    return Container(
      margin: EdgeInsets.only(
        bottom: 12.w,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: ColorName.white),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: AppWidgets.textLocale(
                localeKey: LocaleKeys.contact_details,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: ColorName.gray3,
                isRichText: true),
          ).paddingOnly(bottom: 16.w),
          rowWidget(LocaleKeys.address.tr(), "Toshkent yunusobod")
              .paddingOnly(bottom: 16.w),
          const Divider(),
          rowWidget(LocaleKeys.reference_point.tr(), "64-avtobaza")
              .paddingOnly(bottom: 16.w, top: 16.w),
          const Divider(),
          rowWidget(LocaleKeys.contact_person.tr(), "Faxxriyorbek")
              .paddingOnly(bottom: 16.w, top: 16.w),
          const Divider(),
          rowWidget(LocaleKeys.note.tr(), "Lorem ipsum")
              .paddingOnly(bottom: 16.w, top: 16.w),
          const Divider(),
          rowWidget(LocaleKeys.phone_number.tr(), "+998 97 628 28 82")
              .paddingOnly(bottom: 16.w, top: 16.w),
          const Divider(),
          rowWidget(LocaleKeys.visit_days.tr(), "ПН. ВТ. СР")
              .paddingOnly(bottom: 16.w, top: 16.w),
          const Divider(),
          rowWidget(LocaleKeys.locations.tr(), LocaleKeys.view_on_map.tr(),
                  ColorName.button)
              .paddingOnly(bottom: 16.w, top: 16.w),
        ],
      ).paddingSymmetric(horizontal: 20.w, vertical: 18.w),
    );
  }

  Container buildGeneralInfo() {
    return Container(
      margin: EdgeInsets.only(
        bottom: 12.w,
        top: 18.w,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: ColorName.white),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: AppWidgets.textLocale(
                localeKey: LocaleKeys.general_information,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: ColorName.gray3,
                isRichText: true),
          ).paddingOnly(bottom: 16.w),
          rowWidget(LocaleKeys.outlet_name.tr(), "Osiyo markeet")
              .paddingOnly(bottom: 16.w),
          const Divider(),
          rowWidget(LocaleKeys.category.tr(), "Розница")
              .paddingOnly(bottom: 16.w, top: 16.w),
          const Divider(),
          rowWidget(LocaleKeys.territory.tr(), "Toshkent, Yunusobod")
              .paddingOnly(bottom: 16.w, top: 16.w),
          const Divider(),
          rowWidget(LocaleKeys.client_type.tr(), "Lorem ipsum")
              .paddingOnly(bottom: 16.w, top: 16.w),
          const Divider(),
          rowWidget(LocaleKeys.sales_channel.tr(), "Lorem ipsum")
              .paddingOnly(bottom: 16.w, top: 16.w),
        ],
      ).paddingSymmetric(horizontal: 20.w, vertical: 18.w),
    );
  }
}
