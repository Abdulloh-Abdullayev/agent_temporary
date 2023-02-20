part of 'accounts_cubit.dart';

class AccountsState extends Equatable {
  final List<UserModel> users;
  final UserModel? selectedUser;
  final bool isExpended;
  final bool reload;
  final bool loading;

  const AccountsState({
    this.users = const [],
    this.selectedUser,
    this.isExpended = false,
    this.reload = false,
    this.loading = true,
  });

  AccountsState copyWith({
    List<UserModel>? accounts,
    UserModel? selectedAccount,
    bool? isExpended,
    bool? loading,
  }) {
    return AccountsState(
      users: accounts ?? this.users,
      selectedUser: selectedAccount ?? this.selectedUser,
      isExpended: isExpended ?? this.isExpended,
      reload: !reload,
      loading: loading??this.loading,
    );
  }

  @override
  List<Object?> get props => [
        users,
        selectedUser,
        isExpended,
        reload,
        loading,
      ];
}
