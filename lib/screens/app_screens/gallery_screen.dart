import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prominamce_test/core/blocks/buttons_with_icons_block.dart';
import 'package:prominamce_test/core/blocks/image_block.dart';
import 'package:prominamce_test/core/constants/color_constants.dart';
import 'package:prominamce_test/core/constants/image_constants.dart';
import 'package:prominamce_test/core/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:prominamce_test/core/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:prominamce_test/core/cubits/gallery_cubit/gallery_cubit.dart';

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return BlocProvider.value(
          value: GalleryCubit.get(context)..getImages(),
          child: BlocConsumer<GalleryCubit, GalleryState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var galCubit = GalleryCubit.get(context);
              var authCubit = AuthenticationCubit.get(context);
              return Scaffold(
                backgroundColor: const Color(ColorConst.kLightGradientColor),
                body: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Image.asset(
                    ImageConst.kGalleryBackGround,
                    fit: BoxFit.fill,
                  ).image)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 25.sp),
                                ),
                                Text(
                                  'guest',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 25.sp),
                                ),
                              ],
                            ),
                            Container(
                              width: 60.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: Image.asset(ImageConst.kSmileMan)
                                          .image)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                                onTap: () {
                                  authCubit.logout(context: context);
                                },
                                child: ButtonsWithIconsBlock(
                                  lable: 'log out',
                                  image: ImageConst.kLeftArrow,
                                  firstColor: ColorConst.kDarkRedColor,
                                  secondColor: ColorConst.kLightRedColor,
                                  gradientDirection: true,
                                )),
                            InkWell(
                                onTap: () async {
                                  galCubit.showDialogBox(context: context);
                                },
                                child: ButtonsWithIconsBlock(
                                  lable: 'upload',
                                  image: ImageConst.kUpperArrow,
                                  firstColor: ColorConst.kLightYellowColor,
                                  secondColor: ColorConst.kDarkYellowColor,
                                  gradientDirection: false,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      galCubit.galleryModel != null
                          ? Expanded(
                              child: GridView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        // mainAxisExtent: 140,
                                        crossAxisSpacing: 10.sp,
                                        childAspectRatio: (1 / .8),
                                        mainAxisSpacing: 20.sp),
                                itemBuilder: (_, index) => ImageBlock(
                                  image:
                                      galCubit.galleryModel!.data.images[index],
                                ),
                                itemCount:
                                    galCubit.galleryModel!.data.images.length,
                              ),
                            )
                          : const Center(
                              child: CircularProgressIndicator(
                              color: Colors.blue,
                            ))
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
