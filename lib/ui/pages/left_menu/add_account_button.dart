import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/extensions/app_extensions.dart';

class AddAccountButton extends StatelessWidget {
  const AddAccountButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Ink(
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.add,
                  color: ColorName.textAddAccount,
                ).paddingOnly(left: 20.w),
                AppWidgets.textLocale(
                  localeKey: LocaleKeys.add_account,
                  color: ColorName.textAddAccount,
                ).paddingOnly(left: 12.w),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
