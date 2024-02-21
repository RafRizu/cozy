import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int? rating;
  
  RatingItem({required this.index,required this.rating});

  @override
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      index <= (rating ?? 0)
          ? 'assets/images/icon_star.png'
          : 'assets/images/icon_star_grey.png',
      width: 20,
      height: 20,
    );
  }

}
