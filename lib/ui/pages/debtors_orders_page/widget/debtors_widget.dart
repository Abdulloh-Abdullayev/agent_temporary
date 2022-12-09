import 'package:agent/core/utils/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DebtorsWidget {
  /// TextStyle
  static final TextStyle _fontStyle = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorName.white,
  );

  /// TextStyle
  static final TextStyle _dataColumnStyle = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: ColorName.gray2,
  );

  // color
  static List<Color> colors = [
    ColorName.gray3,
    ColorName.green,
    ColorName.black,
    ColorName.red,
  ];

  /// appbar

  static dataColumn(String name, {Alignment align = Alignment.centerLeft}) {
    return DataColumn(
      label: Expanded(
        child: Align(
          alignment: align,
          child: Text(name, style: _dataColumnStyle),
        ),
      ),
    );
  }

  static dataRow(List<String> names, {TextStyle? style}) {
    return DataRow(
      cells: [
        for (var e in names)
          DataCell(
            Align(
              alignment: e == names.last
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Text(
                e,
                style: TextStyle(color: colors[findColor(e)]),
              ),
            ),
          ),
      ],
    );
  }

  static int findColor(String text) {
    if (text.contains("-")) {
      return 3;
    } else if (text.contains("+")) {
      return 1;
    } else if (int.tryParse(
        text.replaceAll(RegExp(r'([a-z]|[A-Z])|\ *'), "")) !=
        null) {
      return 2;
    } else {
      return 0;
    }
  }
}
