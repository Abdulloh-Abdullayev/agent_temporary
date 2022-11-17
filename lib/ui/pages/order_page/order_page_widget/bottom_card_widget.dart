import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/cupertino.dart';

Widget bottomCardWidget({
  required String name,
  required String time,
  required Widget icon,
  required String nalichniy,
  required String bezbonus,
  required String dostavlen,
  required String obem,
  required String obemNumber,
  required String soni,
  required String soniNumber,
  required String summa,
  required String summaNumber,
  required String otgruzki,
  required String otgruzkiNumber,
  required String kostignatsi,
  required String kostignatsiNumber,
  required String komentariya,
  required String fayl,

}){
  return Container(
    width: 335,
    height: 183,
    decoration: BoxDecoration(
      color: ColorName.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: ColorName.gray),
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 12,bottom: 9,left: 12,right: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.textLocale(
                  localeKey: name,
                  fontWeight: FontWeight.w600,
                  color: ColorName.black,
                  fontSize: 14
              ),
              Row(
                children: [
                  AppWidgets.textLocale(
                      localeKey: time,
                      fontWeight: FontWeight.w400,
                      color: ColorName.black,
                      fontSize: 14
                  ),
                  SizedBox(width: 12,),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: ColorName.gray.withOpacity(0.6)
                    ),
                    child: Center(
                      child: icon,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              AppWidgets.textLocale(
                  localeKey: nalichniy,
                  fontWeight: FontWeight.w400,
                  color: ColorName.gray3,
                  fontSize: 14
              ),
              SizedBox(width: 17,),
              AppWidgets.textLocale(
                  localeKey: bezbonus,
                  fontWeight: FontWeight.w400,
                  color: ColorName.gray3,
                  fontSize: 14
              ),
              SizedBox(width: 17,),
              AppWidgets.textLocale(
                  localeKey: dostavlen,
                  fontWeight: FontWeight.w400,
                  color: ColorName.green,
                  fontSize: 14
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              AppWidgets.textLocale(
                  localeKey: "${otgruzki}: ",
                  fontWeight: FontWeight.w400,
                  color: ColorName.gray3,
                  fontSize: 14
              ),
              AppWidgets.textLocale(
                  localeKey: otgruzkiNumber,
                  fontWeight: FontWeight.w600,
                  color: ColorName.gray3,
                  fontSize: 14
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              AppWidgets.textLocale(
                  localeKey: "${kostignatsi}: ",
                  fontWeight: FontWeight.w400,
                  color: ColorName.gray3,
                  fontSize: 14
              ),
              AppWidgets.textLocale(
                  localeKey: kostignatsiNumber,
                  fontWeight: FontWeight.w600,
                  color: ColorName.gray3,
                  fontSize: 14
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              AppWidgets.textLocale(
                  localeKey: komentariya,
                  fontWeight: FontWeight.w400,
                  color: ColorName.gray3,
                  fontSize: 14
              ),
              SizedBox(width: 15,),
              AppWidgets.textLocale(
                  localeKey: fayl,
                  fontWeight: FontWeight.w600,
                  color: ColorName.gray3,
                  fontSize: 14
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              SizedBox(
                width: 65,
                child: Row(
                  children: [
                    AppWidgets.textLocale(
                        localeKey: "${obem}: ",
                        fontWeight: FontWeight.w400,
                        color: ColorName.gray2,
                        fontSize: 14
                    ),
                    AppWidgets.textLocale(
                        localeKey: obemNumber,
                        fontWeight: FontWeight.w400,
                        color: ColorName.black,
                        fontSize: 14
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 65,
                child: Row(
                  children: [
                    AppWidgets.textLocale(
                        localeKey: "${soni}: ",
                        fontWeight: FontWeight.w400,
                        color: ColorName.gray2,
                        fontSize: 14
                    ),
                    AppWidgets.textLocale(
                        localeKey: soniNumber,
                        fontWeight: FontWeight.w400,
                        color: ColorName.black,
                        fontSize: 14
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 170,
                child: Row(
                  children: [
                    AppWidgets.textLocale(
                        localeKey: "${summa}: ",
                        fontWeight: FontWeight.w400,
                        color: ColorName.gray2,
                        fontSize: 14
                    ),
                    AppWidgets.textLocale(
                        localeKey: summaNumber,
                        fontWeight: FontWeight.w400,
                        color: ColorName.button,
                        fontSize: 14
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
