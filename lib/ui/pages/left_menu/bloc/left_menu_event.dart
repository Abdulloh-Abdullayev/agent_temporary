part of 'left_menu_bloc.dart';

@immutable
abstract class LeftMenuEvent extends Equatable {
  const LeftMenuEvent();
}

class AccountImageUploaded extends LeftMenuEvent {
  final XFile? userImgPath;

  const AccountImageUploaded(this.userImgPath);

  @override
  List<Object?> get props => [userImgPath];
}

class HideShowed extends LeftMenuEvent {
  final bool hideShow;
  const HideShowed(this.hideShow);

  @override
  List<Object?> get props => [];
}
