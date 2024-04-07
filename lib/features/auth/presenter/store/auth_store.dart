// ignore_for_file: library_private_types_in_public_api

import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/core.dart';
import '../../auth.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

enum AuthState { notStarted, loading, failure, success }

abstract class _AuthStoreBase with Store {
  final SignUpUserUsecase signUpUserUsecase;
  final LoginUserUsecase loginUserUsecase;

  @observable
  UserEntity? user;

  @observable
  AuthState authState = AuthState.notStarted;

  String authFailureMessage = '';

  _AuthStoreBase({
    required this.signUpUserUsecase,
    required this.loginUserUsecase,
  });

  @action
  Future<void> signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    _performAuthAction(
      () => signUpUserUsecase(
        UserSignUpParams(name: name, email: email, password: password),
      ),
    );
  }

  @action
  Future<void> _performAuthAction(
      Future<Either<Failure, UserEntity>> Function() action) async {
    authState = AuthState.loading;
    final result = await action();
    result.fold(
      (failure) {
        authFailureMessage = failure.message;
        authState = AuthState.failure;
      },
      (userResponse) {
        user = user;
        authState = AuthState.success;
      },
    );
  }
}
