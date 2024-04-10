// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'dart:typed_data';

import '../../../../core/core.dart';
import '../../blogs.dart';
import 'package:mobx/mobx.dart';

part 'blog_store.g.dart';

class BlogStore = _BlogStoreBase with _$BlogStore;

enum UploadBlogState { notStarted, loading, failure, success }

abstract class _BlogStoreBase with Store {
  final UploadBlogUsecase uploadBlogUsecase;
  final AppUserStore appUserStore;

  @observable
  UploadBlogState uploadBlogState = UploadBlogState.notStarted;

  @observable
  File? image;

  @observable
  List<String> selectedTopics = [];

  String uploadBlogFailureMessage = '';

  _BlogStoreBase({
    required this.uploadBlogUsecase,
    required this.appUserStore,
  });

  @action
  Future<void> uploadBlog({
    required String title,
    required String content,
  }) async {
    uploadBlogState = UploadBlogState.loading;
    List<int> bytes = await image!.readAsBytes();
    Uint8List convertedImage = Uint8List.fromList(bytes);

    final result = await uploadBlogUsecase(UploadBlogParams(
      image: convertedImage,
      title: title,
      content: content,
      userId: appUserStore.user!.id,
      topics: selectedTopics,
    ));

    result.fold(
      (failure) {
        uploadBlogFailureMessage = failure.message;
        uploadBlogState = UploadBlogState.failure;
      },
      (blog) {
        // print(blog);
        image = null;
        selectedTopics = [];
        uploadBlogState = UploadBlogState.success;
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
