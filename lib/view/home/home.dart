import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:shopi/constant/apiconst.dart';
import 'package:shopi/constant/static_cosnt.dart';
import 'package:shopi/controller/provider/homepro/category.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/home/widget/applogo.dart';
import 'package:shopi/view/home/widget/badge.dart';
import 'package:shopi/view/home/widget/drawer.dart';
import 'package:shopi/view/splash/widget/texttile.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                const Badge(
                  value: "",
                  color: kBlue,
                  child: Icon(
                    FontAwesomeIcons.cartShopping,
                    size: 30,
                    color: kBlack,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.search,
                    color: kBlack,
                  ),
                ),
              ],
            ),
          ],
        ),
        // actions: [

        // ],
      ),
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
              child: ProductList(),
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
              child: ProductList(),
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
              child: ProductList(),
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
}

class CarouselSliders extends StatelessWidget {
  const CarouselSliders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: banner.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            width: double.infinity,
            height: 150,
            decoration: const BoxDecoration(
              color: kBlue,
            ),
            child: Image.network(
              banner[index],
              fit: BoxFit.cover,
            ),
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 10 / 4,
          viewportFraction: 1,
        ));
  }
}

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
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
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.red[50],
                          child: Image.asset(
                            image1[index] ?? image1.length,
                            width: 120,
                            height: 120,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextWithFamily(
                            title: "Men Shirt Shadow Black ",
                            ls: 0,
                            colors: kIndigo,
                            fontwght: FontWeight.bold,
                            fontsz: 18,
                            textalign: TextAlign.justify,
                            maxline: 1,
                            ws: -1,
                          ),
                          ksizedBox10,
                          const TextTitle(
                              title: "\$200.9",
                              ls: 0,
                              colors: kBlack,
                              fontwght: FontWeight.normal,
                              fontsz: 16,
                              textalign: TextAlign.justify,
                              maxline: 1),
                          ksizedBox10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Titlete(
                                title: "\$599",
                                ls: 0,
                                colors: Colors.grey,
                                fontwght: FontWeight.normal,
                                fontsz: 17,
                                textalign: TextAlign.justify,
                                maxline: 1,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: 8.0, bottom: 10),
                                child: TextTitle(
                                    title: "24%",
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
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: image1.length),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, value, child) {
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => CircleAvatar(
            backgroundImage: NetworkImage(
                'http://172.16.1.104:5005/category/${value.categoryList[index].imagePath}'),
            radius: 40,
            child: TextTitle(
              colors: kWhite,
              fontsz: 20,
              fontwght: FontWeight.w300,
              ls: 0,
              maxline: 1,
              textalign: TextAlign.center,
              title: value.categoryList[index].name,
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
          itemCount: value.categoryList.length,
        );
      },
    );
  }
}
