import 'package:flutter_modular/flutter_modular.dart';

import 'features/auth/auth.dart';
import 'home_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.module('/auth/', module: AuthModule());
  }
}