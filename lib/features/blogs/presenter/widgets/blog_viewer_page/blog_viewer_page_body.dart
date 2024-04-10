import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../blogs.dart';

class BlogViewerPageBody extends StatelessWidget {
  final BlogEntity blog;
  const BlogViewerPageBody({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(blog.title,
                  style:
                      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 25),
              Text('By ${blog.username}',
                  style:
                      const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              Text(
                '${formatDate(blog.updatedAt)} . ${calculateReadingTime(content: blog.content)} min',
                style: const TextStyle(
                  fontSize: 16,
                  color: AppPallete.greyColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      blog.imageUrl,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return const SizedBox(
                            height: 100,
                            child: LoaderWidget(),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(blog.content, textAlign: TextAlign.justify, style: const TextStyle(fontSize: 16, height: 2)),
            ],
          ),
        ),
      ),
    );
  }
}
