part of 'sync_bloc.dart';

abstract class SyncEvent extends Equatable {
  const SyncEvent();
}


class SyncLoaded extends SyncEvent {
  final String dbName;

  SyncLoaded({required this.dbName});

  @override
  List<Object?> get props => [dbName];
}
