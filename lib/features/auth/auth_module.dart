import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../initial_page.dart';
import 'auth.dart';

class AuthModule extends Module {
  @override
  void binds(i) {
    // Usecases
    i.add(() => SignUpUserUsecase(authRepository: i()));
    i.add(() => LoginUserUsecase(authRepository: i()));
    i.add(() => CurrentUserUsecase(authRepository: i()));

    // repositories
    i.addLazySingleton<IAuthRepository>(() => AuthRepositoryImpl(remoteDataSource: i()));

    // datasources
    i.addLazySingleton<IAuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(auth: i(), firestore: i()));

    // firebase
    i.addLazySingleton(() => FirebaseAuth.instanceFor(app: Firebase.app()));
    i.addLazySingleton(() => FirebaseFirestore.instance);

    // store
    i.addLazySingleton(() => AuthStore(signUpUserUsecase: i(), loginUserUsecase: i(), appUserStore: i(), currentUserUsecase: i()));
  }

  @override
  void routes(r) {
    r.child('/initial', child: (context) => const InitialPage());
    r.child('/login', child: (context) => const LoginPage());
    r.child('/sign-up', child: (context) => const SignUpPage());
  }
}
