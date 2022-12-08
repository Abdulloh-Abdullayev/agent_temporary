import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class EquipmentDetails extends StatefulWidget {
  const EquipmentDetails({super.key});

  @override
  State<EquipmentDetails> createState() => _EquipmentDetailsState();
}

class _EquipmentDetailsState extends State<EquipmentDetails> {
  bool isShow = true;
  bool isHide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.background,
      body: SafeArea(
        child: Column(
          children: [
            appBarWidget(context),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 18,),
                    decoration: BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppWidgets.textLocale(
                              localeKey: "Тип",
                              fontSize: 14,
                              color: ColorName.gray2,
                            ),
                            AppWidgets.text(
                              text: "Холодильник",
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          height: 1,
                          color: ColorName.gray,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppWidgets.textLocale(
                              localeKey: "Дата прикрепления",
                              fontSize: 14,
                              color: ColorName.gray2,
                            ),
                            AppWidgets.text(
                              text: "12.10.2022",
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 16,
                            bottom: 16,
                          ),
                          height: 1,
                          color: ColorName.gray,
                        ),
                        AppWidgets.textLocale(
                          localeKey: "Комментарии",
                          fontSize: 14,
                          color: ColorName.gray2,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        isShow
                              ? Container(
                                  child: AppWidgets.textLocale(
                                      localeKey:
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                                      maxLines: 3),
                                )
                              : Container(
                                  child: AppWidgets.textLocale(
                                      localeKey:
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                                      maxLines: 100),
                                ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isShow = !isShow;
                                isHide = !isHide;
                              });
                            },
                            child: isHide
                                ? const Text("more",
                                    style: TextStyle(
                                      color: ColorName.button,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline,
                                    ),).paddingOnly(bottom: 18)
                                : const Text(
                                    "hide",
                                    style: TextStyle(
                                      color: ColorName.button,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ).paddingOnly(bottom: 18),
                          ),
                      ],
                    ).paddingOnly(
                      top: 18,
                      left: 20,
                      right: 20,
                    ),
                  ),
                  // Second container
                  obookingDteailsWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget obookingDteailsWidget() {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 398.w,
            padding: const EdgeInsets.only(
              top: 18,
              left: 20,
              right: 20,
            ),
            margin: const EdgeInsets.only(top: 18),
            decoration: BoxDecoration(
              color: ColorName.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidgets.textLocale(
                  localeKey: "О оборудования",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppWidgets.textLocale(
                      localeKey: "Серийный номер",
                      fontSize: 14,
                      color: ColorName.gray2,
                    ),
                    AppWidgets.text(
                      text: "12365489621321",
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  height: 1,
                  color: ColorName.gray,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppWidgets.textLocale(
                      localeKey: "Инвертарный номер",
                      fontSize: 14,
                      color: ColorName.gray2,
                    ),
                    AppWidgets.text(
                      text: "12365489621321",
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 16,
                    bottom: 16,
                  ),
                  height: 1,
                  color: ColorName.gray,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppWidgets.textLocale(
                      localeKey: "Состояние",
                      fontSize: 14,
                      color: ColorName.gray2,
                    ),
                    AppWidgets.text(
                      text: "Новый",
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 16),
                  height: 1,
                  color: ColorName.gray,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppWidgets.textLocale(
                      localeKey: "Дата производтсво",
                      fontSize: 14,
                      color: ColorName.gray2,
                    ),
                    AppWidgets.text(
                      text: "12.10.2022",
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 16),
                  height: 1,
                  color: ColorName.gray,
                ),
                AppWidgets.textLocale(
                  localeKey: "Фото",
                  fontSize: 14.sp,
                  color: ColorName.gray2,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  height: 104.w,
                  width: 104.w,
                  child: Image.asset('assets/images/person.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget appBarWidget(context) {
    return Container(
      height: 119.w,
      width: 1.sw,
      padding: const EdgeInsets.only(top: 19, left: 20, right: 20),
      decoration: const BoxDecoration(
        color: ColorName.primaryColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 28.h,
                  width: 28.w,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.10),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Assets.images.icons.left.svg(),
                  ),
                ),
              ),
              Container(
                height: 28.h,
                width: 28.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.10),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: PopupMenuTools(
                  onTap: (p0) {},
                  textName: const [
                    "Редактрировать",
                    'Удалить',
                  ],
                  icons: [
                    Assets.images.icons.edit.svg(),
                    Assets.images.icons.trash.svg(),
                  ],
                  textColor: const [
                    ColorName.button,
                    ColorName.red,
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          AppWidgets.textLocale(
            color: ColorName.white,
            localeKey: "Artel холодильник",
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          )
        ],
      ),
    );
  }
}
