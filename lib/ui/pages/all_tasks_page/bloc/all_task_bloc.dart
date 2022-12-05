
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'all_task_event.dart';

part 'all_task_state.dart';

class AllTaskBloc extends Bloc<AllTaskEvent, AllTaskState> {
  AllTaskBloc() : super(const AllTaskState()) {


    on<ImageUploaded>(_onImageUploaded);
  }

  static AllTaskBloc get to=> Modular.get<AllTaskBloc>();

  Future _onImageUploaded(
    ImageUploaded event,
    Emitter<AllTaskState> emit,
  )async {
    XFile? imagePicker = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (imagePicker != null) {
      emit(
        state.copyWith(
          image: imagePicker,
          completed: true,
        ),
      );
    }
  }
}
