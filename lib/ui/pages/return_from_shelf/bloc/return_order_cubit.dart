import 'package:agent/core/models/return_order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'return_order_state.dart';

class ReturnOrderCubit extends Cubit<ReturnOrderState> {
  ReturnOrderCubit() : super(const ReturnOrderState());

  static ReturnOrderCubit get to => Modular.get<ReturnOrderCubit>();

  static String imgUrl =
      "https://www.sciencealert.com/images/2022/08/RidiculouslyDetailedMoonPictureInFull-642x642.jpeg";

  List<ReturnOrderModel> list2 = [
    ReturnOrderModel(
      id: 0,
      name: "Coca cola",
      img: imgUrl,
      count: 1,
      blog: 0,
      summa: 100000,
    ),
    ReturnOrderModel(
      id: 1,
      name: "Coca cola",
      img: imgUrl,
      count: 1,
      blog: 0,
      summa: 100000,
    ),
  ];

  Future load() async {
    List<ReturnOrderCategoryModel> list = [
      ReturnOrderCategoryModel(
        id: 0,
        name: "Напитки",
        list: genList(),
      ),
      ReturnOrderCategoryModel(
        id: 1,
        name: "Печенье",
        list: genList(),
      ),
    ];
    emit(state.copyWith(list: list, loading: false));
  }

  List<ReturnOrderModel> genList() {
    List<ReturnOrderModel> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(
        ReturnOrderModel(
          name: 'Coca cola',
          img: imgUrl,
          blog: 0,
          summa: 10000,
          count: 1,
          id: i,
        ),
      );
    }
    return list;
  }

  int summa(ReturnOrderModel model) {
    int sum = (model.blog ?? 0) * 8;
    sum += (model.count ?? 0) ~/ 8;
    sum += (model.count ?? 0) % 8;
    return sum;
  }


  Future increment(int categoryId, int id) async {
    state.list[categoryId].list![id].blog =
        state.list[categoryId].list![id].blog! + 1;
    emit(state.copyWith(list: state.list));
  }

  Future decrement(int categoryId, int id) async {
    var category = state.list.firstWhere((element) => element.id == categoryId);
    var refundModel = category.list!.firstWhere((element) => element.id == id);
    if (refundModel.blog! > 0) {
      refundModel.blog = refundModel.blog! - 1;
      emit(state.copyWith(list: state.list));
    }
  }

  Future incrementSht(int categoryId, int id) async {
    state.list[categoryId].list![id].count =
        state.list[categoryId].list![id].count! + 1;
    emit(state.copyWith(list: state.list));
  }

  Future decrementSht(int categoryId, int id) async {
    var category = state.list.firstWhere((element) => element.id == categoryId);
    var refundModel = category.list!.firstWhere((element) => element.id == id);
    if (refundModel.count! > 0) {
      refundModel.count = refundModel.count! - 1;
      emit(state.copyWith(list: state.list));
    }
  }
}
