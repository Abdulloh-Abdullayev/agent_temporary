import 'dart:io';
import 'dart:ui';

import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_rich_text/super_rich_text.dart';

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
    Color color = ColorName.buttonColor,
    Color textColor = ColorName.white,
    Color borderColor = Colors.transparent,
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.w600,
    double borderRadius = 8.0,
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
    TextStyle? textStyle,
    Color color = ColorName.black,
    double fontSize = 16,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.w400,
    EdgeInsets padding = const EdgeInsets.all(0),
    TextAlign textAlign = TextAlign.start,
    int maxLines = 3,
    fontStyle = FontStyle.normal,
    double height = 1.0,
    bool isRichText = false,
    List<MarkerText> othersMarkers = const [],
  }) {
    if (isRichText) {
      return Padding(
        padding: padding,
        child: SuperRichText(
          text: text,
          style: GoogleFonts.inter(
            textStyle: textStyle,
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
        style: GoogleFonts.inter(
          color: color,
          textStyle: textStyle,
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
    double height = 1.0,
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
          style: GoogleFonts.inter(
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
        localeKey,
        style: GoogleFonts.inter(
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

  static Widget imgError({
    double height = 50,
    double width = 50,
  }) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(15),
      color: ColorName.background,
      child: Assets.images.icons.homeIcon.svg(
        color: ColorName.gray,
      ),
    );
  }

  static Widget backButton(
    VoidCallback onPressed, {
    Color? color,
    Color? iconColor,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 28.w,
        width: 28.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: color ?? const Color.fromRGBO(255, 255, 255, 0.1),
        ),
        child: Center(
          child: Assets.images.icons.backIcon
              .svg(fit: BoxFit.cover, color: iconColor),
        ),
      ),
    );
  }

  static Widget buttonBuilder({
    double height = 28,
    double width = 28,
    double radius = 4,
    Color backColor = ColorName.button,
    Widget? child,
    EdgeInsets padding = EdgeInsets.zero,
    Alignment alignment = Alignment.center,
    required Function() onTap,
  }) =>
      Container(
        alignment: alignment,
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Container(
              height: height,
              width: width,
              padding: padding,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius * 2),
              ),
              child: child ?? SizedBox.shrink(),
            ),
          ),
        ),
      );

  /// set only net image url
  static Widget networkImage(
      {required String url,
      double? height,
      double? width,
      Color? color,
      Widget? errorChild,
      BoxFit fit = BoxFit.cover,
      double radius = 14.0,
      int? scale}) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: CachedNetworkImage(
          imageUrl: url,
          width: width,
          height: height,
          fit: fit,
          color: color,
          placeholder: (context, url) {
            return Center(
              widthFactor: 20,
              heightFactor: 20,
              child: CircularProgressIndicator(),
            );
          },
          errorWidget: (context, url, error) {
            return errorChild ??
                Container(color: Colors.black12, child: Container());
          }),
    );
  }

  static Widget iconButton({
    required VoidCallback onPressed,
    required SvgGenImage icon,
    Color bgColor = const Color.fromRGBO(255, 255, 255, 0.1),
    double height = 28,
    double width = 28,
    Color? iconColor,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: bgColor,
        ),
        child: Center(
          child: icon.svg(
            fit: BoxFit.cover,
            color: iconColor,
          ),
        ),
      ),
    );
  }

  static Widget imageAsset({
    required String path,
    double? height,
    double? width,
    Color? color,
    BoxFit fit = BoxFit.cover,
  }) {
    return Image.asset(
      path,
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }

  static Widget imageFile({
    required String path,
    double? height,
    double? width,
    Color? color,
    BoxFit fit = BoxFit.cover,
  }) {
    return Image.file(
      File(path),
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }

  static Widget imageSvg({
    required String path,
    double? height,
    double? width,
    BoxFit fit = BoxFit.cover,
    Color? color,
  }) {
    return SvgPicture.asset(
      path,
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }

  static void openImgDialog({
    required BuildContext context,
    required String imgPath,
    String? url,
  }) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 100),
        pageBuilder: (context, animation, secondaryAnimation) {
          animation = Tween(
            begin: 0.0,
            end: 1.0,
          ).animate(animation);
          return FadeTransition(
            opacity: animation,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                        color: (const Color(0xff032042)).withOpacity(0.2),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 300,
                    left: 50,
                    right: 50,
                    child: Hero(
                      tag: url ?? imgPath,
                      child: Container(
                        child: url != null
                            ? AppWidgets.networkImage(
                                url: url,
                                height: 300,
                                width: 300,
                              )
                            : AppWidgets.imageFile(
                                height: 300,
                                width: 300,
                                path: imgPath,
                              ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        fullscreenDialog: true,
        opaque: false,
      ),
    );
  }
}
