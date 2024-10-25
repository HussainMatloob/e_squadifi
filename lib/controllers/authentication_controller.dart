import 'dart:io';
import 'package:e_squadifi/views/screens/bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../services/firebase_services.dart';
import '../utils/flush_messages.dart';
import '../views/screens/about_you_screen.dart';

class AuthenticationController extends GetxController{
bool isPhone=false;
bool isEmail=true;
String? gender;
List<String> selectedGoals=[];
List<String> selectedTreats=[];
void signInWithPhone(){
  isPhone=true;
  isEmail=false;
  update();
}
void signInWithEmail(){
  isPhone=false;
  isEmail=true;
  update();
}

void selectGender(String value){
  gender=value;
  update();
}
/* -------------------------------------------------------------------------- */
/*                              Selected Goals List                           */
/* -------------------------------------------------------------------------- */
void selectOrRemoveGoal(String value){
  if((selectedGoals??[]).contains(value)){
    selectedGoals.remove(value);
    update();
  }else{
    selectedGoals.add(value);
    update();
  }
}
/* -------------------------------------------------------------------------- */
/*                              Selected Traits List                           */
/* -------------------------------------------------------------------------- */
void selectOrRemoveTraits(String value){
  if((selectedTreats??[]).contains(value)){
    selectedTreats.remove(value);
    update();
  }else{
    selectedTreats.add(value);
    update();
  }
}

bool loginObSecure=true;
bool signupObSecure=false;
bool loaderSignup=false;
bool loaderLogin=false;
bool loaderForget=false;
String? userIdentifier;
void forGotLoading(){
  loaderForget=!loaderForget;
  update();
}

void ObsecureLogin( ){
  loginObSecure= !loginObSecure;
  update();
}
void ObsecureSignup( ){
  signupObSecure= !signupObSecure;
  update();
}

void loadingFunctionSignup(){
  loaderSignup=!loaderSignup;
  update();
}


void loadingFunctionLogin(){
  loaderLogin=!loaderLogin;
  update();
}

String? emailValidate(value)
{
  if(value==null||value.trim().isEmpty)
  {
    return "Please enter an email";
  }
  bool emailReg=RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value);
  if(emailReg==false)
  {
    return"Please enter valid email";
  }
  return null;
}

String? passwordValidate(value)
{
  if(value==null||value.trim().isEmpty)
  {
    return"Please enter password";
  }
  if (value == null || value.length < 8) {
    return "Password must be at least 8 characters long.";
  }
  return null; // Valid input
}

String? nameValidate(value)
{
  if(value==null||value.trim().isEmpty)
  {
    return "Please enter name";
  }
}


/* -------------------------------------------------------------------------- */
/*                                  Sign in Google                             */
/* -------------------------------------------------------------------------- */

  void handleGoogleBtnClick(BuildContext context) {
    // Dialogs.showProgressBar(context);

    signInWithGoogle(context).then((value) async {
      //Navigator.pop(context);
      if (value != null) {
        if ((await FirebaseServices.userExists())) {
          Get.to(()=> BottomNavBar());
        } else {
          await FirebaseServices.createUserWithGoogleAccount().then((value) {
            Get.to(()=>AboutYouScreen());
          });
        }
        FlushMessagesUtil.snackBarMessage( 'Success', 'You login successfully', context);
      }
    });
  }


  Future<UserCredential?> signInWithGoogle(context) async {
    try {
      await InternetAddress.lookup('google.com');
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return  FirebaseServices.auth.signInWithCredential(credential);
    } catch (e) {
      FlushMessagesUtil.snackBarMessage("Error", e.toString(), context);
      return null;
    }
  }

  /* --------------------------------------------------------------------------*/
  /*                                  Sign in with Apple                        */
  /* -------------------------------------------------------------------------- */

  Future<void> signInWithApple(BuildContext context) async {
    // Check if the current platform is iOS
    if (!Platform.isIOS) {
      // Show message if the platform is not iOS
      FlushMessagesUtil.snackBarMessage( '"Error', 'This action is only allowed on Apple devices.', context);

      return; // Exit the function to prevent further execution
    }

    try {
      // Proceed with Apple sign-in as usual on Apple devices
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      // Use the appleCredential to authenticate with your backend server
      userIdentifier = appleCredential.userIdentifier;
      update();

    } catch (error) {
      FlushMessagesUtil.snackBarMessage("Error", error.toString(), context);
    }
  }

}