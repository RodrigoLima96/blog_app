import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'auth.dart';

class AuthModule extends Module {
  @override
  void binds(i) {
    // Usecases
    i.addLazySingleton(() => SignUpUserUsecase(authRepository: i()));

    // repositories
    i.addLazySingleton<IAuthRepository>(() => AuthRepositoryImpl(remoteDataSource: i()));

    // datasources
    i.addLazySingleton<IAuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(auth: i()));

    // firebase
    i.add(() => FirebaseAuth.instanceFor(app: Firebase.app()));

    // store
    i.addLazySingleton(() => AuthStore(signUpUserUsecase: i()));
  }

  @override
  void routes(r) {
    r.child('/login', child: (context) => const LoginPage());
    r.child('/sign-up', child: (context) => const SignUpPage());
  }
}