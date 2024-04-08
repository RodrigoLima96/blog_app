
import 'package:flutter_modular/flutter_modular.dart';

import 'blogs.dart';

class BlogsModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const BlogsPage());
    r.child('/add', child: (context) => const AddNewBlogPage());
  }
}
