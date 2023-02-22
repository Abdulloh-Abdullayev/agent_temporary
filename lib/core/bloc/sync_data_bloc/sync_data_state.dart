part of 'sync_data_bloc.dart';

@immutable
abstract class SyncDataState extends Equatable {
  const SyncDataState();
}

class SyncDataInitial extends SyncDataState {
  @override
  List<Object?> get props => [];
}

class SyncDataFailure extends SyncDataState {
  @override
  List<Object?> get props => [];
}

class SyncDataSuccess extends SyncDataState {
  final double percent;
  final List<String> syncString;
  final bool reload;

  SyncDataSuccess({
    this.percent = 0.0,
    this.syncString = const [],
    this.reload = false,
  });

  SyncDataSuccess copyWith({
    double? percent,
    List<String>? syncString,
  }) {
    return SyncDataSuccess(
      percent: percent ?? this.percent,
      syncString: syncString ?? this.syncString,
      reload: !reload,
    );
  }

  @override
  List<Object> get props => [percent, syncString, reload];
}
