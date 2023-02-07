part of 'sync_bloc.dart';

@immutable
abstract class SyncState extends Equatable {
  const SyncState();
}


class SyncInitial extends SyncState {
  @override
  List<Object?> get props => [];
}

class SyncFailure extends SyncState {
  @override
  List<Object?> get props => [];
}

class SyncSuccess extends SyncState {
  final double percent;
  final List<String> syncString;
  final bool reload;

  SyncSuccess({
    this.percent = 0.0,
    this.syncString = const [],
    this.reload = false,
  });

  SyncSuccess copyWith({
    double? percent,
    List<String>? syncString,
  }) {
    return SyncSuccess(
      percent: percent ?? this.percent,
      syncString: syncString ?? this.syncString,
      reload: !reload,
    );
  }

  @override
  List<Object> get props => [percent, syncString, reload];
}
