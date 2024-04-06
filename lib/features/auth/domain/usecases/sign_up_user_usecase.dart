import '../domain.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';

class SignUpUserUsecase implements Usecase<String, UserSignUpParams> {
  final IAuthRepository authRepository;

  SignUpUserUsecase({required this.authRepository});
  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailAndPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String name;
  final String email;
  final String password;

  UserSignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
