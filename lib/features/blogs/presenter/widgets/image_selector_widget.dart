import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class ImageSelectorWidget extends StatefulWidget {
  const ImageSelectorWidget({
    super.key,
  });

  @override
  State<ImageSelectorWidget> createState() => _ImageSelectorWidgetState();
}

class _ImageSelectorWidgetState extends State<ImageSelectorWidget> {
  File? image;
  void selectImage() async {
    final imagePicker = await pickImage();
    setState(() {
      image = imagePicker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectImage();
      },
      child: image != null
          ? SizedBox(
              height: 150,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(image!, fit: BoxFit.cover),
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
