import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

import 'profile_page_state.dart';

class ProfilePageCubit extends Cubit<ProfilePageState> {
  static ProfilePageCubit get to => Modular.get<ProfilePageCubit>();

  ProfilePageCubit() : super(const ProfilePageState());

  Future onImageUploaded() async {
    XFile? imagePicker = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (imagePicker != null) {
      emit(
        state.copyWith(
          image: imagePicker,
        ),
      );
    }
  }

  Future nameChange(String name) async {
    emit(state.copyWith(name: name));
  }

  Future phoneNumberChange(String phone) async {
    emit(state.copyWith(phoneNumber: phone));
  }
}
