import 'package:flutter/material.dart';
import 'package:shopi/constant/static_cosnt.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class CartScreen extends StatelessWidget {
  static const cartRoute = "/cart";
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return ksizedBox10;
                    },
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const CartTitle();
                    },
                  ),
                )
              ],
            ),
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

class CartTitle extends StatelessWidget {
  const CartTitle({super.key});

  @override
  Widget build(BuildContext context) {
    // return Dismissible(
    //   key: ValueKey(jkdfkj),
    //   background: Container(
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(20),
    //       color: Theme.of(context).errorColor,
    //     ),
    //     alignment: Alignment.centerRight,
    //     padding: const EdgeInsets.only(right: 20),
    //     margin: const EdgeInsets.symmetric(
    //       horizontal: 15,
    //       vertical: 4,
    //     ),
    //     child: const Icon(
    //       Icons.delete,
    //       color: Colors.white,
    //       size: 40,
    //     ),
    //   ),
    //   child:
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
                  height: 140,
                  width: 120,
                  child: Image.asset(image1[0]),
                ),
                ksizedBoxW10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const TextTitle(
                      title: "Nike Air Zoom Pegasus ",
                      ls: 0,
                      colors: kIndigo,
                      fontwght: FontWeight.bold,
                      fontsz: 15,
                      textalign: TextAlign.justify,
                      maxline: 2,
                    ),
                    Row(
                      children: [
                        const TextTitle(
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
                                    // setState(() {
                                    //   if (_personCounter > 1) {
                                    //     _personCounter--;
                                    //   } else {}
                                    // });
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
                                const Text(
                                  "1",
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      color: kIndigo,
                                      fontWeight: FontWeight.bold),
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
                      children: const [
                        TextTitle(
                          title: "\$500",
                          ls: 0,
                          colors: kIndigo,
                          fontwght: FontWeight.bold,
                          fontsz: 20,
                          textalign: TextAlign.justify,
                          maxline: 1,
                        )
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
  }
}
