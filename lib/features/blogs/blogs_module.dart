
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'blogs.dart';

class BlogsModule extends Module {
  @override
  void binds(i) {
    // usecases
    i.add(() => UploadBlogUsecase(blogRepository: i()));
    i.add(() => GetAllBlogsUsecase(blogRepository: i()));

    // repositories
    i.addLazySingleton<IBlogRepository>(() => BlogRepositoryImpl(remoteBlogDataSource: i()));

    // datasources
    i.addLazySingleton<IRemoteBlogDataSource>(() => RemoteBlogDataSourceImpl(firestore: i(), storage: i()));

    // firebase
    i.addLazySingleton(() => FirebaseStorage.instance);
    i.addLazySingleton(() => FirebaseFirestore.instance);

    // store
    i.addLazySingleton(() => BlogStore(uploadBlogUsecase: i(),appUserStore: i(), getAllBlogsUsecase: i()));

  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const BlogsPage());
    r.child('/add', child: (context) => const AddNewBlogPage());
  }
}
