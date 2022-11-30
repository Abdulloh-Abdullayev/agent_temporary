// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'act_cubit.dart';

class ActState extends Equatable {
  final List<List<String>> tableChildren;
  final List<String> tableColumns;
  ActState({
    required this.tableChildren,
    required this.tableColumns,
  });

  @override
  List<Object> get props => [tableChildren, tableColumns];
}
