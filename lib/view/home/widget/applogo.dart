import 'package:flutter/material.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
    required this.iHeight,
    required this.iWidth,
    required this.iFontsize,
  }) : super(key: key);
  final double iHeight;
  final double iWidth;
  final double iFontsize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Image.asset(
            "assets/images/Fast Cart.png",
            height: iHeight,
            width: iWidth,
          ),
        ),
        TextTitle(
          title: "Shopi.",
          ls: -2,
          colors: kBlack,
          fontwght: FontWeight.bold,
          fontsz: iFontsize,
          textalign: TextAlign.center,
          maxline: 1,
        ),
      ],
    );
  }
}
