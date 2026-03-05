// To parse this JSON data, do
//
//     final groupModel = groupModelFromJson(jsonString);

import 'dart:convert';

GroupModel groupModelFromJson(String str) => GroupModel.fromJson(json.decode(str));

String groupModelToJson(GroupModel data) => json.encode(data.toJson());

class GroupModel {
  String? userId;
  String? groupId;
  String? groupName;
  String? createdAt;
  List<dynamic>? groupMembers;
  String? groupImage;

  GroupModel({
    this.userId,
    this.groupId,
    this.groupName,
    this.createdAt,
    this.groupMembers,
    this.groupImage,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) => GroupModel(
    userId: json["userId"],
    groupId: json["groupId"],
    groupName: json["groupName"],
    createdAt: json["createdAt"],
    groupMembers: json["groupMembers"] == null ? [] : List<dynamic>.from(json["groupMembers"]!.map((x) => x)),
    groupImage: json["groupImage"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "groupId": groupId,
    "groupName": groupName,
    "createdAt": createdAt,
    "groupMembers": groupMembers == null ? [] : List<dynamic>.from(groupMembers!.map((x) => x)),
    "groupImage": groupImage,
  };
}

