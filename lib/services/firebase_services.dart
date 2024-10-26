import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_squadifi/controllers/authentication_controller.dart';
import 'package:e_squadifi/models/user_with_email_model.dart';
import 'package:e_squadifi/models/user_with_google.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
 /*                         create Account with Google                         */
 /* -------------------------------------------------------------------------- */
  static Future<void> createUserWithGoogleAccount() async {

    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final  userModel =  UserWithGoogleModel(
      userId:user.uid,
      id: time,
      email:auth.currentUser!.email.toString(),
      gender: "",
      goalsList: [],
      about: "",
      traitsList: [],
      image: "",
      name: auth.currentUser!.displayName.toString(),
      isLive: false,
      age: ""
    );

    return await fireStore
        .collection('SquadifiUsers')
        .doc(user.uid)
        .set(userModel.toJson());
  }
/* --------------------------------------------------------------------------*/
/*                         create Account with Facebook                      */
/* --------------------------------------------------------------------------*/
  static Future<void> createUserWithFacebookAccount() async {

     return;
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


}