// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  String? groupId;
  String? sendTime;
  String? senderImage;
  String? message;
  String? senderId;

  ChatModel({
    this.groupId,
    this.sendTime,
    this.senderImage,
    this.message,
    this.senderId,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
    groupId: json["groupId"],
    sendTime: json["sendTime"],
    senderImage: json["SenderImage"],
    message: json["message"],
    senderId: json["senderId"],
  );

  Map<String, dynamic> toJson() => {
    "groupId": groupId,
    "sendTime": sendTime,
    "SenderImage": senderImage,
    "message": message,
    "senderId": senderId,
  };
}