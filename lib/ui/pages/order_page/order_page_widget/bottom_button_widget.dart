import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomButtonWidget extends StatelessWidget {
  const BottomButtonWidget({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorName.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      height: 83.w,
      child: Center(
        child: Container(
          height: 47.w,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: MaterialButton(
            onPressed: onTap,
            color: ColorName.button,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: AppWidgets.textLocale(
              localeKey: LocaleKeys.add_order,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: ColorName.white,
            ),
          ),
        ),
      ),
    );
  }
}
