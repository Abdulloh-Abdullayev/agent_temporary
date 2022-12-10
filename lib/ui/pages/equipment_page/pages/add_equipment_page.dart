import 'dart:io';

import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/equipment_page/pages/equipment_items_page.dart';
import 'package:agent/ui/pages/equipment_page/widgets/equipment_widgets.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
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
  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      if (pickedfiles != null) {
        imagefiles = pickedfiles;
        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

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
                      padding:  EdgeInsets.only(
                        top: 24.w,
                        left: 20.w,
                        right: 20.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppWidgets.textLocale(
                            localeKey: "Тип оборудование ",
                            fontSize: 14.sp,
                          ),
                          DropDown(
                              height: 44.w,
                              width: 335.w,
                              items: const [
                                "Оптом",
                                "Розница",
                                "Супермаркеты",
                                "Lorem ipsum",
                              ],
                              title: "Выбрать",
                              onChange: (value) => typeController).marginOnly(
                            top: 12.w,
                          ),

                          // Equipment Type
                          AppWidgets.textLocale(
                            localeKey: "Название оборудования",
                            fontSize: 14.sp,
                          ).marginOnly(
                            top: 18.w,
                          ),
                           SizedBox(
                            height: 12.w,
                          ),
                          AppInputTextField(
                            height: 44.w,
                            hint: "Пишите",
                            controller: typeController,
                          ),

                          // Serial Number
                          AppWidgets.textLocale(
                            localeKey: "Серийный номер",
                            fontSize: 14.sp,
                          ).marginOnly(
                            top: 18.w,
                          ),
                           SizedBox(
                            height: 12.w,
                          ),
                          AppInputTextField(
                            height: 44.w,
                            hint: "Пишите",
                            controller: serialNumberController,
                          ),

                          // Invent number
                          AppWidgets.textLocale(
                            localeKey: "Инвертарный номер",
                            fontSize: 14,
                          ).marginOnly(
                            top: 18.w,
                          ),
                           SizedBox(
                            height: 12.w,
                          ),
                          AppInputTextField(
                            height: 44.w,
                            hint: "Пишите",
                            controller: inventNumberController,
                          ),

                          // Production Date
                          AppWidgets.textLocale(
                            localeKey: "Дата производство",
                            fontSize: 14.sp,
                          ).marginOnly(
                            top: 18.w,
                          ),
                           SizedBox(
                            height: 12.w,
                          ),
                          AppInputTextField(
                            height: 44.w,
                            controller: productionDateController,
                            prefix: Assets.images.icons.calender
                                .svg(
                                  color: ColorName.gray2,
                                  width: 16.w,
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
                          AppWidgets.textLocale(
                            localeKey: "Комментарий",
                            fontSize: 14,
                          ).marginOnly(
                            top: 18.w,
                          ),
                           SizedBox(
                            height: 12.w,
                          ),
                          AppInputTextField(
                            height: 44.w,
                            hint: "Пишите",
                            controller: commitController,
                            onTap: () {},
                          ),

                          // State
                          AppWidgets.textLocale(
                            localeKey: "Состояние",
                            fontSize: 14.sp,
                          ).marginOnly(
                            top: 18.w,
                          ),
                           SizedBox(
                            height: 12.w,
                          ),
                          AppInputTextField(
                            height: 44.h,
                            hint: "Пишите",
                            controller: stateController,
                          ),

                          // Attachment Date
                          AppWidgets.textLocale(
                            localeKey: "Дата прикрепления",
                            fontSize: 14.sp,
                          ).marginOnly(
                            top: 18.w,
                          ),
                           SizedBox(
                            height: 12.w,
                          ),
                          AppInputTextField(
                            height: 44.w,
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
                            prefix: Assets.images.icons.calender
                                .svg(
                                  color: ColorName.gray2,
                                  width: 16.w,
                                )
                                .marginOnly(right: 15.w),
                          ),

                          // Photo Updating
                          SizedBox(
                            height: 18.w,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppWidgets.textLocale(
                                localeKey: "Фото",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: ColorName.gray2,
                              ),
                              TextButton(
                                onPressed: () async {
                                  openImages();
                                },
                                child: AppWidgets.textLocale(
                                  localeKey: "Загрузить фото",
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorName.button,
                                ),
                              ),
                            ],
                          ),
                          imagefiles != null
                              ? Wrap(
                                  children: imagefiles!.map((imageone) {
                                    return Container(
                                      margin:const EdgeInsets.all(4),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: SizedBox(
                                          
                                          height: 104.w,
                                          width: 100.w,
                                          child: Image.file(File(imageone.path), fit: BoxFit.cover,),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                )
                              : Container(),
                           SizedBox(
                            height: 24.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 86.w,
                    color: ColorName.background,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppButton(
                            width: 162.w,
                            text: "Черновик",
                            color: ColorName.gray,
                            textColor: ColorName.mainColor,
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
