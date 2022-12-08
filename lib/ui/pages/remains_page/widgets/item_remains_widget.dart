import 'package:agent/core/models/remains_model/remains_model.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/remains_page/cubit/remain_cubit.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/extensions/app_extensions.dart';
import 'package:uikit/uikit.dart';

class RemainsItemWidget extends StatefulWidget {
  final int index;
  final RemainsCategoryModel model;

  const RemainsItemWidget({
    required this.index,
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  State<RemainsItemWidget> createState() => _RemainsItemWidgetState();
}

class _RemainsItemWidgetState extends State<RemainsItemWidget> {
  bool isOpen = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.text(
                text: widget.model.name!,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isOpen = !isOpen;
                  });
                },
                child: AnimatedRotation(
                  turns: isOpen ? 0.5 : 1,
                  duration: const Duration(milliseconds: 300),
                  child: const Icon(Icons.keyboard_arrow_down),
                ).paddingOnly(left: 10.w),
              ),
            ],
          ),
        ),
        AnimatedContainer(
          height: isOpen ? null : 0,
          duration: const Duration(milliseconds: 300),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: widget.model.list!.length,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var model = widget.model.list![index];
              return Row(
                children: [
                  Container(
                    width: 335.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: ColorName.gray),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  child: CachedNetworkImage(
                                    imageUrl: model.imgUrl!,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        const CupertinoActivityIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppWidgets.textLocale(
                                      localeKey: model.name ?? '',
                                      fontWeight: FontWeight.w600,
                                      color: ColorName.black,
                                      fontSize: 12),
                                  SizedBox(
                                    height: 8,
                                  ),
                                Row(
                                    children: [
                                      AppWidgets.textLocale(
                                          localeKey: "Блок",
                                          fontWeight: FontWeight.w400,
                                          color: ColorName.gray2,
                                          fontSize: 12),
                                      SizedBox(
                                        width: 12,
                                      ),

                                      Container(
                                        height: 24,
                                      
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                                color: ColorName.gray)),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(1),
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      RemainCubit.to.decrement(
                                                          widget.model.id!,
                                                          model.id!);
                                                    },
                                                    child: Container(
                                                      height: 20,
                                                      width: 22,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  4),
                                                          color: ColorName.button),
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: ColorName.white,
                                                          size: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: 30,
                                                      child: Center(
                                                        child: AppWidgets.textLocale(
                                                            localeKey:
                                                                "${model.count}",
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: ColorName.black,
                                                            fontSize: 12),
                                                      )),
                                                  InkWell(
                                                    onTap: () {
                                                      RemainCubit.to.increment(
                                                          widget.index, index);
                                                    },
                                                    child: Container(
                                                      height: 20,
                                                      width: 22,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  4),
                                                          color: ColorName.button),
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.add,
                                                          color: ColorName.white,
                                                          size: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 34.w,),
                                        Container(
                                        height: 24,
                                      
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                                color: ColorName.gray)),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(1),
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      RemainCubit.to.decrement(
                                                          widget.model.id!,
                                                          model.id!);
                                                    },
                                                    child: Container(
                                                      height: 20,
                                                      width: 22,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  4),
                                                          color: ColorName.button),
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: ColorName.white,
                                                          size: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: 30,
                                                      child: Center(
                                                        child: AppWidgets.textLocale(
                                                            localeKey:
                                                                "${model.count}",
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: ColorName.black,
                                                            fontSize: 12),
                                                      )),
                                                  InkWell(
                                                    onTap: () {
                                                      RemainCubit.to.increment(
                                                          widget.index, index);
                                                    },
                                                    child: Container(
                                                      height: 20,
                                                      width: 22,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  4),
                                                          color: ColorName.button),
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.add,
                                                          color: ColorName.white,
                                                          size: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ).paddingOnly(top: 12.w),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
