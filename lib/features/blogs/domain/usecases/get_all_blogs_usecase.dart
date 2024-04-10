import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../blogs.dart';

class GetAllBlogsUsecase implements Usecase<List<BlogEntity>, NoParams> {
  final IBlogRepository blogRepository;

  GetAllBlogsUsecase({required this.blogRepository});

  @override
  Future<Either<Failure, List<BlogEntity>>> call(params) async {
    return await blogRepository.getAllBlogs();
  }
}