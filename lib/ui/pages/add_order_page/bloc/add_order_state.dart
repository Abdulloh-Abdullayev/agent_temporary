import 'package:agent/core/models/return_order_model.dart';
import 'package:equatable/equatable.dart';

class AddOrderState extends Equatable {
  final bool loading;
  final List<ReturnOrderCategoryModel> list;
  final bool hasError;
  final bool reload;

  const AddOrderState({
    this.loading = true,
    this.list = const [],
    this.hasError = false,
    this.reload = false,
  });

  AddOrderState copyWith({
    bool? loading,
    List<ReturnOrderCategoryModel>? list,
    bool? hasError,
  }) {
    return AddOrderState(
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