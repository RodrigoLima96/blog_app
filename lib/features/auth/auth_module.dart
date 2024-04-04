import 'package:flutter_modular/flutter_modular.dart';

import 'auth.dart';

class AuthModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/login', child: (context) => const LoginPage());
    r.child('/sign-up', child: (context) => const SignUpPage());
  }
}