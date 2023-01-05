import 'package:flutter/material.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class WishTile extends StatelessWidget {
  WishTile({
    super.key,
    required this.image,
    required this.title,
    required this.title1,
    required this.title2,
    required this.ontap,
  });
  final String image;
  final String title;
  final String title1;
  final String title2;
  VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: ListTile(
        onTap: ontap,
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red[50],
          ),
          width: 100,
          height: 200,
          child: Image.network(
            image,
            height: 100,
            width: 100,
          ),
        ),
        title: TextWithFamily(
            title: title,
            ls: 0,
            colors: kIndigo,
            fontwght: FontWeight.w300,
            fontsz: 15,
            textalign: TextAlign.justify,
            maxline: 1,
            ws: 0),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextWithFamily(
                title: title1,
                ls: 0,
                colors: kIndigo,
                fontwght: FontWeight.w300,
                fontsz: 15,
                textalign: TextAlign.justify,
                maxline: 1,
                ws: 0),
            Titlete(
              title: title2,
              ls: 0,
              colors: kGrey,
              fontwght: FontWeight.w300,
              fontsz: 15,
              textalign: TextAlign.justify,
              maxline: 1,
            )
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            TextWithFamily(
                title: "Swipe to delete",
                ls: 0,
                colors: errorColor,
                fontwght: FontWeight.bold,
                fontsz: 15,
                textalign: TextAlign.justify,
                maxline: 1,
                ws: 0)
          ],
        ),
      ),
    );
  }
}
