import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  final String imageUrl;

  PhotoItem({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          child: Image.network(
            imageUrl,
            width: 110,
            height: 88,
          ),
        ),
        SizedBox(
          width: 18,
        ),
      ],
    );
  }
}
