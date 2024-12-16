import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class SignUpUsecase implements Usecase<String, SignUpParams> {
  AuthRepository authRepository;

  SignUpUsecase(this.authRepository);

  @override
  Future<Either<Failure, String>> call(params) async {
    return await authRepository.signUpWithUsernamePassword(
      userName: params.username,
      email: params.email,
      password: params.password,
    );
  }
}

class SignUpParams {
  final String username;
  final String email;
  final String password;

  SignUpParams(
      {required this.username, required this.email, required this.password});
}
