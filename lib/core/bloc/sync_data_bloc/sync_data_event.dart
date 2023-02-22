part of 'sync_data_bloc.dart';

@immutable
abstract class SyncDataEvent extends Equatable {}

class SyncDataLoaded extends SyncDataEvent {
  final String dbName;

  SyncDataLoaded({required this.dbName});

  @override
  List<Object?> get props => [dbName];
}
