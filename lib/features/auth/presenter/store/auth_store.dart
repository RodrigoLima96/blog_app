// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

import '../../auth.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final SignUpUserUsecase signUpUserUsecase;

  @observable
  UserEntity? user;

  _AuthStoreBase({
    required this.signUpUserUsecase,
  });

  @action
  Future<void> signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    final result = await signUpUserUsecase(
      UserSignUpParams(name: name, email: email, password: password),
    );

    result.fold(
      (failure) {
        throw Error();
      },
      (userUid) {
        user = user;
      },
    );
  }
}