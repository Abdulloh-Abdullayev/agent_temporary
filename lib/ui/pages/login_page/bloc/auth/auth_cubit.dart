import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  static AuthCubit get to => Modular.get<AuthCubit>();

  AuthCubit() : super(AuthState());

  var internetConnection;

  void codeChange(String v) {
    emit(state.copyWith(code: v));
  }



}
