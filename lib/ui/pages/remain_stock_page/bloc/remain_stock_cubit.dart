import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'remain_stock_state.dart';

class RemainStockCubit extends Cubit<RemainStockState>{
  RemainStockCubit() : super(RemainStockState());

  static RemainStockCubit get to => Modular.get<RemainStockCubit>();

}