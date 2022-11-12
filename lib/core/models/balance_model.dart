import 'package:agent/core/helpers/date_helper.dart';
import 'package:agent/core/helpers/string_helper.dart';

class BalanceModel {
  final DateTime? orderDate;
  final double? price;
  final String? status;
  final String? statusType;

  BalanceModel({
    this.orderDate,
    this.price,
    this.status,
    this.statusType,
  });

  String get dateToString => DateHelper.formatddMMyyyy(orderDate);

  String get priceToString => StringHelper.moneyFormat(price);
}
