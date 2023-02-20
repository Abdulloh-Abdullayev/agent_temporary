import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserSwitchPage extends StatelessWidget {
  const UserSwitchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.7),
        body: Column(
          children: [
            AppWidgets.textLocale(
              localeKey: "Переключение пользователя",
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
            ).paddingOnly(top: 50.w),
            AppWidgets.textLocale(
              localeKey:
                  "Проверяем ваш аккаунт. Не отключаете интернет, пока процесс не завершено.",
              color: Colors.white,
              textAlign: TextAlign.center,
            ).paddingSymmetric(horizontal: 20.w, vertical: 30.w),
            Expanded(
              child: Center(
                child: const CupertinoActivityIndicator(
                  radius: 30,
                  color: Colors.white,
                ),
              ),
            ),
            AppWidgets.appButton(
              title: "Cancel",
              width: 200,
              color: ColorName.red,
              borderColor: Colors.white,
              borderRadius: 25.r,
              onTap: () {
                Modular.to.pop();
              },
            ).paddingSymmetric(horizontal: 20.w, vertical: 30.w)
          ],
        ),
      ),
    );
  }
}
