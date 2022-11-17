import 'package:agent/core/models/remain_stock_model.dart';
import 'package:equatable/equatable.dart';

class RemainStockState extends Equatable {
  final bool loading;
  final bool hasError;
  final bool reload;
  final List<RemainStockModel> list;

  const RemainStockState({
    this.hasError = false,
    this.loading = false,
    this.reload = false,
    this.list = const [],
  });

  RemainStockState copyWith({
    bool? loading,
    bool? hasError,
    List<RemainStockModel>? list,
  }) {
    return RemainStockState(
        loading: loading ?? this.loading,
        hasError: hasError ?? this.hasError,
        list: list ?? this.list,
        reload: !reload,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [hasError, loading, reload, list];
}
