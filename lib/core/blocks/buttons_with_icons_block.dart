import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prominamce_test/core/constants/color_constants.dart';
import 'package:prominamce_test/core/constants/image_constants.dart';

class ButtonsWithIconsBlock extends StatelessWidget {
  final String lable;
  final String image;
  final int firstColor, secondColor;
  final bool gradientDirection;

  ButtonsWithIconsBlock(
      {required this.lable,
      required this.image,
      required this.firstColor,
      required this.secondColor,
      required this.gradientDirection});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 110.w,
      height: 40.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 25.w,
            height: 25.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                gradient: LinearGradient(
                    begin: gradientDirection
                        ? Alignment.centerLeft
                        : Alignment.bottomCenter,
                    end: gradientDirection
                        ? Alignment.centerRight
                        : Alignment.topCenter,
                    colors: [Color(firstColor), Color(secondColor)]),
                image: DecorationImage(
                    image: Image.asset(
                  image,
                ).image)),
          ),
          Text(
            lable,
            style: TextStyle(color: Colors.black87, fontSize: 16.sp),
          )
        ],
      ),
    );
  }
}
