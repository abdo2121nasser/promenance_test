/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

GalleryModel galleryModelFromJson(String str) => GalleryModel.fromJson(json.decode(str));

String galleryModelToJson(GalleryModel data) => json.encode(data.toJson());

class GalleryModel {
    GalleryModel({
        required this.data,
        required this.message,
        required this.status,
    });

    Data data;
    String message;
    String status;

    factory GalleryModel.fromJson(Map<dynamic, dynamic> json) => GalleryModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
    );

    Map<dynamic, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status": status,
    };
}

class Data {
    Data({
        required this.images,
    });

    List<String> images;

    factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
        images: List<String>.from(json["images"].map((x) => x)),
    );

    Map<dynamic, dynamic> toJson() => {
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}
