import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class CurrentUserUsecase implements Usecase<UserEntity, NoParams> {
  final IAuthRepository authRepository;

  CurrentUserUsecase({required this.authRepository});
  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await authRepository.getCurrentUser();
  }
}