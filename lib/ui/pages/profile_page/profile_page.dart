import 'dart:io';

import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/profile_page/bloc/profile_page_state.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/extensions/app_extensions.dart';
import 'package:uikit/uikit.dart';

import 'bloc/profile_page_cubit.dart';

class ProfilePageModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<ProfilePageCubit>(
          (i) => ProfilePageCubit(),
          onDispose: (value) => value.close(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          ProfilePage.routeName,
          child: (context, args) => ProfilePage(),
        ),
      ];
}

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  static const String routeName = "/profilePage";

  final cubit = ProfilePageCubit.to;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorName.background,
        body: BlocBuilder<ProfilePageCubit, ProfilePageState>(
          bloc: cubit,
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                buildSliverAppBar(),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      buildUserImage(state),
                      buildMainBody(),
                      AppWidgets.appButton(
                        title: LocaleKeys.save,
                        onTap: () {},
                      )
                          .paddingSymmetric(
                            horizontal: 20.w,
                          )
                          .paddingOnly(bottom: 20.w),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: ColorName.primaryColor,
      titleSpacing: 0,
      title: Column(
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
                child: Assets.images.icons.backIcon.svg(
                  fit: BoxFit.cover,
                  color: ColorName.white,
                ),
              ),
            ).paddingSymmetric(vertical: 20.w),
          ),
        ],
      ).paddingSymmetric(
        horizontal: 20.w,
      ),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(12.r),
        ),
      ),
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: AppWidgets.textLocale(
          localeKey: LocaleKeys.personal_data,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: ColorName.white,
        ).paddingOnly(
          top: 65.w,
          left: 20.w,
        ),
        collapseMode: CollapseMode.none,
      ),
      pinned: true,
      expandedHeight: 110.w,
    );
  }

  Widget buildMainBody() {
    return Column(
      children: [
        Container(
          width: 1.sw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: ColorName.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppWidgets.textLocale(
                localeKey: LocaleKeys.full_name,
                fontSize: 14.sp,
                color: ColorName.gray3,
              ),
              AppInputTextField(
                hint: "Эшонов Фахриёр",
                onChanged: (v) {
                  cubit.nameChange(v);
                },
              ).paddingOnly(
                top: 12,
                bottom: 18,
              ),
              AppWidgets.textLocale(
                localeKey: LocaleKeys.phone_number,
                fontSize: 14.sp,
                color: ColorName.gray3,
              ),
              AppInputTextField(
                prefix: AppWidgets.text(
                  text: "+998 ",
                  color: ColorName.gray3,
                ),
                onChanged: (v) {
                  cubit.phoneNumberChange(v);
                },
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
            color: ColorName.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppWidgets.textLocale(
                localeKey: LocaleKeys.change_password,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ).paddingOnly(bottom: 18.w),
              AppWidgets.textLocale(
                localeKey: LocaleKeys.old_password,
                fontSize: 14.sp,
                color: ColorName.gray3,
              ),
              AppInputTextField(
                hint: "************",
                onChanged: (v) {},
              ).paddingOnly(
                top: 12,
                bottom: 18,
              ),
              AppWidgets.textLocale(
                localeKey: LocaleKeys.new_password,
                fontSize: 14.sp,
                color: ColorName.gray3,
              ),
              AppInputTextField(
                hint: "************",
                onChanged: (v) {},
              ).paddingOnly(
                top: 12,
                bottom: 18.w,
              ),
              AppWidgets.textLocale(
                localeKey: LocaleKeys.repeat_new_password,
                fontSize: 14.sp,
                color: ColorName.gray3,
              ),
              AppInputTextField(
                hint: "************",
                onChanged: (v) {},
              ).paddingOnly(top: 12),
            ],
          ).paddingSymmetric(
            horizontal: 20.w,
            vertical: 18.w,
          ),
        ).paddingSymmetric(vertical: 18.w),
      ],
    );
  }

  Widget buildUserImage(ProfilePageState state) {
    return Center(
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
            child: GestureDetector(
              onTap: () {
                cubit.onImageUploaded();
              },
              child: Center(
                child: Assets.images.icons.add.svg(
                  fit: BoxFit.cover,
                  width: 25.w,
                  height: 25.w,
                ),
              ),
            ),
          ),
        ],
      ),
    ).paddingSymmetric(vertical: 18.w);
  }
}
