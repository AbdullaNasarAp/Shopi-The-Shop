import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/constant/utils.dart';
import 'package:shopi/controller/provider/splashnav.dart';
import 'package:shopi/view/splash1/widget/texttile.dart';
import 'package:shopi/view/splash2/splash2.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SplashPro>(context, listen: false).navigatorSplash(context);
    });
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Column(
                children: [
                  Hero(
                    tag: "logo",
                    child: Image.asset(
                      'assets/images/Fast Cart.png',
                      height: 200,
                    ),
                  ),
                  const TextTitle(
                    title: "Shopi.",
                    ls: -3,
                    colors: kBlack,
                    fontwght: FontWeight.bold,
                    fontsz: 70,
                  ),
                  const TextTitle(
                    title: "Modern Basics. Radical Transparency",
                    ls: 0,
                    colors: kBlack,
                    fontwght: FontWeight.w400,
                    fontsz: 15,
                  ),
                ],
              ),
            ),
            LoadingAnimationWidget.flickr(
                leftDotColor: kBlack, rightDotColor: Colors.grey, size: 50),
          ],
        ),
      ),
    );
  }

  Future<void> gotologin(BuildContext ctx) async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    Navigator.of(ctx).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => const SplashScreen2(),
      ),
    );
  }
}
