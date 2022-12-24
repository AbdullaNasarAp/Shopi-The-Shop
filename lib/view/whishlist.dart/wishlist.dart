import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class WishList extends StatelessWidget {
  static const wRishlist = "/wishlist";
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: kBlack,
          backgroundColor: kWhite,
          leading: IconButton(
              splashRadius: 25,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 30,
              )),
          centerTitle: true,
          title: const TextWithFamily(
            title: "Your Wishlist",
            ls: 0,
            colors: kBlack,
            fontwght: FontWeight.bold,
            fontsz: 25,
            textalign: TextAlign.center,
            maxline: 1,
            ws: 0,
          ),
        ),
        body: const WishListItem());
  }
}

class WishListItem extends StatelessWidget {
  const WishListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.red[50],
              border: Border.all(
                color: kBlack,
                width: 1,
                strokeAlign: StrokeAlign.center,
              ),
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amber,
                    ),
                    width: 100,
                    height: 100,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TextTitle(
                        title: "Nike Air Zoom Pegasus",
                        ls: 0,
                        colors: kIndigo,
                        fontwght: FontWeight.bold,
                        fontsz: 17,
                        textalign: TextAlign.justify,
                        maxline: 1,
                      ),
                      TextTitle(
                        title: "\$299",
                        ls: 0,
                        colors: kIndigo,
                        fontwght: FontWeight.bold,
                        fontsz: 19,
                        textalign: TextAlign.justify,
                        maxline: 1,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.heart,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return ksizedBox10;
      },
    );
  }
}
