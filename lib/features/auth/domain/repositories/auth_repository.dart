import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, String>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
}