import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../blogs.dart';

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
    return Center(
      child: TextButton(
        onPressed: () async {
          await blogStore.getAllBlogs();
        },
        child: Text('Total of blogs: ${blogStore.blogList.length}'),
      ),
    );
  }
}
