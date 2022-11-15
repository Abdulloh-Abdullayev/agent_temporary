import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'left_menu_event.dart';

part 'left_menu_state.dart';

class LeftMenuBloc extends Bloc<LeftMenuEvent, LeftMenuState> {
  LeftMenuBloc() : super(const LeftMenuState()) {
    on<AccountImageUploaded>(_onImageUploaded);
    on<HideShowed>(_onHideShow);
  }

  static LeftMenuBloc get to => Modular.get<LeftMenuBloc>();

  Future _onImageUploaded(
    AccountImageUploaded event,
    Emitter<LeftMenuState> emit,
  ) async {
    XFile? imagePicker = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (imagePicker != null) {
      emit(state.copyWith(
        image: imagePicker,

      ),);
    }
  }

  void _onHideShow(
    HideShowed event,
    Emitter<LeftMenuState> emit,
  ) {
    emit(state.copyWith(hideShow: event.hideShow));
  }
}
