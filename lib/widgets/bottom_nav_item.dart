import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {

  final String imageUrl;
  final int index;
  final bool isActive;
  
  BottomNavItem({this.imageUrl='assets/images/icon_home.png',this.isActive=false,this.index=1});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imageUrl,
          width: 26,
          height: 26,
        ),
        Spacer(),
        isActive ?
        Container(
          height: 2,
          width: 30,
          decoration: BoxDecoration(
            color: purpleColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(1000),
            ),
          ),
        ) : Container()
      ],
    );
  }
}
