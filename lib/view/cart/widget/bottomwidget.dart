import 'package:flutter/material.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class CartBottomWidget extends StatelessWidget {
  const CartBottomWidget({
    Key? key,
    required this.title,
    required this.sub,
  }) : super(key: key);
  final String title;
  final String sub;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWithFamily(
          title: title,
          ls: 0,
          colors: kIndigo,
          fontwght: FontWeight.bold,
          fontsz: 17,
          textalign: TextAlign.start,
          maxline: 1,
          ws: 0,
        ),
        TextWithFamily(
          title: sub,
          ls: 0,
          colors: Colors.grey,
          fontwght: FontWeight.bold,
          fontsz: 15,
          textalign: TextAlign.start,
          maxline: 1,
          ws: 0,
        ),
      ],
    );
  }
}
