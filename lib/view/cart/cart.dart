import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/provider/cart/cartpro.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/cart/widget/bottomwidget.dart';
import 'package:shopi/view/cart/widget/cart_card.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class CartScreen extends StatelessWidget {
  static const cartRoute = "/cart";
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<CartProvider>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: value.cartList == null || value.cartList!.products.isEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      width: double.infinity,
                      child: Column(
                        children: const [
                          SizedBox(height: 40),
                          Image(
                              image: AssetImage(
                                  'assets/images/icons8-nothing-found-100.png')),
                          TextWithFamily(
                              title: "Cart is empty",
                              ls: 0,
                              colors: kIndigo,
                              fontwght: FontWeight.w300,
                              fontsz: 15,
                              textalign: TextAlign.justify,
                              maxline: 1,
                              ws: 0),
                        ],
                      ))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 400,
                          width: double.infinity,
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            separatorBuilder: (context, index) {
                              return ksizedBox10;
                            },
                            itemCount: value.cartList?.products.length ?? 0,
                            itemBuilder: (context, index) {
                              return CartCard(
                                index: index,
                              );
                            },
                          ),
                        ),
                        ksizedBox20,
                        CartBottomWidget(
                            title: "Items",
                            sub: "${value.cartList?.products.length}"),
                        ksizedBox10,
                        CartBottomWidget(
                            title: "Total Discount",
                            sub:
                                "${value.cartList?.totalDiscount.toStringAsFixed(1)}"),
                        ksizedBox10,
                        CartBottomWidget(
                            title: "Total Saved",
                            sub:
                                "${value.totalSaved(value.cartList?.totalPrice ?? 0, value.cartList?.totalDiscount ?? 0)}"),
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
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
        title: "Your Cart",
        ls: 0,
        colors: kBlack,
        fontwght: FontWeight.bold,
        fontsz: 25,
        textalign: TextAlign.center,
        maxline: 1,
        ws: 0,
      ),
    );
  }
}
