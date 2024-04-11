import 'package:hive/hive.dart';

import '../../blogs.dart';

class LocalBlogDataSourceImpl implements ILocalBlogDataSource {
  final Box box;

  LocalBlogDataSourceImpl({required this.box});
  @override
  List<BlogModel> loadLocalBlogs() {
    List<BlogModel> blogs = [];
    box.read(() {
      for (int i = 0; i < box.length; i++) {
        blogs.add(BlogModel.fromMap(box.get(i.toString())));
      }
    });

    return blogs;
  }

  @override
  void uploadLocalBlogs({required List<BlogModel> blogs}) {
    box.clear();

    box.write(() {
      for (int i = 0; i < blogs.length; i++) {
        box.put(i.toString(), blogs[i].toMap());
      }
    });
  }
}