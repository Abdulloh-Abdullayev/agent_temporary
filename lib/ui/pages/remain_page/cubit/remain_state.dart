part of 'remain_cubit.dart';

class RemainState extends Equatable {
  final bool loading;
  final List<RemainsCategoryModel> list;
  final bool hasError;
  final bool reload;
  final int counterValueBlokCola;

  const RemainState({
    this.loading = true,
    this.list = const [],
    this.hasError = false,
    this.reload = false,
    this.counterValueBlokCola = 0,
  });

 

  @override
  List<Object?> get props => [
        loading,
        list,
        hasError,
        reload,
        counterValueBlokCola,
      ];

  


  RemainState copyWith({
    bool? loading,
    List<RemainsCategoryModel>? list,
    bool? hasError,
    bool? reload,
    int? counterValueBlokCola,

  }) {
    return RemainState(
      loading: loading ?? this.loading,
      list: list ?? this.list,
      hasError: hasError ?? this.hasError,
      reload: reload ?? this.reload,
      counterValueBlokCola: counterValueBlokCola ?? this.counterValueBlokCola,
    );
  }
}

