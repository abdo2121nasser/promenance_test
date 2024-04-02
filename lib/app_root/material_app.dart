import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prominamce_test/core/cubits/gallery_cubit/gallery_cubit.dart';
import 'package:prominamce_test/screens/app_screens/gallery_screen.dart';
import 'package:prominamce_test/screens/authentication_screen/login_screen.dart';

import '../core/cubits/authentication_cubit/authentication_cubit.dart';

class MyGallery extends StatelessWidget {
  final String? token;

  MyGallery({required this.token});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return SafeArea(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => AuthenticationCubit()),
              BlocProvider(create: (context) => GalleryCubit()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: token!.isEmpty ? LoginScreen() : GalleryScreen(),
              //home: GellaryScreen(),
            ),
          ),
        );
      },
    );
  }
}
