import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({
    Key? key,
    required this.title,
    required this.ls,
    required this.colors,
    required this.fontwght,
    required this.fontsz,
    required this.textalign,
  }) : super(key: key);
  final String title;
  final double ls;
  final Color colors;
  final FontWeight fontwght;
  final double fontsz;
  final TextAlign textalign;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        letterSpacing: ls,
        fontFamily: Theme.of(context).textTheme.headline1?.fontFamily,
        color: colors,
        fontSize: fontsz,
        fontWeight: fontwght,
      ),
      textAlign: textalign,
    );
  }
}
