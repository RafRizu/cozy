import 'package:cozy/models/city.dart';
import 'package:cozy/models/space.dart';
import 'package:cozy/models/tips.dart';
import 'package:cozy/provider/space_provider.dart';

import 'package:cozy/theme.dart';
import 'package:cozy/widgets/bottom_nav_item.dart';
import 'package:cozy/widgets/city_card.dart';
import 'package:cozy/widgets/guide_card.dart';
import 'package:cozy/widgets/space_card.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);
    spaceProvider.getRecomendedSpace();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: edge),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Mencari kosan yang cozy',
                style: greyLightTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Popular Cities',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            // Text('data')
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'assets/images/city1.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 2,
                      name: 'Bandung',
                      imageUrl: 'assets/images/city2.png',
                      isPopular: true,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 3,
                      name: 'Surabaya',
                      imageUrl: 'assets/images/city3.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 3,
                      name: 'Palembang',
                      imageUrl: 'assets/images/city4.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                        id: 3,
                        name: 'Aceh',
                        imageUrl: 'assets/images/city5.png',
                        isPopular: true),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                      id: 3,
                      name: 'Bogor',
                      imageUrl: 'assets/images/city6.png',
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recomended Space',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.only(left: 0),
              child: Container(
                width: 329,
                child: FutureBuilder(
                    future: spaceProvider.getRecomendedSpace(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data! as List<Space>;

                        return Column(
                            children: 
                          data.map((item) => SpaceCard(item)).toList()
                        );
                                // data.map((item) => SpaceCard(item)).toList());
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  )

              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tips & Guidelines',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Container(
                width: 321,
                child: Column(
                  children: [
                    GuideCard(
                      Tips(
                        id: 1,
                        name: 'City Guidelines',
                        updatedAt: '20 Apr',
                        imageUrl: 'assets/images/tips1.png',
                      ),
                    ),
                    GuideCard(
                      Tips(
                        id: 2,
                        name: 'Jakarta Fairship',
                        updatedAt: '11 Dec',
                        imageUrl: 'assets/images/tips2.png',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50 + edge,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
          color: Color(0xFFF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavItem(
              index: 1,
              imageUrl: 'assets/images/icon_home.png',
              isActive: true,
            ),
            BottomNavItem(
              index: 2,
              imageUrl: 'assets/images/icon_email.png',
              isActive: false,
            ),
            BottomNavItem(
              index: 3,
              imageUrl: 'assets/images/icon_card.png',
              isActive: false,
            ),
            BottomNavItem(
              index: 4,
              imageUrl: 'assets/images/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
