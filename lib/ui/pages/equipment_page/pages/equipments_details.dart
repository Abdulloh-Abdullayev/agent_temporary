import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class EquipmentDetails extends StatelessWidget {
  const EquipmentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            appBarWidget(context),
            Expanded(
              child: ListView(
                children: [
                  // First container
                  Container(
                    height: 243.h,
                    margin: const EdgeInsets.only(top: 18),
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
                              localeKey: LocaleKeys.type,
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
                              localeKey: LocaleKeys.attachment_date,
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
                          localeKey: LocaleKeys.comment,
                          fontSize: 14,
                          color: ColorName.gray2,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        AppWidgets.text(
                          text:
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                          fontSize: 14,
                        ),
                      ],
                    ).paddingOnly(
                      top: 18,
                      left: 20,
                      right: 20,
                    ),
                  ),

                  // Second container
                  Container(
                    height: 398.h,
                    margin: const EdgeInsets.only(top: 18),
                    decoration: BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppWidgets.textLocale(
                          localeKey: LocaleKeys.about_equipment,
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
                              localeKey: LocaleKeys.serial_number,
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
                              localeKey: LocaleKeys.invert_number,
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
                          margin: const EdgeInsets.only(top: 16, bottom: 16),
                          height: 1,
                          color: ColorName.gray,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppWidgets.textLocale(
                              localeKey: LocaleKeys.state,
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
                              localeKey: LocaleKeys.production_date,
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
                          localeKey: LocaleKeys.photo,
                          fontSize: 14,
                          color: ColorName.gray2,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          height: 104,
                          width: 104.w,
                          child: Image.asset('assets/images/person.png'),
                        ),
                      ],
                    ).paddingOnly(
                      top: 18,
                      left: 20,
                      right: 20,
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

  Widget appBarWidget(context) {
    return Container(
      height: 139.h,
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
              Container(
                height: 28.h,
                width: 28.w,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.10),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
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
                  textName: [
                    LocaleKeys.edit.tr(),
                    LocaleKeys.delete.tr(),
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
