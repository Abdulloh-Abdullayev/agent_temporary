part of 'refund_cubit.dart';

class RefundState extends Equatable {
  final bool loading;
  final List<RefundCategoryModel> list;
  final bool hasError;
  final bool reload;

  const RefundState({
    this.loading = true,
    this.list = const [],
    this.hasError = false,
    this.reload = false,
  });

  RefundState copyWith({
    bool? loading,
    List<RefundCategoryModel>? list,
    bool? hasError,
  }) {
    return RefundState(
      loading: loading ?? this.loading,
      hasError: hasError ?? this.hasError,
      reload: !reload,
      list: list ?? this.list,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        list,
        hasError,
        reload,
      ];
}

