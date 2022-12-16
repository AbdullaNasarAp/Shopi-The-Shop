import 'package:flutter/material.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class ButtonImage extends StatelessWidget {
  const ButtonImage({
    super.key,
    required this.image,
    required this.title,
    required this.ls,
    required this.colors,
    required this.fontwght,
    required this.fontsz,
    required this.textAlign,
  });
  final String image;
  final String title;
  final double ls;
  final Color colors;
  final FontWeight fontwght;
  final double fontsz;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      elevation: 20,
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kWhite,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 60,
                height: 60,
              ),
              TextTitle(
                title: title,
                ls: ls,
                colors: colors,
                fontwght: fontwght,
                fontsz: fontsz,
                textalign: textAlign,
              )
            ],
          ),
        ),
      ),
    );
  }
}
