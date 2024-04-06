import 'package:dartz/dartz.dart';

import '../core.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}