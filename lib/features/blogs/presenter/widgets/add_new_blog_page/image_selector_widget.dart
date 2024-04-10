import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../blogs.dart';

class ImageSelectorWidget extends StatefulWidget {
    final BlogStore blogStore;

  const ImageSelectorWidget({
    super.key,
    required this.blogStore
  });

  @override
  State<ImageSelectorWidget> createState() => _ImageSelectorWidgetState();
}

class _ImageSelectorWidgetState extends State<ImageSelectorWidget> {
  void selectImage() async {
    final imagePicker = await pickImage();
    setState(() {
      widget.blogStore.image = imagePicker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectImage();
      },
      child: widget.blogStore.image != null
          ? SizedBox(
              height: 150,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(widget.blogStore.image!, fit: BoxFit.cover),
              ),
            )
          : DottedBorder(
              color: AppPallete.borderColor,
              dashPattern: const [10, 4],
              radius: const Radius.circular(10),
              borderType: BorderType.RRect,
              strokeCap: StrokeCap.round,
              child: const SizedBox(
                height: 150,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.folder_open, size: 40),
                    SizedBox(height: 15),
                    Text(
                      'Select your image',
                      style: TextStyle(fontSize: 17),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
