import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class BlogTopicsWidget extends StatefulWidget {
  const BlogTopicsWidget({
    super.key,
  });

  @override
  State<BlogTopicsWidget> createState() => _BlogTopicsWidgetState();
}

class _BlogTopicsWidgetState extends State<BlogTopicsWidget> {
    List<String> selectedTopics = [];

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
                      if (selectedTopics.contains(e)) {
                        selectedTopics.remove(e);
                      } else {
                        selectedTopics.add(e);
                      }
                      setState(() {});
                    },
                    child: Chip(
                      label: Text(e),
                      color: selectedTopics.contains(e)
                          ? const MaterialStatePropertyAll(AppPallete.gradient1)
                          : null,
                      side: selectedTopics.contains(e) ? null : const BorderSide(
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
