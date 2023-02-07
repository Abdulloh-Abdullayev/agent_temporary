import 'dart:async';
import 'package:agent/core/services/db/db_service.dart';
import 'package:agent/core/services/db/models/product/product_db.dart';
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
    // final entity = DBEntityRepository<Product>();
    // await DBService.createDb(event.dbName);
    Modular.to.push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) => SyncDbPage(),
      ),
    );
    try {
      List<Product> products = getList();
      await DBService.to.isar.productDbs.clear();
      await DBService.to.isar.writeTxn(
        () async {
          products.forEach((element) async {
            await DBService.to.isar.productDbs
                .put(ProductDb.fromProduct(element));
          });
        },
      );

      final list = await DBService.to.isar.productDbs.where().findAll();
      emit(
        SyncSuccess(
          syncString: list.map((e) => e.name!).toList(),
        ),
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
