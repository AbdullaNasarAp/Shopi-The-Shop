import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shopi/controller/constant/utils.dart';
import 'package:shopi/view/lest_start/widget/button_container.dart';
import 'package:shopi/view/splash1/widget/texttile.dart';

class LetsStart extends StatelessWidget {
  const LetsStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    log("getstart");
                  },
                  child: const Card(
                    elevation: 20,
                    child: ButtonContainer(
                      kWidth: double.infinity,
                      kHeight: 50,
                      kColors: kBlack,
                      colors: kWhite,
                      title: "Get Start",
                      ls: 0,
                      fontwght: FontWeight.w300,
                      fontsz: 20,
                    ),
                  ),
                ),
                ksizedBox50,
                InkWell(
                  onTap: () {
                    log("getstart");
                  },
                  child: const Card(
                    elevation: 20,
                    child: ButtonContainer(
                      kWidth: double.infinity,
                      kHeight: 50,
                      kColors: kWhite,
                      colors: kBlack,
                      title: "Login",
                      ls: 0,
                      fontwght: FontWeight.w300,
                      fontsz: 20,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
