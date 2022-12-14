import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/constant/utils.dart';
import 'package:shopi/controller/provider/splashnav.dart';
import 'package:shopi/view/splash1/widget/texttile.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SplashPro>(context, listen: false).navigatorSplash1(context);
    });
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/Group 543.png",
            width: double.infinity,
            height: 450,
            fit: BoxFit.cover,
          ),
          ksizedBox20,
          Padding(
            padding: EdgeInsets.all(deviceSize.width * 0.025),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextTitle(
                  title: "Welcome to ✋.",
                  ls: 0,
                  colors: kBlack,
                  fontwght: FontWeight.bold,
                  fontsz: 40,
                ),
                Row(
                  children: [
                    Hero(
                      tag: "logo",
                      child: Image.asset(
                        "assets/images/Fast Cart.png",
                        width: 60,
                        height: 60,
                      ),
                    ),
                    ksizedBoxW20,
                    const TextTitle(
                      title: "Shopi.",
                      ls: -3,
                      colors: kBlack,
                      fontwght: FontWeight.bold,
                      fontsz: 40,
                    ),
                  ],
                ),
                ksizedBox50,
                const TextTitle(
                  title: "Let's Start ....",
                  ls: 0,
                  colors: kBlack,
                  fontwght: FontWeight.bold,
                  fontsz: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
