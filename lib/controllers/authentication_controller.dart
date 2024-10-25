import 'dart:io';
import 'package:e_squadifi/models/user_with_email_model.dart';
import 'package:e_squadifi/views/screens/bottom_navigation_bar.dart';
import 'package:e_squadifi/views/screens/create_avatar_screen.dart';
import 'package:e_squadifi/views/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../services/firebase_services.dart';
import '../utils/flush_messages.dart';
import '../views/screens/about_you_screen.dart';

class AuthenticationController extends GetxController{
  String pinCodeLength = "";
  String? selectedYear;
  String? selectedMonth;
  bool logInWithPhone=false;
bool isPhone=false;
bool isEmail=true;
String? gender;
List<String> selectedGoals=[];
List<String> selectedTreats=[];
final FirebaseAuth auth = FirebaseAuth.instance;
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

void phoneLoginOrNot(){
  logInWithPhone=false;
  update();
}

void selectMonth(String month){
  selectedMonth=month;
  update();
}

void selectYear(String year){
  selectedYear= year;
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

String? phoneValidate(value)
  {
    final regex = RegExp(r'^\d{10}$');
    if(value==null||value.trim().isEmpty)
    {
      return"Please enter phone number";
    }
    if (!regex.hasMatch(value)) {
      return 'Please enter valid number';
    }
    return null; // Valid input
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



  /*--------------------------------------------------------------------------*/
  /*                                  Sign in with Phone                       */
  /*--------------------------------------------------------------------------*/


  String verificationID = "";
  String? mobileNumber;
  Future<void> verifyPhoneNumber(String phone,BuildContext context) async {
    try {
      mobileNumber = phone.trim();
      verificationID = "";
      update();

      verificationCompleted(AuthCredential credential) async {
        await auth.signInWithCredential(credential);
      }

      verificationFailed(FirebaseAuthException authException) {
        FlushMessagesUtil.snackBarMessage("Error",  authException.message.toString(), context);
         loaderLogin = false;
        update();

        // Show error message
      }

      codeSent(String verificationId, [int? forceResendingToken]) async {
        forceResendingToken = forceResendingToken;
        loaderLogin = false;
        verificationID=verificationId;
        logInWithPhone=true;
        update();
        Get.offAll(()=>AboutYouScreen());
      }

      codeAutoRetrievalTimeout(String verificationId) {
        verificationID = verificationId;
      }

      await auth.verifyPhoneNumber(
        phoneNumber: mobileNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (e) {
      loaderLogin = false;
      update();
      FlushMessagesUtil.snackBarMessage("Error", "Error in OTP send", context);
    }
  }


  Future<void> submitVerificationCode(String verificationCode,String verId,BuildContext context) async {
    update();
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verId,
        smsCode: verificationCode,
      );

      await auth.signInWithCredential(credential);

      if (!await FirebaseServices.userExists()) {
        await FirebaseServices
            .createUserWithEmailOrContact().then((onValue){
              Get.offAll(()=>CreateAvatarScreen());
        });
      }else{
        Get.offAll(BottomNavBar());
      }
      update();
    } on FirebaseAuthException catch (e) {
      FlushMessagesUtil.snackBarMessage("OTP Verification", e.message.toString(), context);


    } catch (e) {
      FlushMessagesUtil.snackBarMessage("OTP Verification", e.toString(), context);

      // Show error message
    }
  }


  pinCodeUpdateLength(String value) {
    pinCodeLength = value;
    update();
  }


  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.clear();
    verificationID = "";
    selectedTreats.clear();
    selectedGoals.clear();
    selectedYear=null;
    selectedMonth=null;
    mobileNumber=null;
    update();
    Get.offAll(() => SplashScreen());
  }

}