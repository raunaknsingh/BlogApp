import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/error/server_exception.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/domain/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, String>> signInWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement signInWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithUsernamePassword({
    required String userName,
    required String email,
    required String password,
  }) async {
    try {
      String userId = await authRemoteDataSource.signUpWithUsernamePassword(
        username: userName,
        email: email,
        password: password,
      );
      return Either.right(userId);
    } on ServerException catch (e) {
      return Either.left(
        Failure(e.message),
      );
    }
  }
}
