import 'package:blog_app/features/auth/domain/usecase/sign_up_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUsecase _signUpUsecase;

  AuthBloc({
    required SignUpUsecase signupUsecase,
  })  : _signUpUsecase = signupUsecase,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      final res = await _signUpUsecase(
        SignUpParams(
          username: event.username,
          email: event.email,
          password: event.password,
        ),
      );
      res.fold(
        (failure) => emit(
          AuthFailure(
            failure.errorMessage,
          ),
        ),
        (uid) => emit(
          AuthSuccess(uid),
        ),
      );
    });
  }
}
