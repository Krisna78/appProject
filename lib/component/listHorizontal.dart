import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListHorizontal extends StatelessWidget {
  final String? category;
  const ListHorizontal({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.5),
      child: ElevatedButton(
        onPressed: () {
          print('Pressed $category');
        },
        child: Text(category!),
      ),
    );
  }
}
