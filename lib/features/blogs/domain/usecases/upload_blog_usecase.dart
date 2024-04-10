import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../blogs.dart';

class UploadBlogUsecase implements Usecase<BlogEntity, UploadBlogParams> {
  final IBlogRepository blogRepository;

  UploadBlogUsecase({required this.blogRepository});

  @override
  Future<Either<Failure, BlogEntity>> call(UploadBlogParams params) async {
    return await blogRepository.uploadBlog(
      image: params.image,
      title: params.title,
      content: params.content,
      userId: params.userId,
      username: params.username,
      topics: params.topics,
    );
  }
}

class UploadBlogParams {
  final Uint8List image;
  final String title;
  final String content;
  final String userId;
  final String username;
  final List<String> topics;

  UploadBlogParams({
    required this.image,
    required this.title,
    required this.content,
    required this.userId,
    required this.username,
    required this.topics,
  });
}
