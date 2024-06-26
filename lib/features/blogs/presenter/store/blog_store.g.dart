// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BlogStore on _BlogStoreBase, Store {
  late final _$uploadBlogStateAtom =
      Atom(name: '_BlogStoreBase.uploadBlogState', context: context);

  @override
  BlogStoreState get uploadBlogState {
    _$uploadBlogStateAtom.reportRead();
    return super.uploadBlogState;
  }

  @override
  set uploadBlogState(BlogStoreState value) {
    _$uploadBlogStateAtom.reportWrite(value, super.uploadBlogState, () {
      super.uploadBlogState = value;
    });
  }

  late final _$getAllBlogsStateAtom =
      Atom(name: '_BlogStoreBase.getAllBlogsState', context: context);

  @override
  BlogStoreState get getAllBlogsState {
    _$getAllBlogsStateAtom.reportRead();
    return super.getAllBlogsState;
  }

  @override
  set getAllBlogsState(BlogStoreState value) {
    _$getAllBlogsStateAtom.reportWrite(value, super.getAllBlogsState, () {
      super.getAllBlogsState = value;
    });
  }

  late final _$imageAtom = Atom(name: '_BlogStoreBase.image', context: context);

  @override
  File? get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(File? value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$blogListAtom =
      Atom(name: '_BlogStoreBase.blogList', context: context);

  @override
  ObservableList<BlogEntity> get blogList {
    _$blogListAtom.reportRead();
    return super.blogList;
  }

  @override
  set blogList(ObservableList<BlogEntity> value) {
    _$blogListAtom.reportWrite(value, super.blogList, () {
      super.blogList = value;
    });
  }

  late final _$selectedTopicsAtom =
      Atom(name: '_BlogStoreBase.selectedTopics', context: context);

  @override
  List<String> get selectedTopics {
    _$selectedTopicsAtom.reportRead();
    return super.selectedTopics;
  }

  @override
  set selectedTopics(List<String> value) {
    _$selectedTopicsAtom.reportWrite(value, super.selectedTopics, () {
      super.selectedTopics = value;
    });
  }

  late final _$getAllBlogsAsyncAction =
      AsyncAction('_BlogStoreBase.getAllBlogs', context: context);

  @override
  Future<void> getAllBlogs() {
    return _$getAllBlogsAsyncAction.run(() => super.getAllBlogs());
  }

  late final _$uploadBlogAsyncAction =
      AsyncAction('_BlogStoreBase.uploadBlog', context: context);

  @override
  Future<void> uploadBlog({required String title, required String content}) {
    return _$uploadBlogAsyncAction
        .run(() => super.uploadBlog(title: title, content: content));
  }

  late final _$_BlogStoreBaseActionController =
      ActionController(name: '_BlogStoreBase', context: context);

  @override
  dynamic selectTopics({required String topic}) {
    final _$actionInfo = _$_BlogStoreBaseActionController.startAction(
        name: '_BlogStoreBase.selectTopics');
    try {
      return super.selectTopics(topic: topic);
    } finally {
      _$_BlogStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
uploadBlogState: ${uploadBlogState},
getAllBlogsState: ${getAllBlogsState},
image: ${image},
blogList: ${blogList},
selectedTopics: ${selectedTopics}
    ''';
  }
}
