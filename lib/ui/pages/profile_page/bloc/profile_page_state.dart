import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePageState extends Equatable {
  final XFile? image;
  final String name;
  final String phoneNumber;
  final bool reLoad;

  const ProfilePageState({
    this.image,
    this.name = '',
    this.phoneNumber = '',
    this.reLoad = false,
  });

  ProfilePageState copyWith({
    XFile? image,
    String? name,
    String? phoneNumber,
  }) {
    return ProfilePageState(
      image: image ?? this.image,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      reLoad: !reLoad,
    );
  }

  @override
  List<Object?> get props => [
        image,
        name,
        phoneNumber,
        reLoad,
      ];
}
