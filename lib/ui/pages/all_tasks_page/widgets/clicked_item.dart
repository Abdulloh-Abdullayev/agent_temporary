import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/all_tasks_page/bloc/all_task_bloc.dart';
import 'package:agent/ui/widgets/app_text_field.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class ClickedItemModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          ClickedItem.routeName,
          child: (context, args) => ClickedItem(),
        ),
      ];
}

class ClickedItem extends StatelessWidget {
  ClickedItem({Key? key}) : super(key: key);
  static const String routeName = '/clicked-item';
  var bloc = AllTaskBloc.to;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AllTaskBloc, AllTaskState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                Column(
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
                              AppWidgets.backButton(() {
                                Modular.to.pop();
                              }),
                              Container(
                                height: 28.w,
                                width: 28.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: ColorName.white.withOpacity(0.1),
                                ),
                                child: PopupMenu(
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
                          ).paddingSymmetric(
                            horizontal: 20.w,
                            vertical: 18.w,
                          ),
                          AppWidgets.textLocale(
                            localeKey: LocaleKeys.tasks,
                            color: ColorName.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                          )
                              .paddingSymmetric(horizontal: 20.w)
                              .paddingOnly(bottom: 25.w),
                        ],
                      ),
                    ),
                    Cards.cards_13(
                      name: "Osiyo market",
                      torgoviyTochka: "Торговая точка",
                      startTime: "Дата создание",
                      finishTime: "Дата Выполнение",
                      startDate: "12.10.2022",
                      finishDate: "12.10.2022",
                    ).paddingSymmetric(
                      horizontal: 20.w,
                      vertical: 18.w,
                    ),
                    Cards.cards_14(
                      primicheniya: "Примечание",
                      product:
                          "Кола 3 блок,Фанта 3 блок, динай 3 блок, Nestle 3 блок, Qibray 3 блок",
                      foto: "Фото",
                      image: "image",
                    ).paddingSymmetric(horizontal: 20.w),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 1.sw,
                    decoration: BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12.r),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppWidgets.textLocale(
                          localeKey: "План выполнен?",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ).paddingOnly(top: 25.w),
                        AppWidgets.textLocale(
                          localeKey: "Примечание",
                          fontSize: 14.sp,
                          color: ColorName.gray2,
                          fontWeight: FontWeight.w400,
                        ).paddingSymmetric(vertical: 12.w),
                        AppTextField(
                          hintText: "Пишите",
                          onChanged: (v) {},
                          title: "",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppWidgets.textLocale(
                              localeKey: "Фото",
                              fontSize: 14.sp,
                              color: ColorName.gray2,
                            ),
                            !state.completed
                                ? InkWell(
                                    onTap: () {
                                      bloc.add(ImageUploaded(state.image));
                                    },
                                    child: AppWidgets.textLocale(
                                      localeKey: "Загрузить фото",
                                      fontSize: 16.sp,
                                      color: ColorName.button,
                                      fontWeight: FontWeight.w600,
                                    ).paddingOnly(
                                      top: 24.w,
                                      bottom: 34.w,
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        state.completed
                            ? Wrap(children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  width: 104.w,
                                  height: 104.w,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: "state.image",
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.person),
                                  ),
                                ),
                              ]).paddingOnly(
                                top: 24.w,
                                bottom: 34.w,
                              )
                            : const SizedBox(),
                        Material(
                          color: ColorName.background,
                          borderRadius: BorderRadius.circular(12.r),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12.r),
                            onTap: () {},
                            child: Ink(
                              width: 1.sw,
                              decoration: BoxDecoration(
                                color: ColorName.background,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(color: ColorName.gray),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppWidgets.iconButton(
                                    onPressed: () {},
                                    icon: Assets.images.icons.arrowRight,
                                    bgColor: ColorName.button,
                                    height: 41.w,
                                    width: 41.w,
                                  ).paddingAll(3.w),
                                  AppWidgets.textLocale(
                                    textAlign: TextAlign.center,
                                    localeKey: "Заказ выполнен",
                                    color: ColorName.gray2,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  const SizedBox(),
                                ],
                              ),
                            ),
                          ),
                        ).paddingOnly(bottom: 18.w)
                      ],
                    ).paddingSymmetric(horizontal: 20.w),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
