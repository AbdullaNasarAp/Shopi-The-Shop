import 'package:flutter/cupertino.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({
    super.key,
    required this.kWidth,
    required this.kHeight,
    required this.kColors,
    required this.colors,
    required this.title,
    required this.ls,
    required this.fontwght,
    required this.fontsz,
    required this.textalign,
    required this.bRadius,
  });
  final double kWidth;
  final double kHeight;
  final Color kColors;
  final Color colors;
  final String title;
  final double ls;
  final FontWeight fontwght;
  final double fontsz;
  final TextAlign textalign;
  final double bRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kWidth,
      height: kHeight,
      decoration: BoxDecoration(
        color: kColors,
        borderRadius: BorderRadius.circular(
          bRadius,
        ),
      ),
      child: Center(
        child: TextTitle(
          textalign: textalign,
          title: title,
          ls: ls,
          colors: colors,
          fontwght: fontwght,
          fontsz: fontsz,
          maxline: 1,
        ),
      ),
    );
  }
}
