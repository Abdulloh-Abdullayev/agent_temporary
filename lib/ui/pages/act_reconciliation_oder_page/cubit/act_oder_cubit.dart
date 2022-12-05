import 'package:agent/core/extensions/date_extansions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'act_oder_state.dart';

class ActOderCubit extends Cubit<ActOderState> {
  ActOderCubit()
      : super(ActOderState(
          baseTableChildren: childlist
              .getRange(
                0,
                childlist.length - 3,
              )
              .toList(),
          tempTableChildren: childlist
              .getRange(
                0,
                childlist.length - 3,
              )
              .toList(),
          allSum: childlist
              .getRange(childlist.length - 3, childlist.length)
              .toList(),
          tableColumns: tabsList,
          actSortStatus: {},
          firstDate: DateTime.now(),
          secondDate: DateTime.now()..add(Duration(days: 1)),
        )) {
    initialize();
  }

  static ActOderCubit get to => Modular.get<ActOderCubit>();

  /// initialize state data
  initialize() {
    var sort = <String, String>{};
    tabsList.forEach((element) {
      sort.addAll({element: dataSortStatus.first});
    });
    emit(state.copyWith(
      tempTableChildren: listDateFormatList(state.baseTableChildren),
      actSortStatus: sort,
    ));
  }

  changeDate(String key, DateTime dateTime) {
    if (key == '1') {
      emit(state.copyWith(firstDate: dateTime));
    } else {
      emit(state.copyWith(secondDate: dateTime));
    }
  }

  /// list  items sorter of list date
  List<List<String>> listDateFormatList(List<List<String>> l) {
    var data = <List<String>>[];
    var findIndex = 1;
    for (int i = 0; i < l.first.length; i++) {
      try {
        var d = DateTime.parse(l.first[i]);
        findIndex = i;
        break;
      } catch (e) {
        print(e);
      }
    }
    for (var i = 0; i < l.length; i++) {
      data.add([]);
      for (var j = 0; j < l[i].length; j++) {
        if (findIndex == j) {
          data[i].add(l[i][j].dateFormatDDMMM);
        } else {
          data[i].add(l[i][j]);
        }
      }
    }

    return data;
  }

  /// typ sort function
  List<List<String>> sortList(int _a, int _b, {bool isReversed = false}) {
    var data = List<List<String>>.generate(
        state.baseTableChildren.length - 3, (i) => state.baseTableChildren[i]);
    try {
      data.sort((a, b) {
        var a_day = DateTime.parse(a[_a]);
        var b_day = DateTime.parse(b[_b]);
        return a_day.compareTo(b_day);
      });
    } catch (e) {
      data.sort((a, b) {
        return a[_a].compareTo(b[_b]);
      });
    }

    data = listDateFormatList(data);
    if (isReversed) {
      data = data.reversed.toList();
    }

    return data;
  }

  baseSort(String tab) {
    var status = state.actSortStatus[tab];
    var actStatus = state.actSortStatus;
    var index = tabsList.indexOf(tab);
    if (status == dataSortStatus[0]) {
      var dataList = sortList(index, index, isReversed: true);
      emit(state.copyWith(tempTableChildren: dataList));
      actStatus[tab] = dataSortStatus[1];
    } else if (status == dataSortStatus[1]) {
      var dataList = sortList(index, index);
      emit(state.copyWith(tempTableChildren: dataList));
      actStatus[tab] = dataSortStatus[2];
    } else {
      var dataList = listDateFormatList(state.baseTableChildren);
      emit(state.copyWith(tempTableChildren: dataList));
      actStatus[tab] = dataSortStatus[0];
    }

    print(actStatus);
  }

  static List<String> tabsList = [
    'Склад',
    'Дата',
    'Долг',
    'Оплачено',
    'Осталось',
  ];
  static var dataSortStatus = <String>["default", "high", "low"];

  static List<List<String>> childlist = [
    ['a на за', '2022-08-08T12:56:24.668Z', "500", 'dалата ', '+300000000'],
    ['b на за', '2022-10-02T12:56:24.668Z', "500", 'bта ', '100000000'],
    ['t на за', '2022-11-09T12:56:24.668Z', "500", 'cплата ', '200000000'],
    [
      's на за',
      '2022-12-01T12:56:24.668Z',
      "500",
      'aлата на заказ',
      '-100000000'
    ],
    ['d на за', '2022-10-04T12:56:24.668Z', "500", 'iта на заказ', '400000000'],
    [
      'f на за',
      '2022-08-06T12:56:24.668Z',
      "500",
      'jплата на заказ',
      '400000000'
    ],
    [
      'm на за',
      '2022-08-08T12:56:24.668Z',
      "500",
      'eлата на заказ',
      '200000000'
    ],
    ['n на за', '2022-11-03T12:56:24.668Z', "500", 'jw на заказ', '900000000'],
    [
      'j на за',
      '2022-05-08T12:56:24.668Z',
      "500",
      'myhyлата на заказ',
      '500000000'
    ],
    ['e на за', '2022-06-07T12:56:24.668Z', "500", 'fаказ', '200000000'],
    [
      'k на за',
      '2022-09-05T12:56:24.668Z',
      "500",
      'mплата на заказ',
      '500000000'
    ],
    [
      'l на за',
      '2022-09-02T12:56:24.668Z',
      "500",
      'kvfлата на заказ',
      '220000000'
    ],
    [
      'i на за',
      '2022-07-09T12:56:24.668Z',
      "500",
      'lgbлата на заказ',
      '900000000'
    ],
    ['Оплата на заказ', '', "", '', '+100 000 000 UZS'],
    ['Оплата на за', '', "", '', '100 000 000 UZS'],
    ['Итоговый долг', '', "", '', '-500 00000'],
  ];
}
