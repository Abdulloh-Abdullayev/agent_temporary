import 'package:agent/core/extensions/app_extensions.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uikit/src/utils/colors.gen.dart';
import 'package:uikit/uikit.dart';

class DebtorsDropDown extends StatefulWidget {
  DebtorsDropDown({
    required this.items,
    required this.title,
    required this.onChange,
    this.color = ColorName.white,
    this.width = 300,
    this.height = 38,
    this.hasBorder = true,
    this.textSize = 14,
    Key? key,
  }) : super(key: key);

  List<String> items;
  Color color;
  double height;
  double width;
  double textSize;
  String title;
  bool hasBorder;
  Function onChange;

  @override
  State<DebtorsDropDown> createState() => _DebtorsDropDownState();
}

class _DebtorsDropDownState extends State<DebtorsDropDown> {
  String? selectedValue;

  bool iconChange = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(8),
          border: widget.hasBorder
              ? Border.all(
                  color: ColorName.gray1,
                  width: 1,
                )
              : null,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            icon: const SizedBox.shrink(),
            hint: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 5,
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 16,
                  ),
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: ColorName.black,
                    fontSize: widget.textSize,
                    fontWeight: FontWeight.w400,
                    fontFamily: Fonts.appFont,
                  ),
                ),
              ],
            ),
            items: widget.items
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Row(
                      children: [
                        selectedValue == item
                            ? AppCheckBox(onTap: () {  }, isCheck: iconChange,)
                        // Container(
                        //         height: 20.w,
                        //         width: 20.w,
                        //         decoration: BoxDecoration(
                        //           color: ColorName.background,
                        //             border: Border.all(color: ColorName.gray),
                        //             borderRadius: BorderRadius.circular(4.r)),
                        //         padding: const EdgeInsets.all(2),
                        //         child: const Icon(
                        //           Icons.keyboard_arrow_down,
                        //           size: 16,
                        //         ),
                        //       ).paddingSymmetric(horizontal: 10)
                            :
                        Container(
                          height: 20.w,
                          width: 20.w,
                                decoration: BoxDecoration(
                                    color: ColorName.background,
                                    border: Border.all(color: ColorName.gray),
                                    borderRadius: BorderRadius.circular(4.r)),
                                padding: const EdgeInsets.all(2),
                                // child: const Icon(
                                //   Icons.keyboard_arrow_down,
                                //   size: 16,
                                // ),
                              ),
                        Text(
                          item,
                          style: TextStyle(
                            color: ColorName.black,
                            fontSize: widget.textSize,
                            fontWeight: FontWeight.w400,
                            fontFamily: Fonts.appFont,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
            value: selectedValue,
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            onChanged: (value) {
              widget.onChange(value);
              setState(() {
                // selectedValue = value as String;
                iconChange = !iconChange;
              });
            },
            buttonHeight: widget.height,
            buttonWidth: widget.width,
            itemHeight: widget.height,
          ),
        ),
      ),
    );
  }
}

class Fonts {
  static final String appFont = GoogleFonts.roboto().toString();
}
