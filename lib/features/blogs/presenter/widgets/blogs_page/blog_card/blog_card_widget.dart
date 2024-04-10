import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../../core/core.dart';
import '../../../../blogs.dart';
import '../../widgets.dart';

class BlogCardWidget extends StatelessWidget {
  final BlogEntity blog;
  final Color color;
  const BlogCardWidget({super.key, required this.blog, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardTopicsWidget(topics: blog.topics),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(blog.title,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Text('${calculateReadingTime(content: blog.content)} min'),
        ],
      ),
    );
  }
}
