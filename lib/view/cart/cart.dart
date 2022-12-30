import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/provider/cart/cartpro.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class CartScreen extends StatelessWidget {
  static const cartRoute = "/cart";
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartScreenProvider =
        Provider.of<CartProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cartScreenProvider.getCartItems();
    });
    return Scaffold(
        appBar: appBar(context),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
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
                  itemCount: cartScreenProvider.cartList?.products.length ?? 0,
                  itemBuilder: (context, index) {
                    return Consumer<CartProvider>(
                      builder: (context, value, child) {
                        return Container(
                          height: 160,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: kBlack.withOpacity(0.3),
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            color: Colors.red[50],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: kWhite,
                                      ),
                                      height: 100,
                                      width: 100,
                                      child: Image.network(
                                          "http://172.16.1.180:5005/products/${value.cartList?.products[index].product.image[0] ?? 0}"),
                                    ),
                                    ksizedBoxW10,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextWithFamily(
                                          ws: 0,
                                          title:
                                              "${value.cartList?.products[index].product.name}",
                                          ls: 0,
                                          colors: kIndigo,
                                          fontwght: FontWeight.bold,
                                          fontsz: 15,
                                          textalign: TextAlign.justify,
                                          maxline: 2,
                                        ),
                                        ksizedBox10,
                                        Row(
                                          children: [
                                            const TextWithFamily(
                                              ws: 0,
                                              title: "size ",
                                              ls: 0,
                                              colors: kIndigo,
                                              fontwght: FontWeight.bold,
                                              fontsz: 15,
                                              textalign: TextAlign.justify,
                                              maxline: 2,
                                            ),
                                            ksizedBoxW70,
                                            TextWithFamily(
                                              ws: 0,
                                              title:
                                                  "${value.cartList?.products[index].size}",
                                              ls: 0,
                                              colors: kIndigo,
                                              fontwght: FontWeight.bold,
                                              fontsz: 15,
                                              textalign: TextAlign.justify,
                                              maxline: 2,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const TextWithFamily(
                                              ws: 0,
                                              title: "Quantity ",
                                              ls: 0,
                                              colors: kIndigo,
                                              fontwght: FontWeight.bold,
                                              fontsz: 15,
                                              textalign: TextAlign.justify,
                                              maxline: 2,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        // setState(() {
                                                        //   if (_personCounter > 1) {
                                                        //     _personCounter--;
                                                        //   } else {}
                                                        // });
                                                      },
                                                      child: Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        margin: const EdgeInsets
                                                            .all(10.0),
                                                        decoration: BoxDecoration(
                                                            color: kIndigo
                                                                .withOpacity(
                                                                    0.1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7.0)),
                                                        child: const Center(
                                                          child: Text(
                                                            "-",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 17.0,
                                                                color: kIndigo),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    TextWithFamily(
                                                      ws: 0,
                                                      title:
                                                          "${value.cartList?.products[index].qty}",
                                                      ls: 0,
                                                      colors: kIndigo,
                                                      fontwght: FontWeight.bold,
                                                      fontsz: 17,
                                                      textalign:
                                                          TextAlign.justify,
                                                      maxline: 1,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        // setState(() {
                                                        //   _personCounter++;
                                                        // });
                                                      },
                                                      child: Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        margin: const EdgeInsets
                                                            .all(10.0),
                                                        decoration: BoxDecoration(
                                                            color: kIndigo
                                                                .withOpacity(
                                                                    0.1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7.0)),
                                                        child: const Center(
                                                          child: Text(
                                                            "+",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 17.0,
                                                                color: kIndigo),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            TextWithFamily(
                                              ws: 0,
                                              title:
                                                  "₹${value.cartList?.products[index].discountPrice}",
                                              ls: 0,
                                              colors: kIndigo,
                                              fontwght: FontWeight.bold,
                                              fontsz: 17,
                                              textalign: TextAlign.justify,
                                              maxline: 1,
                                            ),
                                            ksizedBoxW70,
                                            TextWithFamily(
                                              ws: 0,
                                              title:
                                                  "₹${value.cartList?.products[index].price}",
                                              ls: 0,
                                              colors: kIndigo,
                                              fontwght: FontWeight.bold,
                                              fontsz: 17,
                                              textalign: TextAlign.justify,
                                              maxline: 1,
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ));
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
