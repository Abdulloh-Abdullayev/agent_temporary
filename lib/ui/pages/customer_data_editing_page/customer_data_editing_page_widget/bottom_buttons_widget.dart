import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/customer_data_editing_page/customer_data_editing_page_widget/editing_bottom_sheet_widget.dart';
import 'package:agent/ui/pages/customer_data_editing_page/customer_data_editing_page_widget/row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class BottomButtonsWidget extends StatelessWidget {
  const BottomButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.w,
      decoration: BoxDecoration(
        color: ColorName.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          CustomerEditingRowWidget(
            "Общая объем",
            "1365 о",
          ).paddingOnly(bottom: 12.w),
          CustomerEditingRowWidget(
            "Общее кол-во",
            "Общее кол-во",
          ).paddingOnly(bottom: 12.w),
          CustomerEditingRowWidget(
            "Общая сумма",
            "1150 000 000 UZS",
            ColorName.button,
          ).paddingOnly(bottom: 16.w),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                    height: 45.w,
                    // padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: AppButton(
                      text: "Черновик",
                      textSize: 14,
                      textColor: ColorName.mainColor,
                      color: ColorName.gray,
                      splashColor: ColorName.black.withOpacity(0.2),
                      onPressed: () {},
                    )),
              ),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                child: SizedBox(
                    height: 45.w,
                    //padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: AppButton(
                      text: "Сохранить",
                      textSize: 14,
                      textColor: ColorName.white,
                      color: ColorName.button,
                      onPressed: () {
                        showModalBottomSheet(
                          enableDrag: true,
                          isDismissible: false,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                            top: Radius.circular(12),
                          )),
                          context: context,
                          builder: (context) {
                            return const EditingBottomSheet();
                          },
                        );
                      },
                    )),
              ),
            ],
          )
        ],
      ).paddingOnly(left: 20.w, right: 20.w, top: 13.w),
    );
  }
}
