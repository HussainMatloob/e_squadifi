// To parse this JSON data, do
//
//     final communityModel = communityModelFromJson(jsonString);

import 'dart:convert';

CommunityModel communityModelFromJson(String str) => CommunityModel.fromJson(json.decode(str));

String communityModelToJson(CommunityModel data) => json.encode(data.toJson());

class CommunityModel {
  String? userId;
  String? createdAt;
  String? communityName;
  String? description;

  CommunityModel({
    this.userId,
    this.createdAt,
    this.communityName,
    this.description,
  });

  factory CommunityModel.fromJson(Map<String, dynamic> json) => CommunityModel(
    userId: json["userId"],
    createdAt: json["createdAt"],
    communityName: json["communityName"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "createdAt": createdAt,
    "communityName": communityName,
    "description": description,
  };
}