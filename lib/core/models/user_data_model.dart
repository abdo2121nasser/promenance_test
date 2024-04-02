/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
    UserData({
        required this.user,
        required this.token,
    });

    User user;
    String token;

    factory UserData.fromJson(Map<dynamic, dynamic> json) => UserData(
        user: User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<dynamic, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
    };
}

class User {
    User({
        required this.updatedAt,
        required this.name,
        required this.createdAt,
        required this.emailVerifiedAt,
        required this.id,
        required this.email,
    });

    DateTime updatedAt;
    String name;
    DateTime createdAt;
    DateTime emailVerifiedAt;
    int id;
    String email;

    factory User.fromJson(Map<dynamic, dynamic> json) => User(
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        id: json["id"],
        email: json["email"],
    );

    Map<dynamic, dynamic> toJson() => {
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "id": id,
        "email": email,
    };
}
