import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../widgets/widgets.dart';

class BlogsPage extends StatelessWidget {
  const BlogsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog App'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Modular.to.pushNamed('/blogs/add');
            },
            icon: const Icon(CupertinoIcons.add_circled),
          ),
        ],
      ),
      body: const BlogsPageBody(),
    );
  }
}