import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/models/user_model.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/debtors_orders_page/widget/filter_debtors_item/bloc/debtors_bloc.dart';
import 'package:agent/ui/pages/debtors_orders_page/widget/filter_debtors_item/bloc/debtors_event.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'filter_debtors_item.dart';

class FilterDebtorsWidget extends StatelessWidget {
  final ScrollController? controller;
  final bool? isAllSelected;
  final List<Region>? listModel;
  final bool openApp;
  final VoidCallback? openTap;

  const FilterDebtorsWidget({
    Key? key,
    required this.openApp,
    required this.controller,
    this.isAllSelected = false,
    required this.listModel,
    required this.openTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          width: 1.sw,
          height: openApp ? 275.w : 55.w,
          duration: const Duration(milliseconds: 600),
          child: Column(
            children: [
              InkWell(
                onTap: openTap,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  height: 40.w,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: ColorName.background,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: ColorName.gray,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          !openApp
                              ? const Icon(Icons.keyboard_arrow_down_outlined)
                              : const Icon(Icons.keyboard_arrow_up_outlined),
                          AppWidgets.textLocale(
                            localeKey: "Все",
                            color: ColorName.gray3,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ).paddingOnly(left: 15.w),
                        ],
                      ),
                    ],
                  ),
                ).paddingOnly(bottom: 15.w),
              ),
              // openApp
              //     ? const SizedBox()
              //     :
              // GestureDetector(
              //   onTap: () {
              //     // PayslipsFilterBloc.to.add(const PayslipsSelectAllApprover());
              //   },
              //   child: Column(
              //     children: [
              //       Row(
              //         children: [
              //           Container(
              //             width: 20.w,
              //             height: 20.w,
              //             decoration: BoxDecoration(
              //               color: ColorName. background,
              //               border: Border.all(
              //                 width: 1.w,
              //                 color: ColorName.gray,
              //               ),
              //               borderRadius: BorderRadius.circular(4.r),
              //             ),
              //             child: isAllSelected!
              //                 ? const Icon(
              //               Icons.check,
              //               color: ColorName.black,
              //               size: 18,
              //             )
              //                 : const SizedBox(),
              //           ),
              //           AppWidgets.textLocale(
              //             localeKey: "Select All",
              //             color: ColorName.black,
              //             fontWeight: FontWeight.w400,
              //             fontSize: 14.sp,
              //           ).paddingOnly(left: 20.w),
              //         ],
              //       ).paddingOnly(
              //         top: 20.w,
              //         bottom: 10.w,
              //       ),
              //       Container(
              //         height: 1,
              //         width: 1.sw,
              //         color: ColorName.gray,
              //       ).paddingOnly(bottom: 10.w),
              //     ],
              //   ),
              // ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 10.w,
                  ),
                  decoration: BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.circular(8.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.08),
                          blurRadius: 10,
                        ),
                      ]),
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: controller,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return FilterDebtorsItem(
                        onTap: (int id) {
                          DebtorsBloc.to
                              .add(CheckRegion(id));
                        },
                        user: listModel![index],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        openApp
            ? Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorName.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.r),
                      bottomRight: Radius.circular(8.r),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.08),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  height: 42.w,
                  width: 1.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppWidgets.textLocale(
                        localeKey: "Выйти",
                        fontWeight: FontWeight.w500,
                        color: ColorName.red,
                      ),
                      AppWidgets.textLocale(
                        localeKey: "Применить",
                        fontWeight: FontWeight.w500,
                        color: ColorName.button,
                      ),
                    ],
                  ).paddingSymmetric(
                    horizontal: 40.w,
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
