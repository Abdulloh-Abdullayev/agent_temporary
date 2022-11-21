import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uikit/extensions/app_extensions.dart';

class AppTextField extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final String title;
  final bool isFill;
  final TextInputFormatter? inputFormatter;
  final TextInputType? textInputType;
  final bool isPassword;
  final bool enabled;
  final String initialText;
  final bool hasError;
  final bool isMultiLine;
  final double? height;
  final bool hasTitle;
  final bool autoFocus;
  final Key? key;
  final bool phoneNumberCode;
  final int? maxLength;

  AppTextField({
    required this.hintText,
    required this.onChanged,
    required this.title,
    this.key,
    this.isMultiLine = false,
    this.inputFormatter,
    this.textInputType,
    this.isPassword = false,
    this.enabled = true,
    this.isFill = false,
    this.initialText = '',
    this.hasError = false,
    this.height,
    this.hasTitle = true,
    this.autoFocus = false,
    this.phoneNumberCode = false,
    this.maxLength,
  });

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late TextEditingController _textEditingController;
  late bool obscureText;

  @override
  void initState() {
    _textEditingController = TextEditingController(
      text: widget.initialText,
    );
    obscureText = widget.isPassword;
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // FocusManager.instance.primaryFocus?.unfocus();
    InputBorder _border = widget.hasError
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 1, color: ColorName.red),
          )
        : OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(width: 1, color: ColorName.gray),
          );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height:  widget.height,
          decoration: BoxDecoration(
            color: ColorName.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            maxLength: widget.maxLength,
            autofocus: widget.autoFocus ? true : false,
            expands: widget.isMultiLine ? true : false,
            textAlignVertical: TextAlignVertical.top,
            maxLines: widget.isMultiLine ? null : 1,
            controller: _textEditingController,
            enabled: widget.enabled,
            style: GoogleFonts.inter(
              fontSize: 14.sp,
            ),
            decoration: InputDecoration(
              disabledBorder: _border,
              focusedBorder: _border,
              enabledBorder: _border,
              hintText: widget.hintText,
              contentPadding: EdgeInsets.only(top:20.w),
              hintStyle: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: ColorName.gray3,
              ),
              prefixIcon: Container(
                padding: EdgeInsets.only(left: 10),
                width: 40.w,
                child: Center(
                  child: Assets.images.icons.calendarIcon.svg(
                    color: ColorName.gray2,
                    height: 16.w,
                  ),
                ),
              ).paddingOnly(top: 2),
            ),
            obscureText: obscureText,
            keyboardType: widget.textInputType,
            onChanged: (v) => widget.onChanged(v),
            inputFormatters: widget.inputFormatter == null
                ? null
                : [
                    widget.inputFormatter!,
                  ],
          ),
        ),
      ],
    );
  }
}
