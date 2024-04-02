import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoiseBlock extends StatelessWidget {
  final int color;
  final String lable;
  final IconData iconData;

  ChoiseBlock(
      {required this.color, required this.lable, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      height: 60.h,
      decoration: BoxDecoration(
          color: Color(color), borderRadius: BorderRadius.circular(20.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(iconData,
              color: lable == 'Gallery' ? Colors.purple : Colors.blue),
          Text(
            lable,
            style: TextStyle(fontSize: 20.sp),
          ),
        ],
      ),
    );
  }
}
