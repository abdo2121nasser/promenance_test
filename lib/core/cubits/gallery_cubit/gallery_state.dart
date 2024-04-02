part of 'gallery_cubit.dart';

@immutable
abstract class GalleryState {}

class GalleryInitial extends GalleryState {}
class GetImagesLoadingState extends GalleryState {}
class GetImagesSuccessState extends GalleryState {}
class GetImagesErrorState extends GalleryState {}

class UploadImagesLoadingState extends GalleryState {}
class UploadImagesSuccessState extends GalleryState {}
class UploadImagesErrorState extends GalleryState {}

class PickImageFromGalleryLoadingState extends GalleryState {}
class PickImageFromGallerySuccessState extends GalleryState {}
class PickImageFromGalleryErrorState extends GalleryState {}
