import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';
import '../../../core/localization/locale_keys.g.dart';

import '../home/home_page.dart';
import 'bloc/auth/auth_cubit.dart';

class LoginPageModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<AuthCubit>(
          (i) => AuthCubit(),
          onDispose: (value) => value.close(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          LoginPage.routeName,
          child: (context, args) => LoginPage(),
        )
      ];
}

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  static const String routeName = "/loginPage";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: Modular.get<AuthCubit>(),
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            width: 1.sw,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 70.w,
                    backgroundColor: ColorName.gray6,
                  ).paddingSymmetric(
                    vertical: 60.w,
                  ),
                  AppWidgets.text(
                    text: LocaleKeys.welcome.tr(),
                    color: ColorName.black,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  AppWidgets.text(
                    text: LocaleKeys.enter_username_password.tr(),
                    color: ColorName.gray2,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ).paddingOnly(
                    top: 12,
                    bottom: 24,
                  ),
                  SizedBox(
                    width: 1.sw,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppWidgets.text(
                          text: LocaleKeys.server_name.tr(),
                          color: ColorName.gray3,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                        AppInputTextField(
                          hint: LocaleKeys.write.tr(),
                          onChanged: (v) {},
                        ).paddingOnly(
                          top: 12,
                          bottom: 24,
                        ),
                        AppWidgets.text(
                          text: LocaleKeys.enter.tr(),
                          color: ColorName.gray3,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                        AppInputTextField(
                          hint: LocaleKeys.write.tr(),
                          onChanged: (v) {},
                        ).paddingOnly(
                          top: 12,
                          bottom: 24,
                        ),
                        AppWidgets.text(
                          text: LocaleKeys.password.tr(),
                          color: ColorName.gray3,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                        PasswordTextField(
                          onChanged: (v) {},
                          isIconVisible: true,
                          hint: "************",
                        ).paddingOnly(
                          top: 12,
                          bottom: 24,
                        ),
                        AppButton(
                          width: 1.sw,
                          text: LocaleKeys.enter.tr(),
                          onPressed: () {
                            Modular.to.pushReplacementNamed(HomePage.routeName);
                          },
                          textColor: ColorName.white,
                        )
                      ],
                    ),
                  )
                ],
              ).paddingSymmetric(horizontal: 20),
            ),
          ),
        );
      },
    );
  }
}
