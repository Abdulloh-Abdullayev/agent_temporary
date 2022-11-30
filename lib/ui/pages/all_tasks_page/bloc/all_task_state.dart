part of 'all_task_bloc.dart';

class AllTaskState extends Equatable {
  final XFile? image;
  final bool completed;
  final bool reLoad;

  const AllTaskState({
    this.image,
    this.reLoad = false,
    this.completed = false,
  });

  AllTaskState copyWith({
    XFile? image,
    bool? completed,
    bool? reLoad,
  }) {
    return copyWith(
      image: image ?? this.image,
      completed: completed ?? this.completed,
      reLoad: !reLoad!,
    );
  }

  @override
  List<Object?> get props => [
        image,
        completed,
        reLoad,
      ];
}
