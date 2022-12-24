import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:shopi/controller/provider/homepro/category.dart';
import 'package:shopi/utils/utils.dart';
import 'package:shopi/view/category/category.dart';
import 'package:shopi/view/splash/widget/texttile.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, value, child) {
        return value.categoryList.isEmpty
            ? Center(
                child: LoadingAnimationWidget.flickr(
                  leftDotColor: kBlack,
                  rightDotColor: Colors.grey,
                  size: 50,
                ),
              )
            : ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(Categorys.catRoute,
                        arguments: value.categoryList[index].id);
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'http://172.16.1.180:5005/category/${value.categoryList[index].imagePath}'),
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
