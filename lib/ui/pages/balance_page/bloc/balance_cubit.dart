import 'dart:math';

import 'package:agent/core/models/balance_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'balance_state.dart';

class BalanceCubit extends Cubit<BalanceState> {
  BalanceCubit() : super(const BalanceState());

  static BalanceCubit get to => Modular.get<BalanceCubit>();

  Future load() async {
    emit(state.copyWith(loading: true));
    await Future.delayed(const Duration(seconds: 3));
    var list = balanceList();
    double totalPrice = list.fold(0, (p, e) => p + e.price!);
    emit(
      state.copyWith(
        balanceList: list,
        loading: false,
        totalPrice: totalPrice,
      ),
    );
  }

  List<BalanceModel> balanceList() {
    List<BalanceModel> list = [];
    for (int i = 0; i < 20; i++) {
      list.add(
        BalanceModel(
          orderDate: DateTime.now(),
          status: 'Начисления',
          price: Random.secure().nextInt(10) * 10000,
          statusType: 'Оплачено',
        ),
      );
    }
    return list;
  }
}
