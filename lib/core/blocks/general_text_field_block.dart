import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralTextFieldBlock extends StatelessWidget {
  final String hint;

  final TextEditingController controller;
  final Color? hintColor;
  GeneralTextFieldBlock(
      {required this.hint, required this.controller, this.hintColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.r)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.r)),
              borderSide: BorderSide.none,
            ),
            label: Text(
              hint,
              style: TextStyle(color: hintColor),
            ),
            labelStyle: const TextStyle(color: Colors.blueAccent),
            hintStyle: TextStyle(color: Colors.black87, fontSize: 20.sp)),
      ),
    );
  }
}
