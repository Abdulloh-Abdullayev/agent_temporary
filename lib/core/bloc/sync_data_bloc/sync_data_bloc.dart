import 'dart:async';

import 'package:agent/core/models/client_model/client_model.dart';
import 'package:agent/core/utils/app_logger_util.dart';
import 'package:agent/ui/widgets/sync_db_page.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


part 'sync_data_event.dart';
part 'sync_data_state.dart';

class SyncDataBloc extends Bloc<SyncDataEvent, SyncDataState> {
  static SyncDataBloc get to => Modular.get<SyncDataBloc>();


  SyncDataBloc() : super(SyncDataInitial()) {
    on<SyncDataLoaded>(_onSyncLoaded);
  }

  FutureOr<void> _onSyncLoaded(
      SyncDataLoaded event,
      Emitter<SyncDataState> emit,
      ) async {
    Modular.to.push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) => SyncDbPage(),
      ),
    );
    try {
      List<String> statusList = [];
      emit(SyncDataSuccess(percent: 0));
      // List<ClientModel> products = getList();
      // await DBService.to.isar.writeTxn(
      //   () async {
      //     await DBService.to.isar.clientModels.clear();
      //     for(var client in products){
      //       await DBService.to.isar.clientModels.put(client);
      //     }
      //   },
      // );

      // final list = await DBService.to.isar.productDbs.where().findAll();
      // AppLoggerUtil.i("message length->${list.length}");
      await Future.delayed(Duration(seconds: 1));
// todo get product
      statusList.add("Products");
      emit(
          (state as SyncDataSuccess).copyWith(percent: 20, syncString: statusList));
      await Future.delayed(Duration(seconds: 1));
      statusList.add("Models");
      emit(
          (state as SyncDataSuccess).copyWith(percent: 40, syncString: statusList));
      await Future.delayed(Duration(seconds: 1));
      statusList.add("Visits");
      emit(
          (state as SyncDataSuccess).copyWith(percent: 60, syncString: statusList));
      await Future.delayed(Duration(seconds: 1));
      statusList.add("Comments");
      emit(
          (state as SyncDataSuccess).copyWith(percent: 80, syncString: statusList));
      await Future.delayed(Duration(seconds: 1));
      statusList.add("Init database");
      emit(
        (state as SyncDataSuccess).copyWith(percent: 100, syncString: statusList),
      );
    } catch (e) {
      AppLoggerUtil.e('$e');
      emit(SyncDataFailure());
    }
  }

  List<ClientModel> getList() {
    List<ClientModel> list = [];
    for (int i = 0; i <= 1000; i++) {
      list.add(ClientModel.fromJson(map));
    }
    return list;
  }

  Map<String, dynamic> map = {
    "name": "null",
    "company_name": "null",
    "address": "null",
    "navigate": "null",
    "phone": "null",
    "contact": "null",
    "inn": "null",
    "jshshir": "null",
    "description": "null",
    "lat": "",
    "lon": "",
    "balance": 0,
    "bank": "null",
    "mfo": "null",
    "oked": "null",
    "visit_days": ["monday", "tuesday", "wednesday"],
    "territory": {
      "name": "null",
      "lat": null,
      "lon": null,
      "is_active": false,
      "region": {
        "name": "null",
        "description": "null",
        "id": "00000000-0000-0000-0000-000000000000"
      },
      "id": "00000000-0000-0000-0000-000000000000"
    },
    "sales_channel": {
      "name": "null",
      "id": "00000000-0000-0000-0000-000000000000"
    },
    "category": {
      "name": "null",
      "description": "null",
      "code": "null",
      "is_active": false,
      "id": "00000000-0000-0000-0000-000000000000"
    },
    "client_type": {
      "name": "null",
      "color": "null",
      "xml": "null",
      "id": "00000000-0000-0000-0000-000000000000"
    },
    "orders": null,
    "sum": 0,
    "id": "00000000-0000-0000-0000-000000000000"
  };
}
