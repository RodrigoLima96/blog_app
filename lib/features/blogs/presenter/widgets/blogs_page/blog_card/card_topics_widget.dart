import 'package:flutter/material.dart';

class CardTopicsWidget extends StatelessWidget {
  const CardTopicsWidget({
    super.key,
    required this.topics,
  });

  final List<String> topics;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: topics
            .map((e) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Chip(
                    label: Text(e),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
