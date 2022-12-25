import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/provider/homepro/productpro.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/productdetail/productdetail.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class Categorys extends StatelessWidget {
  static const catRoute = "/category";
  const Categorys({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments as String;
    final productCategory = Provider.of<ProductProvider>(context, listen: false)
        .findByCategory(arg);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Consumer<ProductProvider>(
            builder: (context, value, child) {
              return productCategory.isEmpty
                  ? Center(
                      child: LoadingAnimationWidget.flickr(
                        leftDotColor: kBlack,
                        rightDotColor: Colors.grey,
                        size: 50,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 190,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                mainAxisExtent: 250,
                                childAspectRatio: 1 / 2),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              ProductDetail.routeName,
                              arguments: productCategory[index].id,
                            );
                          },
                          child: Container(
                            width: 140,
                            height: 150,
                            decoration: BoxDecoration(
                              color: kWhite,
                              border: Border.all(
                                color: Colors.grey.shade100,
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
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color: Colors.red[50],
                                      child: Image.network(
                                        "http://172.16.1.180:5005/products/${productCategory[index].image[index]}",
                                        width: 120,
                                        height: 120,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWithFamily(
                                        title: productCategory[index].name,
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
                                              "₹ ${productCategory[index].discountPrice}"
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
                                                " ₹ ${productCategory[index].price}"
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
                                                    "${productCategory[index].offer}%"
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
                        itemCount: productCategory.length,
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
