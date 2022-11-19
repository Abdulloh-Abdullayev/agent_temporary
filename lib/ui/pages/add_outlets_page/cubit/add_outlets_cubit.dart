import 'dart:typed_data';

import 'package:agent/core/utils/app_logger_util.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

part 'add_outlets_state.dart';

class AddOutletsCubit extends Cubit<AddOutletsState> {
  AddOutletsCubit() : super(const AddOutletsState());

  static AddOutletsCubit get to => Modular.get<AddOutletsCubit>();

  Future uploadImg() async {
    AppLoggerUtil.w("asdfsdfgd");
    XFile? imagePicker = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    List<XFile> newList = List.from(state.images);
    newList.add(imagePicker!);
    emit(state.copyWith(images: newList));
  }

  Future deleteImg(int index) async {
    AppLoggerUtil.w("asdfsdfgd");
    List<XFile> newList = List.from(state.images);
    newList.removeAt(index);
    emit(state.copyWith(images: newList));
  }
}
