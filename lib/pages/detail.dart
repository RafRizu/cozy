import 'package:cozy/models/space.dart';
import 'package:cozy/pages/error.dart';
import 'package:cozy/pages/splash_page.dart';
import 'package:cozy/theme.dart';
import 'package:cozy/widgets/facilities.dart';
import 'package:cozy/widgets/photo_item.dart';
import 'package:cozy/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Space space;

  DetailPage(this.space);

  @override
  Widget build(BuildContext context) {
    final RegExp urlRegExp = RegExp(
      r'^(http|https):\/\/([A-Za-z0-9\-]+\.?)+([A-Za-z0-9]+:[0-9]+)?([\/\?].*)?$',
    );
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              '${space.imageUrl}',
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: edge, vertical: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       InkWell(
            //         onTap: () {
            //           Navigator.pop(context);
            //         },
            //         child: Image.asset(
            //           'assets/images/btn_back.png',
            //           width: 40,
            //           height: 40,
            //         ),
            //       ),
            //       Image.asset(
            //         'assets/images/btn_wishlist.png',
            //         width: 40,
            //         height: 40,
            //       ),
            //     ],
            //   ),
            // ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  //Note : Title
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${space.name}',
                                  style: blackTextStyle.copyWith(fontSize: 22),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '\$${space.price}',
                                        style: purpleTextStyle.copyWith(
                                            fontSize: 16),
                                      ),
                                      TextSpan(
                                        text: ' / month',
                                        style: greyLightTextStyle.copyWith(
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [1, 2, 3, 4, 5].map((index) {
                                return Container(
                                  child: RatingItem(
                                    index: index,
                                    rating:
                                        space.rating ?? 0, // handle null rating
                                  ),
                                );
                              }).toList(),
                            )

                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Main Facilities',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FacilitiesCard(
                            name: 'kitchen',
                            total: space.numOfKitchens,
                            imageUrl: 'assets/images/icon_kitchen.png',
                          ),
                          FacilitiesCard(
                            name: 'bedroom',
                            total: space.numOfBedrooms,
                            imageUrl: 'assets/images/icon_bedroom.png',
                          ),
                          FacilitiesCard(
                            name: 'big lemari',
                            total: space.numOfCupboards,
                            imageUrl: 'assets/images/icon_cupboard.png',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Photo',
                              style: blackTextStyle.copyWith(fontSize: 16),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              // margin: EdgeInsets.symmetric(horizontal: edge),
                              height: 88,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: space.photos?.map((item) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              item,
                                              width: 110,
                                              height: 88,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      })?.toList() ??
                                      []

                                  // [
                                  //   PhotoItem(
                                  //       imageUrl: 'assets/images/photo1.png'),
                                  //   PhotoItem(
                                  //       imageUrl: 'assets/images/photo2.png'),
                                  //   PhotoItem(
                                  //       imageUrl: 'assets/images/photo3.png'),
                                  // ],
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      //Locate::Note

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Location',
                                  style: blackTextStyle.copyWith(fontSize: 16),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  '${space.address} \n${space.city}',
                                  style: greyLightTextStyle,
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                _launchInBrowser(
                                  Uri.parse(
                                      // 'https://pub.dev/packages/url_launcher/example'
                                      '${space.mapUrl}'),
                                  context,
                                  urlRegExp,
                                );
                              },
                              child: Image.asset(
                                'assets/images/btn_map.png',
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: edge),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(17))),
                        child: ElevatedButton(
                          onPressed: () {
                            _makePhoneCall('${space.phone}');
                          },
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle.copyWith(fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  ),

                  //NOTE : area top
                ),
              ],
            ),
            //NOTE : Facilities
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/btn_back.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Image.asset(
                    'assets/images/btn_wishlist.png',
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchInBrowser(
    Uri url, BuildContext context, RegExp urlReg) async {
  if (!urlReg.hasMatch(url.toString())) {
    // If URL does not match the regex pattern, navigate to SplashPage
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ErrorPage(),
      ),
    );
    return;
  }

  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    // If launching the URL fails, navigate to ErrorPage
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ErrorPage(),
      ),
    );
  }
}

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

Future<void> _launchInBrowserNah(
    Uri url, BuildContext context, RegExp urlReg) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SplashPage(),
      ),
    );
  }
}
