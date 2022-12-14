import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/constant/utils.dart';
import 'package:shopi/controller/provider/splashnav.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<SplashPro>(context, listen: false)
            .navigatorSplash1(context);
      },
    );
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
                    textalign: TextAlign.center,
                    title: "Shopi.",
                    ls: -3,
                    colors: kBlack,
                    fontwght: FontWeight.bold,
                    fontsz: 70,
                  ),
                  const TextTitle(
                    textalign: TextAlign.center,
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
              leftDotColor: kBlack,
              rightDotColor: Colors.grey,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
