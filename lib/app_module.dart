import 'package:flutter_modular/flutter_modular.dart';

import 'features/auth/auth.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const LoginPage());
    r.module('/auth/', module: AuthModule());
  }
}