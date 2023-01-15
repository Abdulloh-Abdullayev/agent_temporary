import 'package:agent/core/models/user_model.dart';
import 'package:agent/ui/pages/debtors_orders_page/widget/filter_debtors_item/bloc/debtors_event.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'debtors_state.dart';

class DebtorsBloc extends Bloc<DebtorsEvent, DebtorsState> {
  List<Region> cacheList = [
    Region(
      id: 1,
      name: "Select All",
      isSelected: false,
    ),
    Region(
      id: 2,
      name: "Xasanobot",
      isSelected: false,
    ),
    Region(
      id: 3,
      name: "Dumbrabod",
      isSelected: false,
    ),
    Region(
      id: 4,
      name: "Asakaobop",
      isSelected: false,
    ),
    Region(
      id: 5,
      name: "Toshkent",
      isSelected: false,
    ),
  ];

  static DebtorsBloc get to => Modular.get<DebtorsBloc>();

  DebtorsBloc() : super(DebtorsState()) {
    on<FilterLoad>(_onFilterRegionLoad);
    on<CheckRegion>(_onCheckRegion);

    on<FilterOpenRegion>((event, emit) {
      emit(state.copyWith(openRegion: !event.openRegion));
    });
  }
  //
  Future _onFilterRegionLoad(
    FilterLoad event,
    Emitter<DebtorsState> emit,
  ) async {
    List<Region>? regionListAll = [];
    emit(state.copyWith(isLoading: true));
    List<Region>? regionList = List.from(cacheList);
    if (regionList.isNotEmpty) {
      regionListAll.addAll(regionList);
      emit(
        state.copyWith(
          regionFilterList: regionListAll,
          isLoading: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          regionFilterList: [],
        ),
      );
    }
  }

  Future _onCheckRegion(
    CheckRegion event,
    Emitter<DebtorsState> emit,
  ) async {
    List<Region> list = List.from(cacheList);
    var index = list.indexWhere((element) => element.id == event.regionId);
    list[index].isSelected = !list[index].isSelected!;
    emit(state.copyWith(regionFilterList: list));

    bool isAllBool() {
      for (int i = 0; i < state.regionFilterList.length; i++) {
        if (state.regionFilterList[i].isSelected == false) {
          return false;
        }
      }
      return true;
    }

    emit(state.copyWith(isAllSelectedRegion: isAllBool()));
  }
}
