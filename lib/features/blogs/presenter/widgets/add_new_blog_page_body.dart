import 'package:flutter/material.dart';

import '../../blogs.dart';
import 'widgets.dart';

class AddNewBlogPageBody extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final BlogStore blogStore;
  final TextEditingController titleController;
  final TextEditingController contentController;

  const AddNewBlogPageBody({
    super.key,
    required this.formKey,
    required this.blogStore,
    required this.titleController,
    required this.contentController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 15),
              ImageSelectorWidget(blogStore: blogStore),
              const SizedBox(height: 20),
              BlogTopicsWidget(blogStore: blogStore),
              const SizedBox(height: 20),
              BlogEditorWidget(controller: titleController, hintText: 'Blog Title'),
              const SizedBox(height: 10),
              BlogEditorWidget(controller: contentController, hintText: 'Blog Content'),
            ],
          ),
        ),
      ),
    );
  }
}
