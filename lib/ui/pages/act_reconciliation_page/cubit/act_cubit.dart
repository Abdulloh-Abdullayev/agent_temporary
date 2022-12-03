import 'package:agent/core/extensions/date_extansions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'act_state.dart';

class ActCubit extends Cubit<ActState> {
  ActCubit()
      : super(ActState(
            baseTableChildren: myList.getRange(0, myList.length - 3).toList(),
            tempTableChildren: myList.getRange(0, myList.length - 3).toList(),
            actSortStatus: {},
            tableColumns: dataColumn,
            allSum:
                myList.getRange(myList.length - 3, myList.length).toList())) {
    initialize();
  }

  /// initialize state data
  initialize() {
    var sort = <String, String>{
      dataColumn[0]: dataSortStatus.first,
      dataColumn[1]: dataSortStatus.first,
      dataColumn[2]: dataSortStatus.first,
    };
    emit(state.copyWith(
      tempTableChildren: listDateFormatList(state.baseTableChildren),
      actSortStatus: sort,
    ));
  }

  /// list  items sorter of list date
  List<List<String>> listDateFormatList(List<List<String>> l) {
    var data = <List<String>>[];
    l.forEach((e) {
      data.add([e[0].dateFormatDDMMYY, e[1], e[2]]);
    });
    return data;
  }

  /// typ sort function
  List<List<String>> sortList(int _a, int _b, {bool isReversed = false}) {
    var temp = <List<String>>[];
    temp.addAll(
      state.tempTableChildren.getRange(
        state.tempTableChildren.length - 3,
        state.tempTableChildren.length,
      ),
    );
    var data = List<List<String>>.generate(
        state.tempTableChildren.length - 3, (i) => state.baseTableChildren[i]);

    data.sort((a, b) {
      return a[_a].compareTo(b[_b]);
    });
    data = listDateFormatList(data);
    if (isReversed) {
      data = data.reversed.toList();
    }
    data.addAll(temp);

    return data;
  }

  baseSort(String tab) {
    var status = state.actSortStatus[tab];
    var actStatus = state.actSortStatus;
    var index = dataColumn.indexOf(tab);
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

  /// sort status changer
  sortStutsChanger(String key) {
    var sortStatus = state.actSortStatus;
  }

  static ActCubit get to => Modular.get<ActCubit>();

  static var dataColumn = <String>["Дата", "Тип", "Сумма"];
  static var dataSortStatus = <String>["default", "high", "low"];
  static List<List<String>> myList = [
    ['2022-08-08T12:56:24.668Z', 'dалата ', '+300000000'],
    ['2022-10-02T12:56:24.668Z', 'bта ', '100000000'],
    ['2022-11-09T12:56:24.668Z', 'cплата ', '200000000'],
    ['2022-12-01T12:56:24.668Z', 'aлата на заказ', '-100000000'],
    ['2022-10-04T12:56:24.668Z', 'iта на заказ', '400000000'],
    ['2022-08-06T12:56:24.668Z', 'jплата на заказ', '400000000'],
    ['2022-08-08T12:56:24.668Z', 'eлата на заказ', '200000000'],
    ['2022-11-03T12:56:24.668Z', 'jw на заказ', '900000000'],
    ['2022-05-08T12:56:24.668Z', 'myhyлата на заказ', '500000000'],
    ['2022-06-07T12:56:24.668Z', 'fаказ', '200000000'],
    ['2022-09-05T12:56:24.668Z', 'mплата на заказ', '500000000'],
    ['2022-09-02T12:56:24.668Z', 'kvfлата на заказ', '220000000'],
    ['2022-07-09T12:56:24.668Z', 'lgbлата на заказ', '900000000'],
    ['Заказ на сумму', "", '100000000'],
    ['Оплата на заказ', "", '100000000'],
    ['Итоговый долг', "", '-0']
  ];
}
