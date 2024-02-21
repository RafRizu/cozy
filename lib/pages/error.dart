import 'package:cozy/pages/splash_page.dart';
import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/error.png',
                width: 300,
                height: 86,
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                'Where are you going?',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                'Seems like the page that you were \nrequested is already gone',
                style: greyLightTextStyle.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: 210,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(17)),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SplashPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Back to Home',
                      style: whiteTextStyle.copyWith(fontSize: 18),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
