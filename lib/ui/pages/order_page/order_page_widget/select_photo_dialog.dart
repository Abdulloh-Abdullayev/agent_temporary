import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/assets.gen.dart';

class SelectPhotoDialog extends StatelessWidget {
  const SelectPhotoDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AppWidgets.textLocale(
                      localeKey: LocaleKeys.select_photo_type,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ).paddingOnly(bottom: 4.w),
                ),
                InkWell(
                  onTap: () {
                    Modular.to.pop();
                  },
                  child: Assets.images.icons.remove.svg(
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppWidgets.textLocale(
                        localeKey: "Lorem Ipsum",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ).paddingOnly(bottom: 14.w, top: 14.w),
                    const Divider()
                  ],
                );
              },
            )
          ],
        ).paddingAll(24.w),
      ),
    );
  }
}
