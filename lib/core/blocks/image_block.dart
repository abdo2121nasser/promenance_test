import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prominamce_test/core/constants/image_constants.dart';

class ImageBlock extends StatelessWidget {
  final String image;

  ImageBlock({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          image: DecorationImage(
              image: Image.network(
            image,
            fit: BoxFit.fill,
          ).image)),
    );
  }
}
