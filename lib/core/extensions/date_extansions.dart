import 'package:agent/core/constants/date_time_const.dart';
import 'package:easy_localization/easy_localization.dart';

extension NumExtensions on String {
  /// date format get => 21.10.2022
  String get dateFormatDDMMYY {
    if (this.isEmpty) return this;
    try {
      var date = DateTime.parse(this);
      var y = date.year;
      var m = date.month;
      var d = date.day;
      return "${d < 10 ? "0$d" : "$d"}.${m < 10 ? "0$m" : "$m"}.$y";
    } catch (e) {
      return this;
    }
  }

  /// date format get => 21 окт
  String get dateFormatDDMMM {
    if (this.isEmpty) return this;
    try {
      var date = DateTime.parse(this);
      // var y = date.year;
      var m = date.month;
      var d = date.day;
      return "${d < 10 ? "0$d" : "$d"} ${DateTimeConst.allShortMonth[m - 1].tr()}";
    } catch (e) {
      return this;
    }
  }
}
