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
    '??????????',
    '????????',
    '????????',
    '????????????????',
    '????????????????',
  ];
  static var dataSortStatus = <String>["default", "high", "low"];

  static List<List<String>> childlist = [
    ['a ???? ????', '2022-08-08T12:56:24.668Z', "500", 'd?????????? ', '+300000000'],
    ['b ???? ????', '2022-10-02T12:56:24.668Z', "500", 'b???? ', '100000000'],
    ['t ???? ????', '2022-11-09T12:56:24.668Z', "500", 'c?????????? ', '200000000'],
    [
      's ???? ????',
      '2022-12-01T12:56:24.668Z',
      "500",
      'a???????? ???? ??????????',
      '-100000000'
    ],
    ['d ???? ????', '2022-10-04T12:56:24.668Z', "500", 'i???? ???? ??????????', '400000000'],
    [
      'f ???? ????',
      '2022-08-06T12:56:24.668Z',
      "500",
      'j?????????? ???? ??????????',
      '400000000'
    ],
    [
      'm ???? ????',
      '2022-08-08T12:56:24.668Z',
      "500",
      'e???????? ???? ??????????',
      '200000000'
    ],
    ['n ???? ????', '2022-11-03T12:56:24.668Z', "500", 'jw ???? ??????????', '900000000'],
    [
      'j ???? ????',
      '2022-05-08T12:56:24.668Z',
      "500",
      'myhy???????? ???? ??????????',
      '500000000'
    ],
    ['e ???? ????', '2022-06-07T12:56:24.668Z', "500", 'f????????', '200000000'],
    [
      'k ???? ????',
      '2022-09-05T12:56:24.668Z',
      "500",
      'm?????????? ???? ??????????',
      '500000000'
    ],
    [
      'l ???? ????',
      '2022-09-02T12:56:24.668Z',
      "500",
      'kvf???????? ???? ??????????',
      '220000000'
    ],
    [
      'i ???? ????',
      '2022-07-09T12:56:24.668Z',
      "500",
      'lgb???????? ???? ??????????',
      '900000000'
    ],
    ['???????????? ???? ??????????', '', "", '', '+100 000 000 UZS'],
    ['???????????? ???? ????', '', "", '', '100 000 000 UZS'],
    ['???????????????? ????????', '', "", '', '-500 00000'],
  ];
}
