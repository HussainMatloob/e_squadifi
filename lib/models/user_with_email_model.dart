import 'dart:convert';

UserWithEmailModel userWithEmailModelFromJson(String str) => UserWithEmailModel.fromJson(json.decode(str));

String userWithEmailModelToJson(UserWithEmailModel data) => json.encode(data.toJson());

class UserWithEmailModel {
  String? userId;
  bool? isLive;
  String? email;
  String? name;
  String? gender;
  List<String>? goalsList;
  String? about;
  List<String>? traitsList;
  String? image;

  UserWithEmailModel({
    this.userId,
    this.isLive,
    this.email,
    this.name,
    this.gender,
    this.goalsList,
    this.about,
    this.traitsList,
    this.image,
  });

  factory UserWithEmailModel.fromJson(Map<String, dynamic> json) => UserWithEmailModel(
    userId: json["userId"],
    isLive: json["isLive"],
    email: json["email"],
    name: json["name"],
    gender: json["gender"],
    goalsList: json["goalsList"] == null ? [] : List<String>.from(json["goalsList"]!.map((x) => x)),
    about: json["about"],
    traitsList: json["traitsList"] == null ? [] : List<String>.from(json["traitsList"]!.map((x) => x)),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "isLive": isLive,
    "email": email,
    "name": name,
    "gender": gender,
    "goalsList": goalsList == null ? [] : List<dynamic>.from(goalsList!.map((x) => x)),
    "about": about,
    "traitsList": traitsList == null ? [] : List<dynamic>.from(traitsList!.map((x) => x)),
    "image": image,
  };
}
