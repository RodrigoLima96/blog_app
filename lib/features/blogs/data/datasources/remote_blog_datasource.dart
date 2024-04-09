import 'dart:typed_data';

import '../data.dart';

abstract interface class IRemoteBlogDataSource {
  Future<BlogModel> uploadBlog({required BlogModel blog});

  Future<String> uploadBlogImage({required Uint8List image, required String blogId});
}