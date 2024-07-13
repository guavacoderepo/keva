import 'dart:convert';

class UserModel {
  String? email;
  String? password;
  String? name;
  String? avatar;
  String? role;
  int? id;

  UserModel({
    this.email,
    this.password,
    this.name,
    this.avatar,
    this.role,
    this.id,
  });

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        password: json["password"],
        name: json["name"],
        avatar: json["avatar"],
        role: json["role"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
        "name": name,
        "avatar": avatar,
        "role": role,
        "id": id,
      };
}
