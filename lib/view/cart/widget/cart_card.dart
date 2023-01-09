import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/provider/cart/cartpro.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/login/widget/button_container.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) {
        return Container(
          height: 209,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: kBlack.withOpacity(0.3),
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(
              30,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kWhite,
                      ),
                      height: 100,
                      width: 100,
                      child: Image.network(
                        "http://172.16.1.180:5005/products/${value.cartList?.products[index].product.image[0] ?? 0}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    ksizedBoxW10,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              title: "${value.cartList?.products[index].size}",
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        value.incrementOrDecrementQuantity(
                                          -1,
                                          value.cartList!.products[index]
                                              .product.id,
                                          value.cartList!.products[index].size,
                                          value.cartList!.products[index].qty,
                                        );
                                      },
                                      child: Container(
                                        width: 40.0,
                                        height: 40.0,
                                        margin: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                            color: kIndigo.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(7.0)),
                                        child: const Center(
                                          child: Text(
                                            "-",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
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
                                      textalign: TextAlign.justify,
                                      maxline: 1,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        value.incrementOrDecrementQuantity(
                                          1,
                                          value.cartList!.products[index]
                                              .product.id,
                                          value.cartList!.products[index].size,
                                          value.cartList!.products[index].qty,
                                        );
                                      },
                                      child: Container(
                                        width: 40.0,
                                        height: 40.0,
                                        margin: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                            color: kIndigo.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(7.0)),
                                        child: const Center(
                                          child: Text(
                                            "+",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
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
                                  "₹${(value.cartList?.products[index].price ?? 0) - (value.cartList?.products[index].discountPrice)}",
                              ls: 0,
                              colors: kIndigo,
                              fontwght: FontWeight.bold,
                              fontsz: 17,
                              textalign: TextAlign.justify,
                              maxline: 1,
                            ),
                            ksizedBoxW70,
                            Titlete(
                              title:
                                  "₹${value.cartList?.products[index].price}",
                              ls: 0,
                              colors: Colors.grey,
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
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const TextWithFamily(
                        ws: 0,
                        title: "Are you sure?",
                        ls: 0,
                        colors: kBlack,
                        fontwght: FontWeight.bold,
                        fontsz: 17,
                        textalign: TextAlign.justify,
                        maxline: 1,
                      ),
                      content: const TextWithFamily(
                        ws: 0,
                        title: "Do you want to remove the item from the Cart?",
                        ls: 0,
                        colors: kIndigo,
                        fontwght: FontWeight.bold,
                        fontsz: 17,
                        textalign: TextAlign.justify,
                        maxline: 2,
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('No'),
                          onPressed: () {
                            Navigator.of(ctx).pop(false);
                          },
                        ),
                        TextButton(
                          child: const Text('Yes'),
                          onPressed: () {
                            value.removeFromCart(
                                value.cartList!.products[index].product.id);
                            Navigator.of(ctx).pop(true);
                          },
                        ),
                      ],
                    ),
                  );
                },
                child: const ButtonContainer(
                  kWidth: double.infinity,
                  kHeight: 50,
                  kColors: kBlack,
                  colors: kWhite,
                  title: "Delete",
                  ls: 0,
                  fontwght: FontWeight.bold,
                  fontsz: 16,
                  textalign: TextAlign.center,
                  bRadius: 30,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
