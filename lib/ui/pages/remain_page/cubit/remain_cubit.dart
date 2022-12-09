import 'dart:math';

import 'package:agent/core/models/remains_model/remains_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'remain_state.dart';

class RemainCubit extends Cubit<RemainState> {
  RemainCubit() : super(const RemainState(counterValueBlokCola: 0));

  static RemainCubit get to => Modular.get<RemainCubit>();
  static String imgUrl =
      'https://web.lebazar.uz/resources/product/2020/3/14/small_1586880212484CocaCola.jpg';
  List<RemainsModel> list2 = [
    RemainsModel(
      id: 0,
      name: "Coca cola",
      count: 1,
      imgUrl: imgUrl,
    ),
    RemainsModel(
      id: 1,
      name: "Coca cola",
      count: 1,
      imgUrl: imgUrl,
    ),
  ];

  Future load() async {
    List<RemainsCategoryModel> list = [
      RemainsCategoryModel(
        id: 0,
        name: "Напитки",
        list: genList(),
      ),
      RemainsCategoryModel(
        id: 1,
        name: "Печенье",
        list: genList(),
      ),
    ];
    emit(state.copyWith(list: list, loading: false));
  }

  List<RemainsModel> genList() {
    List<RemainsModel> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(
        RemainsModel(
          name: 'Coca cola',
          imgUrl: imgUrl,
          count: Random.secure().nextInt(10),
          id: i,
        ),
      );
    }
    return list;
  }

  // Future increment(int categoryId, int id) async {
  //   state.list[categoryId].list![id].count =
  //       state.list[categoryId].list![id].count! + 1;
  //   emit(state.copyWith(list: state.list));
  // }

  // Future decrement(int categoryId, int id) async {
  //   var category = state.list.firstWhere((element) => element.id == categoryId);
  //   var remainsModel = category.list!.firstWhere((element) => element.id == id);
  //   if (remainsModel.count! > 1) {
  //     remainsModel.count = remainsModel.count! - 1;
  //     emit(state.copyWith(list: state.list));
  //   }
  // }

  void incrementColaBloc() => emit(
        RemainState(counterValueBlokCola: state.counterValueBlokCola + 1),
      );
  void decrementColaBloc() => emit(
        RemainState(counterValueBlokCola: state.counterValueBlokCola + 1),
      );
}
