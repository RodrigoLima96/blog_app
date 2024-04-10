import 'package:blog_app/features/blogs/blogs.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class BlogViewerPage extends StatelessWidget {
  final BlogEntity blog;
  const BlogViewerPage({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlogViewerPageBody(blog: blog),
    );
  }
}
