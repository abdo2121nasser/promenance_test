import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prominamce_test/core/blocks/choise_block.dart';
import 'package:prominamce_test/core/constants/color_constants.dart';
import 'package:prominamce_test/core/dio_services/dio_service.dart';
import 'package:prominamce_test/core/models/gallery_model.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit() : super(GalleryInitial());
  static GalleryCubit get(context) => BlocProvider.of(context);
  GalleryModel? galleryModel;
  var pickedFilename;
  File? imageFile;
  var imagePicker = ImagePicker();
  getImages() async {
    try {
      FlutterSecureStorage storage = const FlutterSecureStorage();
      String? token = await storage.read(key: 'token').catchError((error) {
        print(error);
      });
      emit(GetImagesLoadingState());
      Response response =
          await DioHelper.getData(url: 'my-gallery', token: token);
      galleryModel = await GalleryModel.fromJson(response.data);

      emit(GetImagesSuccessState());
    } catch (error) {
      emit(GetImagesErrorState());
      print(error);
    }
  }

  Future<void> pickImageFromGallery() async {
    emit(PickImageFromGalleryLoadingState());
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedFilename = pickedFile.path.split('/').last;
      imageFile = File(pickedFile.path);
      emit(PickImageFromGallerySuccessState());
    } else {
      print('no image selected');
      emit(PickImageFromGalleryErrorState());
    }
  }

  Future<void> pickImageFromCamera() async {
    emit(PickImageFromGalleryLoadingState());
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      pickedFilename = pickedFile.path.split('/').last;
      imageFile = File(pickedFile.path);
      emit(PickImageFromGallerySuccessState());
    } else {
      print('no image selected');
      emit(PickImageFromGalleryErrorState());
    }
  }

  uploadImage() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await storage.read(key: 'token').catchError((error) {
      print(error);
    });
    try {
      emit(UploadImagesLoadingState());
      FormData formData = FormData.fromMap({
        if (imageFile != null &&
            imageFile!.path.isNotEmpty &&
            pickedFilename != null)
          'img': [
            await MultipartFile.fromFile(
              imageFile!.path,
              filename: pickedFilename,
            ),
          ],
      });
      var response = await DioHelper.postData(
          url: 'upload', data: {}, formData: formData, token: token);
      imageFile = null;
      pickedFilename = null;
      emit(UploadImagesSuccessState());
    } catch (error) {
      emit(UploadImagesErrorState());
      print(error);
    }
  }

  showDialogBox({required context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: 180,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () async {
                      await pickImageFromGallery();
                      if (imageFile != null &&
                          imageFile!.path.isNotEmpty &&
                          pickedFilename != null) {
                        await uploadImage();
                      }
                    },
                    child: ChoiseBlock(
                      color: ColorConst.kPinkColor,
                      lable: 'Gallery',
                      iconData: Icons.photo_library,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await pickImageFromCamera();
                      if (imageFile != null &&
                          imageFile!.path.isNotEmpty &&
                          pickedFilename != null) {
                        await uploadImage();
                      }
                    },
                    child: ChoiseBlock(
                      color: ColorConst.kLightBlueColor,
                      lable: 'Camera',
                      iconData: Icons.camera_alt,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
