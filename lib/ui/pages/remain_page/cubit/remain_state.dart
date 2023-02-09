import 'package:agent/core/models/remains_model/remains_model.dart';
import 'package:equatable/equatable.dart';

class RemainState extends Equatable {
  final bool loading;
  final List<RemainsCategoryModel> list;
  final bool hasError;
  final bool reload;

  const RemainState({
    this.loading = true,
    this.list = const [],
    this.hasError = false,
    this.reload = false,
  });

  RemainState copyWith({
    bool? loading,
    List<RemainsCategoryModel>? list,
    bool? hasError,
  }) {
    return RemainState(
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
