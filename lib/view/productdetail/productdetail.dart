import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/provider/homepro/productpro.dart';
import 'package:shopi/controller/provider/wishlist.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/login/widget/button_container.dart';
import 'package:shopi/view/productdetail/widget/recommended.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = "/productdetail";
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct = Provider.of<ProductProvider>(context, listen: false)
        .findById(productId);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[100],
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              FontAwesomeIcons.arrowLeft,
              color: kBlack,
            ),
          ),
          actions: [
            Consumer2<WishlistProvider, ProductProvider>(
              builder: (context, value, value2, child) {
                final product = value2.product;
                return GestureDetector(
                  onTap: () => value.addRemoveWishlistItem(loadedProduct.id),
                  child: Icon(
                    value.favorProduct.contains(loadedProduct.id)
                        ? Icons.favorite
                        : Icons.favorite_outline_outlined,
                    color: value.favorProduct.contains(loadedProduct.id)
                        ? AppColors.redColor
                        : AppColors.blackcolor,
                    size: 35,
                  ),
                );
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 450,
                decoration: BoxDecoration(
                  color: Colors.red[100],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Consumer<ProductProvider>(
                      builder: (context, value, child) {
                        return Image.network(
                          "http://172.16.1.180:5005/products/${loadedProduct.image[value.selectedImage]}",
                          width: 230,
                          height: 240,
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    ksizedBox50,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          growable: true,
                          loadedProduct.image.length,
                          (index) => Consumer<ProductProvider>(
                            builder: (context, value, child) {
                              return smallPreview(
                                index,
                                "http://172.16.1.180:5005/products/${loadedProduct.image[index]}",
                                () {
                                  value.tapTap(index);
                                },
                              );
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWithFamily(
                        title: loadedProduct.name,
                        ls: 0,
                        colors: kIndigo,
                        fontwght: FontWeight.w400,
                        fontsz: 17,
                        textalign: TextAlign.start,
                        maxline: 1,
                        ws: 0),
                    ksizedBox20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextWithFamily(
                                title: "${loadedProduct.offer}% OFF",
                                ls: 0,
                                colors: errorColor,
                                fontwght: FontWeight.w400,
                                fontsz: 22,
                                textalign: TextAlign.justify,
                                maxline: 1,
                                ws: 0,
                              ),
                            ),
                            TextWithFamily(
                              title:
                                  "₹ ${loadedProduct.discountPrice.toStringAsFixed(1)}",
                              ls: 0,
                              colors: kIndigo,
                              fontwght: FontWeight.w400,
                              fontsz: 22,
                              textalign: TextAlign.justify,
                              maxline: 1,
                              ws: 0,
                            ),
                          ],
                        ),
                        ksizedBox10,
                        Titlete(
                          title: "₹ ${loadedProduct.price}",
                          ls: 0,
                          colors: kIndigo.withOpacity(0.8),
                          fontwght: FontWeight.bold,
                          fontsz: 22,
                          textalign: TextAlign.justify,
                          maxline: 1,
                        ),
                      ],
                    ),
                    ksizedBox20,
                    const TextWithFamily(
                      title: "Select Your Size",
                      ls: 0,
                      colors: kIndigo,
                      fontwght: FontWeight.w400,
                      fontsz: 16,
                      textalign: TextAlign.start,
                      maxline: 2,
                      ws: 0,
                    ),
                    ksizedBox20,
                    Row(
                      children: [
                        ...List.generate(
                          loadedProduct.size.length,
                          (index) {
                            return Row(
                              children: [
                                ksizedBoxW10,
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.red[100],
                                  child: TextWithFamily(
                                    title: loadedProduct.size[index],
                                    ls: 0,
                                    colors: kIndigo,
                                    fontwght: FontWeight.w400,
                                    fontsz: 16,
                                    textalign: TextAlign.start,
                                    maxline: 2,
                                    ws: 0,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                    ksizedBox20,
                    Row(children: [
                      const TextWithFamily(
                        title: "Rating",
                        ls: 0,
                        colors: kIndigo,
                        fontwght: FontWeight.w500,
                        fontsz: 17,
                        textalign: TextAlign.justify,
                        maxline: 1,
                        ws: 0,
                      ),
                      ksizedBoxW20,
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.red[100],
                            borderRadius: BorderRadius.circular(30)),
                        child: SizedBox(
                          height: 40,
                          width: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              TextTitle(
                                  title: loadedProduct.rating,
                                  ls: 0,
                                  colors: kIndigo,
                                  fontwght: FontWeight.w300,
                                  fontsz: 16,
                                  textalign: TextAlign.center,
                                  maxline: 1)
                            ],
                          ),
                        ),
                      )
                    ]),
                    ksizedBox20,
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            log("message");
                          },
                          child: ButtonContainer(
                            kWidth: MediaQuery.of(context).size.width * .45,
                            kHeight: 50,
                            kColors: kBlack,
                            colors: kWhite,
                            title: "Buy Now",
                            ls: 0,
                            fontwght: FontWeight.bold,
                            fontsz: 20,
                            textalign: TextAlign.center,
                            bRadius: 20,
                          ),
                        ),
                        ksizedBoxW10,
                        InkWell(
                          onTap: () {
                            log("message");
                          },
                          child: ButtonContainer(
                            kWidth: MediaQuery.of(context).size.width * .45,
                            kHeight: 50,
                            kColors: kBlack,
                            colors: kWhite,
                            title: "Add to cart",
                            ls: 0,
                            fontwght: FontWeight.bold,
                            fontsz: 20,
                            textalign: TextAlign.center,
                            bRadius: 20,
                          ),
                        ),
                      ],
                    ),
                    ksizedBox50,
                    const TextTitle(
                        title: "Recommended",
                        ls: 0,
                        colors: kBlack,
                        fontwght: FontWeight.bold,
                        fontsz: 20,
                        textalign: TextAlign.justify,
                        maxline: 1),
                    Recommended()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget smallPreview(int index, String image2, VoidCallback ontap) {
    return Consumer<ProductProvider>(builder: (context, value, child) {
      return GestureDetector(
        onTap: ontap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 2000),
          margin: const EdgeInsets.only(right: 15),
          padding: const EdgeInsets.all(8),
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: kWhite.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color:
                    kBlack.withOpacity(value.selectedImage == index ? 1 : 0)),
          ),
          child: Image.network(
            image2,
            height: 100,
            width: 100,
            // fit: BoxFit.cover,
          ),
        ),
      );
    });
  }
}
