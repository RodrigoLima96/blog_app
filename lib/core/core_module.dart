import 'package:flutter_modular/flutter_modular.dart';

import 'core.dart';

class CoreModule extends Module {
  @override
  void binds(i) {
    // store
    i.addLazySingleton(() => AppUserStore());
  }
}