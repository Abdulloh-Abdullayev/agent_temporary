import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/equipment_page/pages/equipment_items_page.dart';
import 'package:agent/ui/pages/equipment_page/widgets/equipment_widgets.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class AddEquipmentModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AddEquipmentPage.routeName,
          child: (context, args) => const AddEquipmentPage(),
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

class AddEquipmentPage extends StatefulWidget {
  static const String routeName = "/add-equepment-page";

  const AddEquipmentPage({super.key});
  @override
  State<AddEquipmentPage> createState() => _AddEquipmentPageState();
}

class _AddEquipmentPageState extends State<AddEquipmentPage> {
  final typeController = TextEditingController();
  final namecontroller = TextEditingController();
  final serialNumberController = TextEditingController();
  final inventNumberController = TextEditingController();
  final productionDateController = TextEditingController();
  final commitController = TextEditingController();
  final stateController = TextEditingController();
  final attachmentDateController = TextEditingController();
  final photoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            EquipmentWidgets.appBar(
              title: LocaleKeys.adding_hardware.tr(),
              context: context,
              ontap: () {
                Navigator.pop(context);
              },
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
                        top: 24,
                        left: 20,
                        right: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppWidgets.textLocale(
                            localeKey: LocaleKeys.equipment_type,
                            fontSize: 14,
                          ),
                          DropDown(
                              height: 44.h,
                              width: 335.w,
                              items: const [
                                "Оптом",
                                "Розница",
                                "Супермаркеты",
                                "Lorem ipsum",
                              ],
                              title: LocaleKeys.select.tr(),
                              onChange: (value) => typeController).marginOnly(
                            top: 12,
                          ),

                          // Equipment Type
                          AppWidgets.textLocale(
                            localeKey: LocaleKeys.equipment_name,
                            fontSize: 14,
                          ).marginOnly(
                            top: 18,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          AppInputTextField(
                            height: 44.h,
                            hint: LocaleKeys.write.tr(),
                            controller: typeController,
                          ),

                          // Serial Number
                          AppWidgets.textLocale(
                            localeKey: LocaleKeys.serial_number,
                            fontSize: 14,
                          ).marginOnly(
                            top: 18,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          AppInputTextField(
                            height: 44.h,
                            hint: LocaleKeys.write.tr(),
                            controller: serialNumberController,
                          ),

                          // Invent number
                          AppWidgets.textLocale(
                            localeKey: LocaleKeys.invert_number,
                            fontSize: 14,
                          ).marginOnly(
                            top: 18,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          AppInputTextField(
                            height: 44.h,
                            hint: LocaleKeys.write.tr(),
                            controller: inventNumberController,
                          ),

                          // Production Date
                          AppWidgets.textLocale(
                            localeKey: LocaleKeys.production_date,
                            fontSize: 14,
                          ).marginOnly(
                            top: 18,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          AppInputTextField(
                            height: 44.h,
                            controller: productionDateController,
                            prefix: Assets.images.icons.calender
                                .svg(
                                  color: ColorName.gray2,
                                  width: 16,
                                )
                                .marginOnly(right: 15),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: DateTimeDialog(
                                    title: LocaleKeys.add_consignment.tr(),
                                    closeTitle: LocaleKeys.close.tr(),
                                    addTitle: LocaleKeys.add.tr(),
                                    addTap: () {},
                                  ),
                                ),
                              );
                            },
                            hint: LocaleKeys.select.tr(),
                          ),

                          // Commit
                          AppWidgets.textLocale(
                            localeKey: LocaleKeys.comment,
                            fontSize: 14,
                          ).marginOnly(
                            top: 18,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          AppInputTextField(
                            height: 44.h,
                            hint: LocaleKeys.write.tr(),
                            controller: commitController,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  content: CommitTextField(
                                    text: LocaleKeys.adding_comments.tr(),
                                  ),
                                ),
                              );
                            },
                          ),

                          // State
                          AppWidgets.textLocale(
                            localeKey: LocaleKeys.state,
                            fontSize: 14,
                          ).marginOnly(
                            top: 18,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          AppInputTextField(
                            height: 44.h,
                            hint: LocaleKeys.write.tr(),
                            controller: stateController,
                          ),

                          // Attachment Date
                          AppWidgets.textLocale(
                            localeKey: LocaleKeys.attachment_date,
                            fontSize: 14,
                          ).marginOnly(
                            top: 18,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          AppInputTextField(
                            height: 44.h,
                            hint: LocaleKeys.write.tr(),
                            controller: attachmentDateController,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: DateTimeDialog(
                                    title: LocaleKeys.add_consignment.tr(),
                                    closeTitle: LocaleKeys.close.tr(),
                                    addTitle: LocaleKeys.add.tr(),
                                    addTap: () {},
                                  ),
                                ),
                              );
                            },
                            prefix: Assets.images.icons.calender
                                .svg(
                                  color: ColorName.gray2,
                                  width: 16,
                                )
                                .marginOnly(right: 15),
                          ),

                          // Photo Updating
                          SizedBox(
                            height: 18.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppWidgets.textLocale(
                                localeKey: LocaleKeys.photo,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: ColorName.gray2,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: AppWidgets.textLocale(
                                  localeKey: LocaleKeys.upload_photo,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: ColorName.button,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 86.h,
                    color: ColorName.bgColor,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppButton(
                            width: 162.w,
                            text: LocaleKeys.draft.tr(),
                            color: ColorName.gray,
                            textColor: ColorName.mainColor,
                            splashColor: ColorName.white,
                            onPressed: () {},
                          ),
                          AppButton(
                            width: 162.w,
                            text: LocaleKeys.add.tr(),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const EquipmentItems(),
                                ),
                              );
                            },
                            textColor: ColorName.white,
                          ),
                        ],
                      ),
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
