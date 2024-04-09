import 'package:flutter/material.dart';

import 'widgets.dart';

class AddNewBlogPageBody extends StatefulWidget {
  const AddNewBlogPageBody({super.key});

  @override
  State<AddNewBlogPageBody> createState() => _AddNewBlogPageBodyState();
}

class _AddNewBlogPageBodyState extends State<AddNewBlogPageBody> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 15),
            const ImageSelectorWidget(),
            const SizedBox(height: 20),
            const BlogTopicsWidget(),
            const SizedBox(height: 20),
            BlogEditorWidget(controller: titleController, hintText: 'Blog Title'),
            const SizedBox(height: 10),
            BlogEditorWidget(controller: contentController, hintText: 'Blog Content'),
          ],
        ),
      ),
    );
  }
}
