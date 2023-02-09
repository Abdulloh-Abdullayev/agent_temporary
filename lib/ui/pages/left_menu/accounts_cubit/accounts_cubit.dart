import 'package:agent/core/models/account_model.dart';
import 'package:agent/core/utils/app_logger_util.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'accounts_state.dart';

class AccountsCubit extends Cubit<AccountsState> {
  AccountsCubit() : super(const AccountsState());

  static AccountsCubit get to => Modular.get<AccountsCubit>();

  Future load() async {
    emit(
      state.copyWith(
        accounts: accounts,
        selectedAccount: accounts.first,
      ),
    );
  }

  Future reload() async {
    AppLoggerUtil.w("reload");
    emit(state.copyWith());
  }

  Future changeAccount(AccountModel account) async {
    emit(state.copyWith(selectedAccount: account));
  }

  Future onExpand() async {
    emit(state.copyWith(isExpended: !state.isExpended));
  }

  List<AccountModel> accounts = [
    AccountModel(
      name: "Abdumalik 001",
      serverName: "Distr1",
      imgUrl:
          "https://www.tvinsider.com/wp-content/uploads/2020/12/The_Witcher.jpg",
    ),
    AccountModel(
      name: "Abdumalik 002",
      serverName: "Distr2",
      imgUrl:
          "https://www.tvinsider.com/wp-content/uploads/2020/12/The_Witcher.jpg",
    ),
    AccountModel(
      name: "Abdumalik 003",
      serverName: "Distr3",
      imgUrl:
          "https://www.tvinsider.com/wp-content/uploads/2020/12/The_Witcher.jpg",
    ),
  ];
}
