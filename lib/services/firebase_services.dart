import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_squadifi/controllers/authentication_controller.dart';
import 'package:e_squadifi/models/chat_model.dart';
import 'package:e_squadifi/models/community_model.dart';
import 'package:e_squadifi/models/group_model.dart';
import 'package:e_squadifi/models/user_with_email_model.dart';
import 'package:e_squadifi/models/user_with_google.dart';
import 'package:e_squadifi/utils/flush_messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class FirebaseServices{
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;
  static User get user => auth.currentUser!;


  /* -------------------------------------------------------------------------- */
  /*                              check user exist or not                       */
  /* -------------------------------------------------------------------------- */

  static Future<bool> userExists() async {
    return (await fireStore.collection('SquadifiUsers').doc(auth.currentUser!.uid).get()).exists;
  }

  /* -------------------------------------------------------------------------- */
  /*                       create Account with Email and Password               */
  /* -------------------------------------------------------------------------- */

  static Future<void> createUserWithEmailOrContact() async {
    AuthenticationController authenticationController=Get.put(AuthenticationController());
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? name = sp.getString('name');
    String? email = sp.getString('email');
    String? about = sp.getString('about');
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    final userWithEmailModel = UserWithEmailOrContactModel(
      userId:user.uid,
      id: time,
      email:email??"",
      gender: authenticationController.gender??"",
      goalsList: authenticationController.selectedGoals??[],
      about: about??"",
      traitsList: authenticationController.selectedTreats??[],
      image: "",
      name: name,
      isLive: false,
      contact: authenticationController.mobileNumber??"",
      age:"${authenticationController.selectedMonth},${authenticationController.selectedYear}"??""
    );

    return await fireStore
        .collection('SquadifiUsers')
        .doc(user.uid)
        .set(userWithEmailModel.toJson());
  }
 /* -------------------------------------------------------------------------- */
 /*       create Account with Google or Apple or Facebook or Instagram         */
 /* -------------------------------------------------------------------------- */

  static Future<void> createUserWithOtherMethods() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final  userModel =  UserWithGoogleModel(
      userId:user.uid,
      id: time,
      email:auth.currentUser!.email.toString()??"",
      gender: "",
      goalsList: [],
      about: "",
      traitsList: [],
      image: "",
      name: auth.currentUser!.displayName.toString()??"",
      isLive: false,
      age: ""
    );

    return await fireStore
        .collection('SquadifiUsers')
        .doc(user.uid)
        .set(userModel.toJson());
  }

/* -------------------------------------------------------------------------- */
/*                                  update user data                          */
/* -------------------------------------------------------------------------- */

  static Future<void>  updateUserData() async {
    AuthenticationController authenticationController=Get.put(AuthenticationController());
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? about = sp.getString('about');
    return await fireStore
        .collection('SquadifiUsers')
        .doc(user.uid)
        .update({
      "gender":authenticationController.gender,
      "goalsList":authenticationController.selectedGoals,
      "about":about,
      "traitsList":authenticationController.selectedTreats,
      "age":"${authenticationController.selectedMonth},${authenticationController.selectedYear}"
    }
    );
  }

  /* -------------------------------------------------------------------------- */
  /*                                  create  Community                         */
  /* -------------------------------------------------------------------------- */

  static Future<void> createCommunity(String communityName,String description,BuildContext context) async {
    try{
      final time = DateTime.now().millisecondsSinceEpoch.toString();
      final  communityModel = CommunityModel(
          userId:user.uid,
          communityName: communityName,
          createdAt: time,
          description: description
      );

      return await fireStore
          .collection('Community')
          .doc(user.uid)
          .set(communityModel.toJson());
    }catch(e){
      FlushMessagesUtil.snackBarMessage("Error", e.toString(), context);
    }

  }

  /* -------------------------------------------------------------------------- */
  /*                                    create Group                            */
  /* -------------------------------------------------------------------------- */

  static Future<void> createGroup(BuildContext context,String groupName) async {
    try{
      final time = DateTime.now().millisecondsSinceEpoch.toString();
      final  groupModel = GroupModel(
          userId:user.uid,
          groupId: time,
        groupName: groupName,
        createdAt: time,
        groupMembers: [],
        groupImage: "",
      );
      return await fireStore
          .collection('Community')
          .doc(user.uid).collection("Groups").doc(time)
          .set(groupModel.toJson());
    }catch(e){
      FlushMessagesUtil.snackBarMessage("Error", e.toString(), context);
    }
  }
  /* -------------------------------------------------------------------------- */
  /*                      check Community Exist or not                         */
  /* -------------------------------------------------------------------------- */
  static Future<bool> communityExists() async {
    return (await fireStore.collection('Community').doc(auth.currentUser!.uid).get()).exists;
  }

/* -------------------------------------------------------------------------- */
/*                                    get your groups                         */
/* -------------------------------------------------------------------------- */

static Query<Map<String ,dynamic>> getYourGroups(){
  return fireStore.collection('Community').doc(user.uid).collection("Groups");
}

/* -------------------------------------------------------------------------- */
/*                                    send message                            */
/* -------------------------------------------------------------------------- */

static Future<void> sendMessage(GroupModel groupModel,BuildContext context,String message) async{
  try {
    final time = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    final chatModel = ChatModel(
      groupId: groupModel.groupId,
      senderId: user.uid,
      senderImage: "",
      message: message,
      sendTime: time
    );
    return await fireStore
        .collection('Community')
        .doc(groupModel.userId).collection("Groups").doc(groupModel.groupId).collection("groupChats").doc(time)
        .set(chatModel.toJson());
  } catch (e) {
    FlushMessagesUtil.snackBarMessage("Error", e.toString(), context);
  }
}

/*--------------------------------------------------------------------------*/
/*                                 get messages                             */
/*--------------------------------------------------------------------------*/

static Query<Map<String,dynamic>> getMessages(GroupModel groupModel){
  return fireStore.collection('Community').doc(groupModel.userId).collection("Groups").doc(groupModel.groupId).collection("groupChats").orderBy('sendTime',descending: true);
}
}