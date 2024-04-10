import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/core.dart';
import '../../../blogs.dart';
import '../widgets.dart';

class BlogsPageBody extends StatefulWidget {
  const BlogsPageBody({super.key});

  @override
  State<BlogsPageBody> createState() => _BlogsPageBodyState();
}

class _BlogsPageBodyState extends State<BlogsPageBody> {
  final blogStore = Modular.get<BlogStore>();

  @override
  void initState() {
    super.initState();
    _getAllBlogs();
  }

  Future<void> _getAllBlogs() async {
    await blogStore.getAllBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      reaction((_) => blogStore.getAllBlogsState, (BlogStoreState state) {
        if (state == BlogStoreState.failure) {
          showCustomSnackbar(context, blogStore.getAllBlogsFailureMessage);
        }
      });
      return blogStore.getAllBlogsState == BlogStoreState.loading
          ? const LoaderWidget()
          : SizedBox(
              child: ListView.builder(
                itemCount: blogStore.blogList.length,
                itemBuilder: (context, index) => BlogCardWidget(
                  blog: blogStore.blogList[index],
                  color: index % 3 == 0
                      ? AppPallete.gradient1
                      : index % 3 == 1
                          ? AppPallete.gradient2
                          : AppPallete.gradient3,
                ),
              ),
            );
    });
  }
}
