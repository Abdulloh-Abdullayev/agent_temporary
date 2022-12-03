import '../localization/locale_keys.g.dart';

class DateTimeConst {
  static List<String> get allMonth => [
        LocaleKeys.january,
        LocaleKeys.february,
        LocaleKeys.march,
        LocaleKeys.april,
        LocaleKeys.may,
        LocaleKeys.june,
        LocaleKeys.july,
        LocaleKeys.august,
        LocaleKeys.september,
        LocaleKeys.october,
        LocaleKeys.november,
        LocaleKeys.december,
      ];

  static List<String> get allShortMonth => [
        LocaleKeys.jan_,
        LocaleKeys.feb_,
        LocaleKeys.mar_,
        LocaleKeys.apr_,
        LocaleKeys.may_,
        LocaleKeys.jun_,
        LocaleKeys.jul_,
        LocaleKeys.aug_,
        LocaleKeys.sep_,
        LocaleKeys.oct_,
        LocaleKeys.nov_,
        LocaleKeys.dec_,
      ];

  static List<String> get allWeeksShort => [
        LocaleKeys.w_mon,
        LocaleKeys.w_tue,
        LocaleKeys.w_wed,
        LocaleKeys.w_thu,
        LocaleKeys.w_fri,
        LocaleKeys.w_sat,
        LocaleKeys.w_sun,
      ];
}
