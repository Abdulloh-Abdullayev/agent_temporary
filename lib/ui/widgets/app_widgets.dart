import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_rich_text/super_rich_text.dart';
import 'package:agent/core/utils/colors.gen.dart';

class AppWidgets {
  static void showText({
    required String text,
    Duration? duration,
  }) {
    duration ??= const Duration(seconds: 2);
    BotToast.showText(
      text: text,
      textStyle: GoogleFonts.inter(
        fontSize: 14.sp,
        color: Colors.white,
      ),
      align: Alignment.center,
      duration: duration,
    );
  }

  static Widget appButton({
    required String title,
    required VoidCallback onTap,
    double? width,
    double? height,
    Color color = ColorName.gray6,
    Color textColor = ColorName.black,
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.w600,
    double borderRadius = 12.0,
    Widget icon = const SizedBox(),
  }) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        child: Ink(
          width: width ?? ScreenUtil().screenWidth,
          height: height ?? 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                textLocale(
                  textAlign: TextAlign.center,
                  localeKey: title,
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget text({
    required String text,
    Color color = ColorName.black,
    double fontSize = 16,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.w400,
    EdgeInsets padding = const EdgeInsets.all(0),
    TextAlign textAlign = TextAlign.start,
    int maxLines = 3,
    TextStyle? textStyle,
    fontStyle = FontStyle.normal,
    bool isRichText = false,
    List<MarkerText> othersMarkers = const [],
  }) {
    if (isRichText) {
      return Padding(
        padding: padding,
        child: SuperRichText(
          text: text,
          style:textStyle ?? GoogleFonts.inter(
            color: color,
            fontSize: fontSize.sp,
            decoration: decoration,
            fontWeight: fontWeight,
          ),
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          othersMarkers: othersMarkers,
        ),
      );
    }
    return Padding(
      padding: padding,
      child: Text(
        text,
        style:textStyle ?? GoogleFonts.inter(
          color: color,
          fontSize: fontSize.sp,
          decoration: decoration,
          fontWeight: fontWeight,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static Widget textLocale({
    required String localeKey,
    Color color = ColorName.black,
    double fontSize = 16,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.w400,
    EdgeInsets padding = const EdgeInsets.all(0),
    TextAlign textAlign = TextAlign.start,
    int maxLines = 3,
    bool isRichText = false,
    TextStyle? textStyle,
    List<MarkerText> othersMarkers = const [],
    List<String>? args,
    Map<String, String>? namedArgs,
  }) {
    if (isRichText) {
      return Padding(
        padding: padding,
        child: SuperRichText(
          text: tr(
            localeKey,
            args: args,
            namedArgs: namedArgs,
          ),
          style: textStyle ??
              TextStyle(
                  color: color,
                  fontSize: fontSize.sp,
                  decoration: decoration,
                  fontWeight: fontWeight,
                  fontFamily: "Gilroy"),
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          othersMarkers: othersMarkers,
        ),
      );
    }
    return Padding(
      padding: padding,
      child: Text(
        localeKey,
        style:textStyle ?? GoogleFonts.inter(
          color: color,
          fontSize: fontSize.sp,
          decoration: decoration,
          fontWeight: fontWeight,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      ).tr(
        args: args,
        namedArgs: namedArgs,
      ),
    );
  }
}
