
import 'dart:math';

import 'package:agent/core/models/refund_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'refund_state.dart';

class RefundCubit extends Cubit<RefundState> {
  RefundCubit() : super(const RefundState());

  static RefundCubit get to => Modular.get<RefundCubit>();
  static String imgUrl =
      'https://web.lebazar.uz/resources/product/2020/3/14/small_1586880212484CocaCola.jpg';
  List<RefundModel> list2 = [
    RefundModel(
      id: 0,
      name: "Coca cola",
      count: 1,
      imgUrl: imgUrl,
    ),
    RefundModel(
      id: 1,
      name: "Coca cola",
      count: 1,
      imgUrl: imgUrl,
    ),
  ];

  Future load() async {
    List<RefundCategoryModel> list = [
      RefundCategoryModel(
        id: 0,
        name: "Напитки",
        list: genList(),
      ),
      RefundCategoryModel(
        id: 1,
        name: "Печенье",
        list: genList(),
      ),
    ];
    emit(state.copyWith(list: list, loading: false));
  }

  List<RefundModel> genList() {
    List<RefundModel> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(
        RefundModel(
          name: 'Coca cola',
          imgUrl: imgUrl,
          count: Random.secure().nextInt(10),
          id: i,
        ),
      );
    }
    return list;
  }

  Future increment(int categoryId, int id) async {
    state.list[categoryId].list![id].count =
        state.list[categoryId].list![id].count! + 1;
    emit(state.copyWith(list: state.list));
  }

  Future decrement(int categoryId, int id) async {
    var category = state.list.firstWhere((element) => element.id == categoryId);
    var refundModel = category.list!.firstWhere((element) => element.id == id);
    if (refundModel.count! > 1) {
      refundModel.count = refundModel.count! - 1;
      emit(state.copyWith(list: state.list));
    }
  }
}
