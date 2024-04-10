// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'dart:typed_data';

import '../../../../core/core.dart';
import '../../blogs.dart';
import 'package:mobx/mobx.dart';

part 'blog_store.g.dart';

class BlogStore = _BlogStoreBase with _$BlogStore;

enum BlogStoreState { notStarted, loading, failure, success }

abstract class _BlogStoreBase with Store {
  final UploadBlogUsecase _uploadBlogUsecase;
  final GetAllBlogsUsecase _getAllBlogsUsecase;
  final AppUserStore _appUserStore;

  @observable
  BlogStoreState uploadBlogState = BlogStoreState.notStarted;
  @observable
  BlogStoreState getAllBlogsState = BlogStoreState.notStarted;

  @observable
  File? image;

  @observable
  ObservableList<BlogEntity> blogList = ObservableList<BlogEntity>();

  @observable
  List<String> selectedTopics = [];

  String uploadBlogFailureMessage = '';
  String getAllBlogsFailureMessage = '';

  _BlogStoreBase({
    required UploadBlogUsecase uploadBlogUsecase,
    required AppUserStore appUserStore,
    required GetAllBlogsUsecase getAllBlogsUsecase,
  })  : _appUserStore = appUserStore,
        _getAllBlogsUsecase = getAllBlogsUsecase,
        _uploadBlogUsecase = uploadBlogUsecase;

  @action
  Future<void> getAllBlogs() async {
    getAllBlogsState = BlogStoreState.loading;
    final result = await _getAllBlogsUsecase(NoParams());
    result.fold(
      (failure) {
        getAllBlogsFailureMessage = failure.message;
        getAllBlogsState = BlogStoreState.failure;
      },
      (list) {
        blogList.addAll(list);
        getAllBlogsState = BlogStoreState.success;
      },
    );
  }

  @action
  Future<void> uploadBlog({
    required String title,
    required String content,
  }) async {
    uploadBlogState = BlogStoreState.loading;
    List<int> bytes = await image!.readAsBytes();
    Uint8List convertedImage = Uint8List.fromList(bytes);

    final result = await _uploadBlogUsecase(UploadBlogParams(
      image: convertedImage,
      title: title,
      content: content,
      userId: _appUserStore.user!.id,
      username: _appUserStore.user!.name,
      topics: selectedTopics,
    ));

    result.fold(
      (failure) {
        uploadBlogFailureMessage = failure.message;
        uploadBlogState = BlogStoreState.failure;
      },
      (blog) {
        blogList.add(blog);
        image = null;
        selectedTopics = [];
        uploadBlogState = BlogStoreState.success;
      },
    );
  }

  @action
  selectTopics({required String topic}) {
    if (selectedTopics.contains(topic)) {
      selectedTopics.remove(topic);
    } else {
      selectedTopics.add(topic);
    }
  }
}