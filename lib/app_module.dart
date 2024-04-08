import 'package:flutter_modular/flutter_modular.dart';

import 'core/core.dart';
import 'features/auth/auth.dart';
import 'home_page.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.module('/auth/', module: AuthModule());
  }
}