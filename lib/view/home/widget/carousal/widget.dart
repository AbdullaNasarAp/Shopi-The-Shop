import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopi/utils/utils.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget.circular({super.key, required this.radius});
  const LoadingWidget.rectangular({super.key, required this.radius});
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: kGrey,
        highlightColor: kGrey.shade200,
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
            radius,
          )),
        ));
  }
}
