part of 'accounts_cubit.dart';

class AccountsState extends Equatable {
  final List<AccountModel> accounts;
  final AccountModel? selectedAccount;
  final bool isExpended;
  final bool reload;

  const AccountsState({
    this.accounts = const [],
    this.selectedAccount,
    this.isExpended = false,
    this.reload = false,
  });

  AccountsState copyWith({
    List<AccountModel>? accounts,
    AccountModel? selectedAccount,
    bool? isExpended,
  }) {
    return AccountsState(
      accounts: accounts ?? this.accounts,
      selectedAccount: selectedAccount ?? this.selectedAccount,
      isExpended: isExpended ?? this.isExpended,
      reload: !reload,
    );
  }

  @override
  List<Object?> get props =>
      [
        accounts,
        selectedAccount,
        isExpended,
        reload,
      ];
}
