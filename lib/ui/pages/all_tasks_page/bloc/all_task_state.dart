part of 'all_task_bloc.dart';

class AllTaskState extends Equatable {
  final XFile? image;
  final bool completed;
  final bool reLoad;

  const AllTaskState({
    this.image,
    this.completed = false,
    this.reLoad = false,
  });

  AllTaskState copyWith({
    XFile? image,
    bool? completed,
  }) {
    return AllTaskState(
      image: image ?? this.image,
      completed: completed ?? this.completed,
      reLoad: !reLoad,
    );
  }

  @override
  List<Object?> get props => [
        image,
        completed,
        reLoad,
      ];
}
