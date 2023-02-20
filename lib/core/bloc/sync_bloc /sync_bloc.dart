import 'dart:async';
import 'package:agent/core/services/db/db_service.dart';
import 'package:agent/core/services/db/models/product/product_db.dart';
import 'package:agent/core/utils/app_logger_util.dart';
import 'package:agent/ui/widgets/sync_db_page.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:isar/isar.dart';

import '../../models/product/product.dart';

part 'sync_event.dart';

part 'sync_state.dart';

class SyncBloc extends Bloc<SyncEvent, SyncState> {
  static SyncBloc get to => Modular.get<SyncBloc>();

  SyncBloc() : super(SyncInitial()) {
    on<SyncLoaded>(_onSyncLoaded);
  }

  FutureOr<void> _onSyncLoaded(
    SyncLoaded event,
    Emitter<SyncState> emit,
  ) async {
    Modular.to.push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) => SyncDbPage(),
      ),
    );
    try {
      List<String> statusList = [];
      emit(SyncSuccess(percent: 0));
      List<Product> products = getList();
      await DBService.to.isar.writeTxn(
        () async {
          await DBService.to.isar.productDbs.clear();
          products.forEach((element) async {
            await DBService.to.isar.productDbs
                .put(ProductDb.fromProduct(element));
          });
        },
      );

      final list = await DBService.to.isar.productDbs.where().findAll();
      AppLoggerUtil.i("message length->${list.length}");
      await Future.delayed(Duration(seconds: 1));
      statusList.add("Products");
      emit(
          (state as SyncSuccess).copyWith(percent: 20, syncString: statusList));
      await Future.delayed(Duration(seconds: 1));
      statusList.add("Models");
      emit(
          (state as SyncSuccess).copyWith(percent: 40, syncString: statusList));
      await Future.delayed(Duration(seconds: 1));
      statusList.add("Visits");
      emit(
          (state as SyncSuccess).copyWith(percent: 60, syncString: statusList));
      await Future.delayed(Duration(seconds: 1));
      statusList.add("Comments");
      emit(
          (state as SyncSuccess).copyWith(percent: 80, syncString: statusList));
      await Future.delayed(Duration(seconds: 1));
      statusList.add("Init database");
      emit(
        (state as SyncSuccess).copyWith(percent: 100, syncString: statusList),
      );
    } catch (e) {
      emit(SyncFailure());
    }
  }

  List<Product> getList() {
    List<Product> list = [];
    for (int i = 0; i <= 3; i++) {
      list.add(
        Product(
          id: "08cfeb88-1bb5-479c-a224-817443bae10c$i",
          name: "Product $i",
          categoryId: "08cfeb88-1bb5-479c-a224-817443bae10c",
          quantityInPackage: i,
          unitId: "87a3588c-f530-4388-b0c4-9f7001082be2",
        ),
      );
    }
    return list;
  }
}
