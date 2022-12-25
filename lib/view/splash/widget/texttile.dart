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
    required this.maxline,
  }) : super(key: key);
  final String title;
  final double ls;
  final Color colors;
  final FontWeight fontwght;
  final double fontsz;
  final TextAlign textalign;
  final int maxline;
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
      maxLines: maxline,
    );
  }
}

class TextWithFamily extends StatelessWidget {
  const TextWithFamily({
    Key? key,
    required this.title,
    required this.ls,
    required this.colors,
    required this.fontwght,
    required this.fontsz,
    required this.textalign,
    required this.maxline,
    required this.ws,
  }) : super(key: key);
  final String title;
  final double ls;
  final Color colors;
  final FontWeight fontwght;
  final double fontsz;
  final TextAlign textalign;
  final int maxline;
  final double ws;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          letterSpacing: ls,
          fontFamily: Theme.of(context).textTheme.subtitle1?.fontFamily,
          color: colors,
          fontSize: fontsz,
          fontWeight: fontwght,
          wordSpacing: ws),
      textAlign: textalign,
      maxLines: maxline,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class Titlete extends StatelessWidget {
  const Titlete({
    Key? key,
    required this.title,
    required this.ls,
    required this.colors,
    required this.fontwght,
    required this.fontsz,
    required this.textalign,
    required this.maxline,
  }) : super(key: key);
  final String title;
  final double ls;
  final Color colors;
  final FontWeight fontwght;
  final double fontsz;
  final TextAlign textalign;
  final int maxline;
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
        decoration: TextDecoration.lineThrough,
      ),
      textAlign: textalign,
      maxLines: maxline,
    );
  }
}

// class FixedAmount extends StatelessWidget {
//   const FixedAmount({
//     Key? key,
//     required this.title,
//     required this.ls,
//     required this.colors,
//     required this.fontwght,
//     required this.fontsz,
//     required this.textalign,
//     required this.maxline,
//   }) : super(key: key);
//   final String title;
//   final double ls;
//   final Color colors;
//   final FontWeight fontwght;
//   final double fontsz;
//   final TextAlign textalign;
//   final int maxline;
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       title,
      
//       style: TextStyle(
//         letterSpacing: ls,
//         fontFamily: Theme.of(context).textTheme.headline1?.fontFamily,
//         color: colors,
//         fontSize: fontsz,
//         fontWeight: fontwght,
//         decoration: TextDecoration.lineThrough,
//       ),
//       textAlign: textalign,
//       maxLines: maxline,
//     );
//   }
// }
