import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class LoginUserUsecase implements Usecase<UserEntity, UserLoginParams> {
  final IAuthRepository authRepository;

  LoginUserUsecase({required this.authRepository});
  @override
  Future<Either<Failure, UserEntity>> call(UserLoginParams params) async {
    return await authRepository.loginWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({
    required this.email,
    required this.password,
  });
}
