import 'package:agent/core/bloc/language/language_cubit.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/extensions/app_extensions.dart';

import 'settings_content.dart';
import 'settings_item.dart';
import 'settings_switch.dart';

class BasicSettingsWidget extends StatelessWidget {
  const BasicSettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SettingsContent(
            title: "ОСНОВНЫЕ НАСТРОЙКИ",
            items: [
              BlocBuilder<LanguageCubit, Locale>(
                bloc: LanguageCubit.to,
                builder: (context, state) {
                  return SettingsItem(
                    title: "Язык приложении",
                    text: LanguageCubit.to.title,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: false,
                        enableDrag: true,
                        builder: (context) => const LangBottomSheet(),
                      );
                    },
                  );
                },
              ),
              SettingsItem(
                title: "Тип клавиатуры",
                text: 'Маленький',
                onTap: () {},
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Полная синхоризация с фото",
                initial: false,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Печать с логотипом",
                initial: false,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Использовать новое окно заказа",
                initial: false,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Использовать Bluetooth - принтер",
                initial: false,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Использование календарного режима",
                initial: false,
              ),
              SettingsSwitch(
                onChanged: (bool v) {},
                title: "Использование скидки",
                initial: false,
                isLast: true,
              ),
            ],
          ),
          SettingsContent(
            title: "Натройки фильтра",
            items: [
              SettingsSwitch(
                title: "Показать товары которые  нет на складе",
                onChanged: (bool v) {},
              ),
              SettingsSwitch(
                title: "Сортировка клиентов в альфавитном порядке",
                onChanged: (bool v) {},
              ),
              SettingsSwitch(
                title: "Сортировка продуктов в альфавитном порядке",
                onChanged: (bool v) {},
                isLast: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class LangBottomSheet extends StatelessWidget {
  const LangBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      bloc: LanguageCubit.to,
      builder: (context, state) {
        return BottomSheetContent(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: List.generate(
                  3,
                  (index) {
                    Locale locale = LanguageCubit.to.locales[index];
                    return langItem(
                      onTap: () {
                        LanguageCubit.to.setLocale(locale);
                      },
                      title: LanguageCubit.to.localeName[index],
                      isActive: LanguageCubit.to.isActive(locale),
                    );
                  },
                ),
              ),
            ],
          ),
          action: AppWidgets.appButton(
            title: LocaleKeys.save.tr(),
            onTap: () {
              Navigator.pop(context);
            },
          ).paddingSymmetric(horizontal: 20.w, vertical: 20.w),
        );
      },
    );
  }

  Widget langItem({
    required VoidCallback onTap,
    required String title,
    bool isActive = false,
    bool isLast = false,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 52.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  isActive
                      ? const Icon(
                          Icons.check,
                          color: ColorName.button,
                        ).paddingOnly(right: 11.w)
                      : const SizedBox(),
                  AppWidgets.textLocale(
                    localeKey: title,
                    fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
                    fontSize: 16.sp,
                    color: isActive ? ColorName.button : Colors.black,
                  )
                ],
              ).paddingOnly(top: 16.w, left: 20.w),
              !isLast
                  ? Container(
                      height: 1,
                      color: ColorName.background,
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSheetContent extends StatelessWidget {
  final Widget content;
  final Widget action;
  final double? height;

  const BottomSheetContent({
    required this.content,
    required this.action,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildHeader(context),
          Expanded(child: content),
          action,
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: ColorName.white,
        ),
        const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: ColorName.gray2,
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Assets.images.icons.remove.svg(),
        ),
      ],
    ).paddingSymmetric(horizontal: 23.w, vertical: 10.w);
  }
}
