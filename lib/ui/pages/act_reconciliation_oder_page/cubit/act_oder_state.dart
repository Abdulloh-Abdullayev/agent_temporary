// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'act_oder_cubit.dart';

class ActOderState extends Equatable {
  final List<List<String>> baseTableChildren;
  final List<List<String>> tempTableChildren;
  final List<List<String>> allSum;
  final List<String> tableColumns;
  final Map<String, String> actSortStatus;
  final DateTime firstDate;
  final DateTime secondDate;
  const ActOderState({
    required this.baseTableChildren,
    required this.tempTableChildren,
    required this.allSum,
    required this.tableColumns,
    required this.actSortStatus,
    required this.firstDate,
    required this.secondDate,
  });

  @override
  List<Object> get props => [
        baseTableChildren,
        tempTableChildren,
        allSum,
        tableColumns,
        actSortStatus,
        firstDate,
        secondDate,
      ];

  ActOderState copyWith({
    List<List<String>>? baseTableChildren,
    List<List<String>>? tempTableChildren,
    List<List<String>>? allSum,
    List<String>? tableColumns,
    Map<String, String>? actSortStatus,
    DateTime? firstDate,
    DateTime? secondDate,
  }) {
    return ActOderState(
      baseTableChildren: baseTableChildren ?? this.baseTableChildren,
      tempTableChildren: tempTableChildren ?? this.tempTableChildren,
      allSum: allSum ?? this.allSum,
      tableColumns: tableColumns ?? this.tableColumns,
      actSortStatus: actSortStatus ?? this.actSortStatus,
      firstDate: firstDate ?? this.firstDate,
      secondDate: secondDate ?? this.secondDate,
    );
  }
}
