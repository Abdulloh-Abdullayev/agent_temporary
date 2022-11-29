part of 'all_task_bloc.dart';

@immutable
abstract class AllTaskEvent extends Equatable {}

class ImageUploaded extends AllTaskEvent {
  final XFile? userImgPath;

  ImageUploaded(this.userImgPath);

  @override
  List<Object?> get props => [userImgPath];
}