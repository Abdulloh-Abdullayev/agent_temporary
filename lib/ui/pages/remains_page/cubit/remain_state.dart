// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'remain_cubit.dart';

class RemainState extends Equatable {
  
  final bool loading;
  final List<RemainsCategoryModel> list;
  final bool hasError;
  final bool reload;
  RemainState({
   this.loading = true,
    this.list = const [],
    this.hasError = false,
    this.reload = false,
  });
  
   @override
  List<Object?> get props => [
        loading,
        list,
        hasError,
        reload,
      ];
  

  RemainState copyWith({
    bool? loading,
    List<RemainsCategoryModel>? list,
    bool? hasError,
    bool? reload,
  }) {
    return RemainState(
      loading: loading ?? this.loading,
      list: list ?? this.list,
      hasError: hasError ?? this.hasError,
      reload: reload ?? this.reload,
    );
  }
}

