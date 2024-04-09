import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class AddNewBlogPage extends StatelessWidget {
  const AddNewBlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.done_rounded))
        ],
      ),
      body: const AddNewBlogPageBody(),
    );
  }
}
