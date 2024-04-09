import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/core.dart';
import '../../blogs.dart';
import '../data.dart';

class BlogRepository implements IBlogRepository {
  final IRemoteBlogDataSource remoteBlogDataSource;

  BlogRepository({required this.remoteBlogDataSource});

  @override
  Future<Either<Failure, BlogEntity>> uploadBlog({
    required Uint8List image,
    required String title,
    required String content,
    required String userId,
    required List<String> topics,
  }) async {
    try {
      final blodId = const Uuid().v1();

      final imageUrl = await remoteBlogDataSource.uploadBlogImage(image: image, blogId: blodId);

      final BlogModel blogModel = BlogModel(
        id: blodId,
        userId: userId,
        title: title,
        content: content,
        imageUrl: imageUrl,
        topics: topics,
        updatedAt: DateTime.now(),
      );

      final uploadedBlog = await remoteBlogDataSource.uploadBlog(blog: blogModel);
      return right(uploadedBlog);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
