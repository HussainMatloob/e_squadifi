// To parse this JSON data, do
//
//     final userWithEmailOrContactModel = userWithEmailOrContactModelFromJson(jsonString);

import 'dart:convert';

UserModel userWithEmailOrContactModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userWithEmailOrContactModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
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
  String? contact;
  String? birthDate;
  List<dynamic>? communitiesList;
  List<dynamic>? groupsList;

  UserModel({
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
    this.contact,
    this. birthDate,
    this.communitiesList,
    this.groupsList,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
    contact: json["contact"],
    birthDate: json["birthDate"],
    communitiesList: json["communitiesList"] == null ? [] : List<dynamic>.from(json["communitiesList"]!.map((x) => x)),
    groupsList: json["groupsList"] == null ? [] : List<dynamic>.from(json["groupsList"]!.map((x) => x)),
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
    "contact": contact,
    "birthDate": birthDate,
    "communitiesList": communitiesList == null ? [] : List<dynamic>.from(communitiesList!.map((x) => x)),
    "groupsList": groupsList == null ? [] : List<dynamic>.from(groupsList!.map((x) => x)),
  };
}

