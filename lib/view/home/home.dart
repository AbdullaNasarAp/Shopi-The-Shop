import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/cart/cart.dart';
import 'package:shopi/view/home/widget/applogo.dart';
import 'package:shopi/view/home/widget/badge.dart';
import 'package:shopi/view/home/widget/category.dart';
import 'package:shopi/view/home/widget/drawer.dart';
import 'package:shopi/view/home/widget/carousal/carousal.dart';
import 'package:shopi/view/home/widget/product.dart';
import 'package:shopi/view/splash/widget/texttile.dart';
import 'package:shopi/view/whishlist.dart/wishlist.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeBar(context),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: TextWithFamily(
                  title: "Category",
                  ls: 0,
                  colors: kBlack,
                  fontwght: FontWeight.bold,
                  fontsz: 20,
                  textalign: TextAlign.start,
                  ws: 0,
                  maxline: 1),
            ),
            SizedBox(
              height: 100,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: CategoriesWidget(),
              ),
            ),
            ksizedBox20,
            Padding(
              padding: EdgeInsets.only(
                left: 8.0,
              ),
              child: TextWithFamily(
                  title: "New & Hot",
                  ls: 0,
                  colors: kBlack,
                  fontwght: FontWeight.bold,
                  fontsz: 20,
                  textalign: TextAlign.start,
                  ws: 0,
                  maxline: 1),
            ),
            ksizedBox10,
            SizedBox(
              height: 250,
              child: ProductList(rev: false),
            ),
            ksizedBox50,
            CarouselSliders(),
            ksizedBox50,
            Padding(
              padding: EdgeInsets.only(
                left: 8.0,
              ),
              child: TextWithFamily(
                  title: "Under \$1999",
                  ls: 0,
                  colors: kBlack,
                  fontwght: FontWeight.bold,
                  fontsz: 20,
                  textalign: TextAlign.start,
                  ws: 0,
                  maxline: 1),
            ),
            ksizedBox10,
            SizedBox(
              height: 250,
              child: ProductList(rev: true),
            ),
            ksizedBox50,
            CarouselSliders(),
            ksizedBox50,
            Padding(
              padding: EdgeInsets.only(
                left: 8.0,
              ),
              child: TextWithFamily(
                  title: "Widest Collection",
                  ls: 0,
                  colors: kBlack,
                  fontwght: FontWeight.bold,
                  fontsz: 20,
                  textalign: TextAlign.start,
                  ws: 0,
                  maxline: 1),
            ),
            ksizedBox20,
            SizedBox(
              height: 250,
              child: ProductList(rev: false),
            ),
            ksizedBox50,
            Divider(
              indent: 60,
              endIndent: 60,
              height: 0,
              thickness: 2,
              color: Colors.grey,
            ),
            Text(
              ".",
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar homeBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 70,
      elevation: 0,
      backgroundColor: kWhite,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AppLogo(iFontsize: 25, iHeight: 50, iWidth: 50),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(WishList.wRishlist);
                  },
                  icon: const FaIcon(FontAwesomeIcons.heart)),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(CartScreen.cartRoute);
                },
                child: const Badge(
                  value: "",
                  color: kGrey,
                  child: Icon(
                    FontAwesomeIcons.cartShopping,
                    size: 30,
                    color: kBlack,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      // actions: [

      // ],
    );
  }
}
