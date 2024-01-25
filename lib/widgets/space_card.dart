import 'package:cozy/models/space.dart';
import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';

class SpaceCard extends StatelessWidget {
  final Space space;

  SpaceCard(this.space);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 329,
          height: 110,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [

                    Image.asset(
                      space.imageUrl,
                      width: 130,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                                        Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                          color: purpleColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/icon_star.png',
                              height: 18,
                              width: 18,
                            ),
                            Text(
                              '${space.rating}/5',
                              style: whiteTextStyle.copyWith(fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    space.name,
                    style: blackTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '\$${space.price}',
                          style: purpleTextStyle.copyWith(fontSize: 16),
                        ),
                        TextSpan(
                          text: ' / month',
                          style: greyLightTextStyle.copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    '${space.city}, ${space.country}',
                    style: greyLightTextStyle.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          
        ),
        SizedBox(height: 30,),
      ],
    );
  }
}
