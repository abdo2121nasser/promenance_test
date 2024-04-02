import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prominamce_test/core/blocks/general_button_block.dart';
import 'package:prominamce_test/core/blocks/general_text_field_block.dart';
import 'package:prominamce_test/core/cubits/gallery_cubit/gallery_cubit.dart';

import '../../screens/app_screens/gallery_screen.dart';
import '../cubits/authentication_cubit/authentication_cubit.dart';

class LoginBlock extends StatelessWidget {
  const LoginBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => GalleryScreen(),
              ));
        }
        if (state is LoginErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('oops!!!\nsomething went wrong try again')));
        }
      },
      builder: (context, state) {
        var authCubit = AuthenticationCubit.get(context);
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          width: MediaQuery.of(context).size.width,
          height: 320.h,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20.r)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'LOG IN',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold),
              ),
              GeneralTextFieldBlock(
                  hint: 'Email',
                  controller: authCubit.email,
                  hintColor: Colors.grey),
              GeneralTextFieldBlock(
                hint: 'Password',
                controller: authCubit.password,
                hintColor: Colors.grey,
              ),
              state is LoginLoadingState
                  ? const CircularProgressIndicator()
                  : GeneralButtonBlock(
                      lable: 'SUBMIT',
                      function: () {
                        authCubit.login();
                      },
                      width: double.maxFinite,
                      hight: 40.h,
                      textColor: Colors.white,
                      backgroundColor: Colors.blue,
                      borderRadius: 10.r),
            ],
          ),
        );
      },
    );
  }
}
