part of 'balance_cubit.dart';

class BalanceState extends Equatable {
  final bool loading;
  final bool hasError;
  final List<BalanceModel> balanceList;
  final double totalPrice;

  const BalanceState({
    this.loading = true,
    this.hasError = false,
    this.balanceList = const [],
    this.totalPrice = 0.0,
  });

  BalanceState copyWith({
    bool? loading,
    bool? hasError,
    List<BalanceModel>? balanceList,
    double? totalPrice,
  }) {
    return BalanceState(
      hasError: hasError ?? this.hasError,
      balanceList: balanceList ?? this.balanceList,
      loading: loading ?? this.loading,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        hasError,
        balanceList,
        totalPrice,
      ];
}
