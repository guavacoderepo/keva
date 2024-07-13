import 'dart:convert';

class Welcome {
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;

  Welcome({
    this.id,
    this.email,
    this.password,
    this.name,
    this.role,
    this.avatar,
  });

  factory Welcome.fromJson(String str) => Welcome.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Welcome.fromMap(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        role: json["role"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "password": password,
        "name": name,
        "role": role,
        "avatar": avatar,
      };
}
