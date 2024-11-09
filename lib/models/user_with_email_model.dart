// To parse this JSON data, do
//
//     final userWithEmailOrContactModel = userWithEmailOrContactModelFromJson(jsonString);

import 'dart:convert';

UserWithEmailOrContactModel userWithEmailOrContactModelFromJson(String str) => UserWithEmailOrContactModel.fromJson(json.decode(str));

String userWithEmailOrContactModelToJson(UserWithEmailOrContactModel data) => json.encode(data.toJson());

class UserWithEmailOrContactModel {
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
  String? age;
  List<dynamic>? communitiesList;
  List<dynamic>? groupsList;

  UserWithEmailOrContactModel({
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
    this.age,
    this.communitiesList,
    this.groupsList,
  });

  factory UserWithEmailOrContactModel.fromJson(Map<String, dynamic> json) => UserWithEmailOrContactModel(
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
    age: json["age"],
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
    "age": age,
    "communitiesList": communitiesList == null ? [] : List<dynamic>.from(communitiesList!.map((x) => x)),
    "groupsList": groupsList == null ? [] : List<dynamic>.from(groupsList!.map((x) => x)),
  };
}

