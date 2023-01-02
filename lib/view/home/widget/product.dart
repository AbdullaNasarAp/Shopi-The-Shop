import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/provider/homepro/productpro.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/productdetail/productdetail.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
    required this.rev,
  }) : super(key: key);
  final bool rev;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Consumer<ProductProvider>(
        builder: (context, value, child) {
          return value.productList.isEmpty
              ? Center(
                  child: LoadingAnimationWidget.flickr(
                    leftDotColor: kBlack,
                    rightDotColor: Colors.grey,
                    size: 50,
                  ),
                )
              : ListView.separated(
                  reverse: rev,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        ProductDetail.routeName,
                        arguments: value.productList[index].id,
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade200,
                          style: BorderStyle.solid,
                          strokeAlign: StrokeAlign.inside,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: Colors.red[50],
                                child: Image.network(
                                  "http://172.16.1.180:5005/products/${value.productList[index].image[0]}",
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWithFamily(
                                  title: value.productList[index].name,
                                  ls: 0,
                                  colors: kIndigo,
                                  fontwght: FontWeight.bold,
                                  fontsz: 18,
                                  textalign: TextAlign.justify,
                                  maxline: 1,
                                  ws: -1,
                                ),
                                ksizedBox10,
                                TextTitle(
                                    title:
                                        "₹ ${value.productList[index].discountPrice.toStringAsFixed(1)}"
                                            .toString(),
                                    ls: 0,
                                    colors: kBlack,
                                    fontwght: FontWeight.normal,
                                    fontsz: 16,
                                    textalign: TextAlign.justify,
                                    maxline: 1),
                                ksizedBox10,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Titlete(
                                      title:
                                          " ₹ ${value.productList[index].price}"
                                              .toString(),
                                      ls: 0,
                                      colors: Colors.grey,
                                      fontwght: FontWeight.normal,
                                      fontsz: 17,
                                      textalign: TextAlign.justify,
                                      maxline: 1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8.0, bottom: 10),
                                      child: TextTitle(
                                          title:
                                              "${value.productList[index].offer}%"
                                                  .toString(),
                                          ls: 0,
                                          colors: errorColor,
                                          fontwght: FontWeight.normal,
                                          fontsz: 17,
                                          textalign: TextAlign.justify,
                                          maxline: 1),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  itemCount: value.productList.length,
                );
        },
      ),
    );
  }
}
