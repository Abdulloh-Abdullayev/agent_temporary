import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class BookingItems extends StatelessWidget {
  BookingItems({super.key});

  final List<String> firstTextItems = [
    'Скидка',
    'Тип направления',
    'Тип цены',
    'Склад',
    'Бонус',
    'Заказ добавлен',
    'Дата отгрузки',
    'Срок консигнации',
  ];
  final List<String> secondTextItems = [
    'Без скидки',
    'Торговое направления',
    'Перечисления',
    'Основной склад',
    '10%',
    '16 окт, 1:43',
    '12.10.2022',
    '12.10.2022',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: firstTextItems.length,
      itemBuilder: (BuildContext contex, int index) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 21,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppWidgets.text(
                    text: firstTextItems[index],
                    color: ColorName.gray2,
                  ),
                  AppWidgets.text(
                    text: secondTextItems[index],
                    color: ColorName.black,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                height: 1.h,
                width: 1.sw,
                color: ColorName.gray,
              ),
              // PopupMenuTools(
              //   onTap: ,
              // ),
            ],
          ),
        );
      },
    );
  }
}
