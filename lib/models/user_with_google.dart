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
  List<String>? goalsList;
  String? about;
  List<String>? traitsList;
  String? image;
  String? age;

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
    this.age,
  });

  factory UserWithGoogleModel.fromJson(Map<String, dynamic> json) => UserWithGoogleModel(
    userId: json["userId"],
    id: json["id"],
    isLive: json["isLive"],
    email: json["email"],
    name: json["name"],
    gender: json["gender"],
    goalsList: json["goalsList"] == null ? [] : List<String>.from(json["goalsList"]!.map((x) => x)),
    about: json["about"],
    traitsList: json["traitsList"] == null ? [] : List<String>.from(json["traitsList"]!.map((x) => x)),
    image: json["image"],
    age: json["age"],
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
    "age": age,
  };
}
