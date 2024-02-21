import 'package:cozy/models/tips.dart';
import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';

class GuideCard extends StatelessWidget {
    final Tips tips;

    GuideCard(this.tips);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 320,
          height: 80,
          child: Row(
            children: [
              Image.asset(tips.imageUrl,width: 80,height: 80,),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tips.name,style: blackTextStyle.copyWith(fontSize: 18),),
                  SizedBox(
                    height: 4,
                  ),
                  Text('Updated ${tips.updatedAt}',style: greyLightTextStyle.copyWith(fontSize: 14),),
                ],
              ),
              Spacer(),
              Padding(
                padding:  EdgeInsets.only(right:30.0),
                child: Icon(Icons.chevron_right_outlined),
              ),
            ],
          ),
        ),
      SizedBox(height: 20,),
      ],
    );
  }
}
