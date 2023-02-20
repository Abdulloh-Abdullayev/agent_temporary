import 'package:agent/core/models/user/user_model.dart';
import 'package:agent/core/services/account_service/account_service.dart';
import 'package:agent/core/services/db/db_service.dart';
import 'package:agent/core/services/db/models/product/product_db.dart';
import 'package:agent/core/services/hive_service.dart';
import 'package:agent/core/utils/app_logger_util.dart';
import 'package:agent/ui/widgets/user_switch_page.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:isar/isar.dart';

part 'accounts_state.dart';

class AccountsCubit extends Cubit<AccountsState> {
  AccountsCubit() : super(const AccountsState());

  static AccountsCubit get to => Modular.get<AccountsCubit>();
  final accountService = AccountService.to;

  Future load() async {
    final currentUserId = HiveService.to.getCurrentUserId();
    List<UserModel> userList = await AccountService.to.getUsers();
    var selected =
        userList.firstWhere((element) => element.id == currentUserId);
    emit(
      state.copyWith(
        accounts: userList,
        selectedAccount: selected,
        loading: false,
      ),
    );
  }

  Future reload() async {
    emit(state.copyWith());
  }

  Future onExpand() async {
    emit(state.copyWith(isExpended: !state.isExpended));
  }

  Future changeUser(UserModel userModel) async {
    Modular.to.push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) =>
            UserSwitchPage(),
      ),
    );
    await Future.delayed(Duration(seconds: 3));
    HiveService.to.setCurrentUserId(userModel.id);
    await DBService.to.changeDb();
    var list = await DBService.to.isar.productDbs.where().findAll();
    AppLoggerUtil.i("db ${list.length}---${DBService.to.isar.name}");
    // todo  and reload other blocs ande services

    Modular.to.pop();
    emit(
      state.copyWith(
        selectedAccount: userModel,
      ),
    );
  }
}
