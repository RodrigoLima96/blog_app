import 'package:flutter_modular/flutter_modular.dart';

import 'core/core.dart';
import 'features/auth/auth.dart';
import 'features/blogs/blogs.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(r) {
    r.child('/', child: (context) => const BlogsPage());
    r.module('/auth/', module: AuthModule());
    r.module('/blogs/', module: BlogsModule());
  }
}