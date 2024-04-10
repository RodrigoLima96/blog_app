import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../domain.dart';

abstract interface class IBlogRepository {
  Future<Either<Failure, BlogEntity>> uploadBlog({
    required Uint8List image,
    required String title,
    required String content,
    required String userId,
    required String username,
    required List<String> topics,
  });

  Future<Either<Failure, List<BlogEntity>>> getAllBlogs();
}
