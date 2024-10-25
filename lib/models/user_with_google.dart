import 'dart:convert';

UserWithGoogleModel userWithGoogleModelFromJson(String str) => UserWithGoogleModel.fromJson(json.decode(str));

String userWithGoogleModelToJson(UserWithGoogleModel data) => json.encode(data.toJson());

class UserWithGoogleModel {
  String? userId;
  String? id;
  bool? isLive;
  String? email;
  String? name;
  String? gender;
  List<dynamic>? goalsList;
  String? about;
  List<dynamic>? traitsList;
  String? image;

  UserWithGoogleModel({
    this.userId,
    this.id,
    this.isLive,
    this.email,
    this.name,
    this.gender,
    this.goalsList,
    this.about,
    this.traitsList,
    this.image,
  });

  factory UserWithGoogleModel.fromJson(Map<String, dynamic> json) => UserWithGoogleModel(
    userId: json["userId"],
    id: json["id"],
    isLive: json["isLive"],
    email: json["email"],
    name: json["name"],
    gender: json["gender"],
    goalsList: json["goalsList"] == null ? [] : List<dynamic>.from(json["goalsList"]!.map((x) => x)),
    about: json["about"],
    traitsList: json["traitsList"] == null ? [] : List<dynamic>.from(json["traitsList"]!.map((x) => x)),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
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