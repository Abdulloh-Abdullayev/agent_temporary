import 'dart:io';

import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/left_menu/bloc/left_menu_bloc.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uikit/uikit.dart';

class CreateAccountModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<LeftMenuBloc>(
          (i) => LeftMenuBloc(),
          onDispose: (value) => value.close(),
        ),
      ];

  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          CreateAccountWidget.routeName,
          child: (context, args) => CreateAccountWidget(),
        ),
      ];
}

class CreateAccountWidget extends StatelessWidget {
  CreateAccountWidget({Key? key}) : super(key: key);
  final ImagePicker picker = ImagePicker();
  static const String routeName = "/create-account";
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController lastPasCon = TextEditingController();
  TextEditingController newPasCon = TextEditingController();
  TextEditingController repeatNewPasCon = TextEditingController();
  var bloc = LeftMenuBloc.to;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorName.background,
        body: BlocBuilder<LeftMenuBloc, LeftMenuState>(
          bloc: bloc,
          builder: (context, state) {
            return ListView(
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () {
                          Modular.to.pop();
                        },
                        child: Container(
                          width: 28.w,
                          height: 28.w,
                          decoration: BoxDecoration(
                            color: ColorName.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Center(
                            child: Assets.images.icons.backIcon
                                .svg(fit: BoxFit.cover, color: ColorName.white),
                          ),
                        ).paddingSymmetric(vertical: 20.w),
                      ),
                      AppWidgets.textLocale(
                        localeKey: "Личные данные",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorName.white,
                      ).paddingOnly(bottom: 25.w),
                    ],
                  ).paddingSymmetric(horizontal: 20),
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 100.w,
                        height: 100.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorName.gray2,
                        ),
                        child: state.image != null
                            ? ClipOval(
                                child: Image.file(
                                  File(state.image!.path),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : CachedNetworkImage(
                                imageUrl: "",
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Icon(
                                  Icons.person,
                                  color: ColorName.white,
                                  size: 90.w,
                                ),
                              ),
                      ).paddingOnly(right: 12.w),
                      Positioned(
                        right: 0,
                        top: 1,
                        bottom: 1,
                        child: InkWell(
                          onTap: () {
                            bloc.add(
                              AccountImageUploaded(state.image),
                            );
                          },
                          child: Center(
                            child: Assets.images.icons.add.svg(
                              fit: BoxFit.cover,
                              width: 24.w,
                              height: 24.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ).paddingSymmetric(vertical: 12.w),
                Container(
                  width: 1.sw,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: ColorName.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgets.textLocale(
                        localeKey: "Ф.И.О",
                        fontSize: 14.sp,
                        color: ColorName.gray3,
                      ),
                      AppInputTextField(
                        hint: "Эшонов Фахриёр",
                        controller: nameController,
                        onChanged: (nameController) {},
                      ).paddingOnly(
                        top: 12,
                        bottom: 18,
                      ),
                      AppWidgets.textLocale(
                        localeKey: "Номер телефона",
                        fontSize: 14.sp,
                        color: ColorName.gray3,
                      ),
                      AppInputTextField(
                        controller: numberController,
                        prefix: AppWidgets.text(
                          text: "+998 ",
                          color: ColorName.gray3,
                        ),
                        onChanged: (numberController) {},
                      ).paddingOnly(top: 12),
                    ],
                  ).paddingSymmetric(
                    horizontal: 20.w,
                    vertical: 18.w,
                  ),
                ),
                Container(
                  width: 1.sw,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: ColorName.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgets.textLocale(
                        localeKey: "Изменить пароль",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ).paddingOnly(bottom: 18.w),
                      AppWidgets.textLocale(
                        localeKey: "Старый пароль",
                        fontSize: 14.sp,
                        color: ColorName.gray3,
                      ),
                      AppInputTextField(
                        hint: "************",
                        controller: lastPasCon,
                        onChanged: (nameController) {},
                      ).paddingOnly(
                        top: 12,
                        bottom: 18,
                      ),
                      AppWidgets.textLocale(
                        localeKey: "Новый пароль",
                        fontSize: 14.sp,
                        color: ColorName.gray3,
                      ),
                      AppInputTextField(
                        hint: "************",
                        controller: newPasCon,
                        onChanged: (numberController) {},
                      ).paddingOnly(
                        top: 12,
                        bottom: 18.w,
                      ),
                      AppWidgets.textLocale(
                        localeKey: "Повторите новый пароль",
                        fontSize: 14.sp,
                        color: ColorName.gray3,
                      ),
                      AppInputTextField(
                        hint: "************",
                        controller: repeatNewPasCon,
                        onChanged: (numberController) {},
                      ).paddingOnly(top: 12),
                    ],
                  ).paddingSymmetric(
                    horizontal: 20.w,
                    vertical: 18.w,
                  ),
                ).paddingSymmetric(vertical: 18.w),
                AppWidgets.appButton(
                  title: "Сохранить",
                  onTap: () {},
                ).paddingSymmetric(
                  horizontal: 20.w,
                  vertical: 18.w,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
