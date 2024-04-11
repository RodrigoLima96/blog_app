import '../../blogs.dart';

abstract interface class ILocalBlogDataSource {
  void uploadLocalBlogs({required List<BlogModel> blogs});
  List<BlogModel> loadLocalBlogs();
}