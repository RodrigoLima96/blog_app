// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/core.dart';
import '../store/blog_store.dart';
import '../widgets/widgets.dart';

class AddNewBlogPage extends StatefulWidget {
  const AddNewBlogPage({super.key});

  @override
  State<AddNewBlogPage> createState() => _AddNewBlogPageState();
}

class _AddNewBlogPageState extends State<AddNewBlogPage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final blogStore = Modular.get<BlogStore>();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: blogStore.uploadBlogState == UploadBlogState.loading
            ? null
            : AppBar(
                actions: [
                  IconButton(
                    onPressed: _submitBlog,
                    icon: const Icon(Icons.done_rounded),
                  )
                ],
              ),
        body: blogStore.uploadBlogState == UploadBlogState.loading
            ? const LoaderWidget()
            : AddNewBlogPageBody(
                formKey: formKey,
                blogStore: blogStore,
                titleController: titleController,
                contentController: contentController,
              ),
      ),
    );
  }

  void _submitBlog() async {
    if (blogStore.image == null) {
      showCustomSnackbar(context, 'select an Image!');
    } else if (blogStore.selectedTopics.isEmpty) {
      showCustomSnackbar(context, 'select at least one topic!');
    } else if (formKey.currentState!.validate()) {
      await blogStore.uploadBlog(
        title: titleController.text,
        content: contentController.text,
      );

      if (blogStore.uploadBlogState == UploadBlogState.success) {
        Modular.to.pop();
        showCustomSnackbar(context, 'Blog Created Successfully');
      } else if (blogStore.uploadBlogState == UploadBlogState.failure) {
        showCustomSnackbar(context, blogStore.uploadBlogFailureMessage);
      }
    }
  }
}
