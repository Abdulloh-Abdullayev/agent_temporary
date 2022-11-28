import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/extensions/app_extensions.dart';

class SelectCategoryWidget extends StatelessWidget {
  const SelectCategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.w),
      height: 620.w,
      width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        color: ColorName.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Icon(
                        Icons.keyboard_arrow_down_sharp,
                        size: 25.w,
                        color: ColorName.gray2,
                      ).paddingOnly(left: 10.w),
                    ),
                    InkWell(
                      onTap: () {
                        Modular.to.pop();
                      },
                      child: Assets.images.icons.remove.svg(
                        color: ColorName.gray2,
                        height: 30.w,
                      ),
                    ),
                  ],
                ),
                AppWidgets.textLocale(
                  localeKey: "Выберите категорию",
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                ).paddingOnly(
                  top: 10.w,
                  bottom: 24.w,
                ),
                AppWidgets.textLocale(
                  localeKey: "Тип бонуса",
                  color: ColorName.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const BonusTypeWidget().paddingOnly(
                      bottom: 13.w,
                      top: 13.w,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1,
                      width: 1.sw,
                      color: ColorName.gray,
                    );
                  },
                  itemCount: 3,
                ),
                AppWidgets.textLocale(
                  localeKey: "Категории",
                  color: ColorName.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ).paddingOnly(
                  bottom: 18.w,
                  top: 5.w,
                ),
                // ListView.builder(
                //     itemBuilder: (context, index){
                //     return Container();
                //
                //
                // })
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BonusTypeWidget extends StatefulWidget {
  const BonusTypeWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<BonusTypeWidget> createState() => _BonusTypeWidgetState();
}

    bool isShow= false;

class _BonusTypeWidgetState extends State<BonusTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppWidgets.text(
          text: "Бонус 1+5",
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        InkWell(
          onTap: (){
            setState(() {
              isShow=!isShow;
            });
          },
          child: Container(
            height: 20.w,
            width: 20.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorName.gray,
              ),
              borderRadius: BorderRadius.circular(4),
              color: ColorName.background,
            ),
            child: isShow?Icon(Icons.check, size: 20.w,):const SizedBox(),
          ),
        ),
      ],
    );
  }
}
