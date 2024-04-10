import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../blogs.dart';

class BlogTopicsWidget extends StatefulWidget {
  final BlogStore blogStore;

  const BlogTopicsWidget({
    super.key,
    required this.blogStore,
  });

  @override
  State<BlogTopicsWidget> createState() => _BlogTopicsWidgetState();
}

class _BlogTopicsWidgetState extends State<BlogTopicsWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: ['Technology', 'Business', 'Programing', 'Entertainment']
            .map((e) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: () {
                      widget.blogStore.selectTopics(topic: e);
                      setState(() {});
                    },
                    child: Chip(
                      label: Text(e),
                      color: widget.blogStore.selectedTopics.contains(e)
                          ? const MaterialStatePropertyAll(AppPallete.gradient1)
                          : null,
                      side: widget.blogStore.selectedTopics.contains(e)
                          ? null
                          : const BorderSide(
                              color: AppPallete.borderColor,
                            ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
