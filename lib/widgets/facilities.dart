import 'package:flutter/material.dart';
import 'package:cozy/theme.dart';

class FacilitiesCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int? total;

  FacilitiesCard({required this.name,required this.imageUrl,required this.total});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageUrl,
          width: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: total.toString(),
                style: purpleTextStyle.copyWith(fontSize: 14),
              ),
              TextSpan(
                text: ' ${name}',
                style: greyLightTextStyle.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
