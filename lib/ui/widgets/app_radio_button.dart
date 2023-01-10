import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/models/enums/shipping_type.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/extensions/app_extensions.dart';

class AppRadioButton extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final ReportsDateType initial;

  const AppRadioButton(
      {required this.onChanged, required this.initial, Key? key})
      : super(key: key);

  @override
  _AppRadioButtonState createState() => _AppRadioButtonState();
}

class _AppRadioButtonState extends State<AppRadioButton> {
  late int _selection;

  @override
  void initState() {
    _selection = widget.initial == ReportsDateType.application_date ? 1 : 2;
    super.initState();
  }

  void selectTime(int timeSelected) {
    setState(() {
      _selection = timeSelected;
      widget.onChanged(_selection);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppWidgets.text(
          text: LocaleKeys.data.tr(),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: ColorName.gray3,
        ).paddingOnly(bottom: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildRadioButton(
              value: 1,
              text: LocaleKeys.application_date.tr(),
              onTap: () {
                setState(() {
                  _selection = 1;
                  selectTime(1);
                });
              },
              active: _selection == 1,
            ),
            buildRadioButton(
              value: 2,
              text: LocaleKeys.shipping_date.tr(),
              onTap: () {
                setState(() {
                  _selection = 2;
                  selectTime(2);
                });
              },
              active: _selection == 2,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildRadioButton({
    required String text,
    required VoidCallback onTap,
    required int value,
    bool active = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 18),
        height: 50.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: ColorName.gray,
              width: 1,
            ),
            color: active ? ColorName.input : Colors.white),
        child: Row(
          children: [
            Container(
              height: 14,
              width: 14,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: ColorName.gray),
                color: active ? ColorName.buttonColor : ColorName.bgColor,
              ),
            ),
            AppWidgets.textLocale(
              localeKey: text,
              color: ColorName.gray3,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ).paddingOnly(left: 8),
          ],
        ),
      ),
    );
  }
}
