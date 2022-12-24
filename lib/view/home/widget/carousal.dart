import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/provider/homepro/carousalpro.dart';
import 'package:shopi/utils/utils.dart';

class CarouselSliders extends StatelessWidget {
  const CarouselSliders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CarousalProvider>(
      builder: (context, value, child) {
        return value.carousalList.isEmpty
            ? Center(
                child: LoadingAnimationWidget.flickr(
                  leftDotColor: kBlack,
                  rightDotColor: Colors.grey,
                  size: 50,
                ),
              )
            : CarouselSlider.builder(
                itemCount: value.carousalList.length,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    width: double.infinity,
                    height: 150,
                    decoration: const BoxDecoration(
                      color: kBlue,
                    ),
                    child: Image.network(
                      'http://172.16.1.180:5005/carousals/${value.carousalList[index].carousal}',
                      fit: BoxFit.fill,
                    ),
                  );
                },
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 10 / 4,
                  viewportFraction: 1,
                ));
      },
    );
  }
}
