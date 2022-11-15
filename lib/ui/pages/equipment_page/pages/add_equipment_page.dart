import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/equipment_page/pages/equipment_items_page.dart';
import 'package:agent/ui/pages/equipment_page/widgets/equipment_widgets.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
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
              title: "Добавление Оборудование",
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
                          AppWidgets.text(
                            text: "Тип оборудование ",
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
                              title: "Выбрать",
                              onChange: (value) => typeController).marginOnly(
                            top: 12,
                          ),

                          // Equipment Type  
                          AppWidgets.text(
                            text: "Название оборудования",
                            fontSize: 14,
                          ).marginOnly(
                            top: 18,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          AppInputTextField(
                            height: 44.h,
                            hint: "Пишите",
                            controller: typeController,
                          ),

                          // Serial Number   
                          AppWidgets.text(
                            text: "Серийный номер",
                            fontSize: 14,
                          ).marginOnly(
                            top: 18,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          AppInputTextField(
                            height: 44.h,
                            hint: "Пишите",
                            controller: serialNumberController,
                          ),

                          // Invent number
                          AppWidgets.text(
                            text: "Инвертарный номер",
                            fontSize: 14,
                          ).marginOnly(
                            top: 18,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          AppInputTextField(
                            height: 44.h,
                            hint: "Пишите",
                            controller: inventNumberController,
                          ),

              

                          // Production Date
                          AppWidgets.text(
                            text: "Дата производство",
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
                            prefix: Assets.images.icons.calendar
                                .svg(
                                  color: ColorName.gray2,
                                  width: 2,
                                )
                                .marginOnly(right: 15),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: DateTimeDialog(
                                    title: "Добавить консигнация",
                                    closeTitle: "Закрыть",
                                    addTitle: "Добавить",
                                    addTap: () {},
                                  ),
                                ),
                              );
                            },
                            hint: "Выбрать",
                          ),

                          // Commit 
                          AppWidgets.text(
                            text: "Комментарий",
                            fontSize: 14,
                          ).marginOnly(
                            top: 18,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          AppInputTextField(
                            height: 44.h,
                            hint: "Пишите",
                            controller: commitController,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => const AlertDialog(
                                  content: CommitTextField(
                                    text: "Добавление комментарии",
                                  ),
                                ),
                              );
                            },
                          ),

                          // State
                          AppWidgets.text(
                            text: "Состояние",
                            fontSize: 14,
                          ).marginOnly(
                            top: 18,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          AppInputTextField(
                            height: 44.h,
                            hint: "Пишите",
                            controller: stateController,
                          ),
 
                          // Attachment Date
                          AppWidgets.text(
                            text: "Дата прикрепления",
                            fontSize: 14,
                          ).marginOnly(
                            top: 18,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          AppInputTextField(
                            height: 44.h,
                            hint: "Пишите",
                            controller: attachmentDateController,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: DateTimeDialog(
                                    title: "Добавить консигнация",
                                    closeTitle: "Закрыть",
                                    addTitle: "Добавить",
                                    addTap: () {},
                                  ),
                                ),
                              );
                            },
                            prefix: Assets.images.icons.calendar
                                .svg(
                                  color: ColorName.gray2,
                                  width: 12,
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
                              AppWidgets.text(
                                text: "Фото",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: ColorName.gray2,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: AppWidgets.text(
                                  text: "Загрузить фото",
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
                            text: "Черновик",
                            color: ColorName.gray,
                            textColor: ColorName.main,
                            splashColor: ColorName.white,
                            onPressed: () {},
                          ),
                          AppButton(
                            width: 162.w,
                            text: "Добавить",
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
