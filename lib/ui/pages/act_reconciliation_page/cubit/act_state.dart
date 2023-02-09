// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'act_cubit.dart';

class ActState extends Equatable {
  final List<List<String>> baseTableChildren;
  final List<List<String>> tempTableChildren;
  final List<List<String>> allSum;
  final List<String> tableColumns;
  final Map<String, String> actSortStatus;
  ActState({
    required this.baseTableChildren,
    required this.tempTableChildren,
    required this.allSum,
    required this.tableColumns,
    required this.actSortStatus,
  });

  @override
  List<Object?> get props => [
        baseTableChildren,
        tempTableChildren,
        tableColumns,
        allSum,
      ];

  ActState copyWith({
    List<List<String>>? baseTableChildren,
    List<List<String>>? tempTableChildren,
    List<List<String>>? allSum,
    List<String>? tableColumns,
    Map<String, String>? actSortStatus,
  }) {
    return ActState(
      baseTableChildren: baseTableChildren ?? this.baseTableChildren,
      tempTableChildren: tempTableChildren ?? this.tempTableChildren,
      allSum: allSum ?? this.allSum,
      tableColumns: tableColumns ?? this.tableColumns,
      actSortStatus: actSortStatus ?? this.actSortStatus,
    );
  }
}
