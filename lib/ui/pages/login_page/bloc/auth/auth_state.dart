part of 'auth_cubit.dart';

class AuthState extends Equatable {
  AuthState({
    this.code = "",
  });

  String code;

  @override
  List<Object?> get props => [
        code,
      ];

  AuthState copyWith({
    String? code,
  }) {
    return AuthState(
      code: code ?? this.code,
    );
  }
}
