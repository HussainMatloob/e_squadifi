import 'dart:async';
import 'dart:io';
import 'package:e_squadifi/views/screens/bottom_navigation_bar.dart';
import 'package:e_squadifi/views/screens/create_avatar_screen.dart';
import 'package:e_squadifi/views/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../services/firebase_services.dart';
import '../utils/flush_messages.dart';
import '../views/screens/about_you_screen.dart';
import '../views/screens/authentications/login_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthenticationController extends GetxController {
  bool otpLoader = false;
  String pinCodeLength = "";
  String? selectedYear;
  String? selectedMonth;
  bool logInWithPhone = false;
  bool isPhone = false;
  bool isEmail = true;
  String? gender;
  List<String> selectedGoals = [];
  List<String> selectedTreats = [];
  final FirebaseAuth auth = FirebaseAuth.instance;
  void signInWithPhone() {
    isPhone = true;
    isEmail = false;
    update();
  }

  void loaderOfOtp() {
    otpLoader = true;
    update();
  }

  void signInWithEmail() {
    isPhone = false;
    isEmail = true;
    update();
  }

  void selectGender(String value) {
    gender = value;
    update();
  }

  void phoneLoginOrNot() {
    logInWithPhone = false;
    update();
  }

  void selectMonth(String month) {
    selectedMonth = month;
    update();
  }

  void selectYear(String year) {
    selectedYear = year;
    update();
  }

/* -------------------------------------------------------------------------- */
/*                              Selected Goals List                           */
/* -------------------------------------------------------------------------- */
  void selectOrRemoveGoal(String value) {
    if ((selectedGoals ?? []).contains(value)) {
      selectedGoals.remove(value);
      update();
    } else {
      selectedGoals.add(value);
      update();
    }
  }

/* -------------------------------------------------------------------------- */
/*                              Selected Traits List                           */
/* -------------------------------------------------------------------------- */
  void selectOrRemoveTraits(String value) {
    if ((selectedTreats ?? []).contains(value)) {
      selectedTreats.remove(value);
      update();
    } else {
      selectedTreats.add(value);
      update();
    }
  }

  bool loginObSecure = true;
  bool signupObSecure = false;
  bool loaderSignup = false;
  bool loaderLogin = false;
  bool loaderForget = false;
  String? userIdentifier;
  void forGotLoading() {
    loaderForget = !loaderForget;
    update();
  }

  void ObsecureLogin() {
    loginObSecure = !loginObSecure;
    update();
  }

  void ObsecureSignup() {
    signupObSecure = !signupObSecure;
    update();
  }

  void loadingFunctionSignup() {
    loaderSignup = !loaderSignup;
    update();
  }

  void loadingFunctionLogin() {
    loaderLogin = !loaderLogin;
    update();
  }

  /*--------------------------------------------------------------------------*/
  /*                           Auth check and validation                       */
  /*--------------------------------------------------------------------------*/

  String? emailValidate(value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter an email";
    }
    bool emailReg = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value);
    if (emailReg == false) {
      return "Please enter valid email";
    }
    return null;
  }

  String? passwordValidate(value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter password";
    }
    if (value == null || value.length < 8) {
      return "Password must be at least 8 characters long.";
    }
    return null; // Valid input
  }

  String? phoneValidate(value) {
    final regex = RegExp(r'^\d{10}$');
    if (value == null || value.trim().isEmpty) {
      return "Please enter phone number";
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
          Get.offAll(() => BottomNavBar());
        } else {
          await FirebaseServices.createUserWithOtherMethods().then((value) {
            logInWithPhone = false;
            update();
            Get.offAll(() => AboutYouScreen());
          });
        }
        FlushMessagesUtil.snackBarMessage(
            'Success', 'You login successfully', context);
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
      return FirebaseServices.auth.signInWithCredential(credential);
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
      FlushMessagesUtil.snackBarMessage(
          'Error', 'This action is only allowed on Apple devices.', context);
      return;
    }

    try {
      // Attempt Apple sign-in and retrieve Apple ID credential
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      // Create OAuth credential for Firebase
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      // Sign in to Firebase with the Apple credential
      await FirebaseAuth.instance
          .signInWithCredential(oauthCredential)
          .then((value) async {
        // Check if the user already exists
        bool userExists = await FirebaseServices.userExists();
        if (userExists) {
          // Navigate to the Home Screen if the user already exists
          Get.offAll(() => BottomNavBar());
        } else {
          // Create a new user in the database and navigate to the "About You" screen
          await FirebaseServices.createUserWithOtherMethods().then((value) {
            // Show success message
            FlushMessagesUtil.snackBarMessage(
                'Success', 'You login successfully', context);
            logInWithPhone = false;
            Get.offAll(() => AboutYouScreen());
          });
        }
      });
    } catch (error) {
      // Show error message if Apple sign-in fails
      FlushMessagesUtil.snackBarMessage("Error", error.toString(), context);
    }
  }

  /*--------------------------------------------------------------------------*/
  /*                            Sign in with Phone                            */
  /*--------------------------------------------------------------------------*/

  String verificationID = "";
  String? mobileNumber;
  Future<void> verifyPhoneNumber(
      String phone, BuildContext context, String isResend) async {
    try {
      mobileNumber = phone.trim();
      verificationID = "";
      update();

      verificationCompleted(AuthCredential credential) async {
        await auth.signInWithCredential(credential);
      }

      verificationFailed(FirebaseAuthException authException) {
        FlushMessagesUtil.snackBarMessage(
            "Error", authException.message.toString(), context);
        loaderLogin = false;
        update();

        // Show error message
      }

      codeSent(String verificationId, [int? forceResendingToken]) async {
        forceResendingToken = forceResendingToken;
        loaderLogin = false;
        verificationID = verificationId;
        logInWithPhone = true;
        update();
        FlushMessagesUtil.snackBarMessage(
            "Success", "Otp send on your phone", context);
        if (isResend != "resend") {
          Get.offAll(() => AboutYouScreen());
        } else {}
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

  Future<void> submitVerificationCode(
      String verificationCode, String verId, BuildContext context) async {
    update();
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verId,
        smsCode: verificationCode,
      );

      await auth.signInWithCredential(credential).then((onValue) async {
        if (!await FirebaseServices.userExists()) {
          await FirebaseServices.createUserWithEmailOrContact().then((onValue) {
            FlushMessagesUtil.snackBarMessage(
                "Success", "You are login successfully", context);
            otpLoader = false;
            update();
            Get.offAll(() => CreateAvatarScreen());
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
          });
        } else {
          FlushMessagesUtil.snackBarMessage(
              "Success", "You are login successfully", context);
          otpLoader = false;
          update();
          Get.offAll(BottomNavBar());
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        }
      });
    } on FirebaseAuthException catch (e) {
      otpLoader = false;
      update();
      FlushMessagesUtil.snackBarMessage(
          "OTP Verification", e.message.toString(), context);
    } catch (e) {
      otpLoader = false;
      update();
      FlushMessagesUtil.snackBarMessage(
          "OTP Verification", e.toString(), context);
      // Show error message
    }
  }

  pinCodeUpdateLength(String value) {
    pinCodeLength = value;
    update();
  }

  /*--------------------------------------------------------------------------*/
  /*                                 logOut Method                            */
  /*--------------------------------------------------------------------------*/
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    verificationID = "";
    selectedTreats.clear();
    selectedGoals.clear();
    selectedYear = null;
    selectedMonth = null;
    mobileNumber = null;
    update();
    Get.offAll(() => SplashScreen());
  }

  /*--------------------------------------------------------------------------*/
  /*                              Sign in with Facebook                       */
  /*--------------------------------------------------------------------------*/

  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      // Attempt Facebook login
      final LoginResult result = await FacebookAuth.instance.login();

      switch (result.status) {
        case LoginStatus.success:
          // Retrieve the credential for Firebase authentication
          final AuthCredential facebookCredential =
              FacebookAuthProvider.credential(
            result.accessToken!.tokenString, // Use tokenString directly
          );

          // Sign in with the credential
          await auth
              .signInWithCredential(facebookCredential)
              .then((onValue) async {
            // Check if the user already exists
            bool userExists = await FirebaseServices.userExists();

            if (userExists) {
              FlushMessagesUtil.snackBarMessage(
                  'Success', 'You are logged in successfully', context);
              Get.offAll(() => BottomNavBar());
            } else {
              await FirebaseServices.createUserWithOtherMethods()
                  .then((onValue) {
                FlushMessagesUtil.snackBarMessage(
                    'Success', 'You are logged in successfully', context);
                logInWithPhone = false;
                update();
                Get.offAll(() => AboutYouScreen());
              });
            }
          });

          break;

        case LoginStatus.cancelled:
          FlushMessagesUtil.snackBarMessage(
              'Cancelled', 'Login cancelled by user', context);
          break;

        case LoginStatus.failed:
          FlushMessagesUtil.snackBarMessage(
              'Error', 'Login failed: ${result.message}', context);
          break;

        default:
          FlushMessagesUtil.snackBarMessage(
              'Error', 'Unexpected error occurred', context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        FlushMessagesUtil.snackBarMessage(
            'Error',
            'An account already exists with a different sign-in method. Please use that method.',
            context);
      } else {
        FlushMessagesUtil.snackBarMessage(
            'Error', 'Firebase Auth error: ${e.message}', context);
      }
    } catch (e) {
      FlushMessagesUtil.snackBarMessage(
          'Error', 'An unexpected error occurred: $e', context);
    }
  }

  /*--------------------------------------------------------------------------*/
  /*                              Sign in with Instagram                      */
  /*--------------------------------------------------------------------------*/



  final String instagramAuthURL = 'https://bd88-103-149-240-172.ngrok-free.app/login-instagram';
  late WebViewController _webViewController;

  Future<void> loginWithInstagram(BuildContext context) async {
    final Completer<String?> redirectURLCompleter = Completer<String?>();

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            debugPrint("onPageFinished URL: $url");
            if (url.contains('/instagram-auth') && !redirectURLCompleter.isCompleted) {
              redirectURLCompleter.complete(url);
              Navigator.of(context).pop();
            }
          },
          onNavigationRequest: (NavigationRequest request) {
            debugPrint("Navigation request: ${request.url}");
            if (request.url.contains('/instagram-auth') && !redirectURLCompleter.isCompleted) {
              redirectURLCompleter.complete(request.url);
              Navigator.of(context).pop();
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse('$instagramAuthURL?ngrok-skip-browser-warning=true'),
      );

    // Show the WebView in a dialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            width: double.maxFinite,
            height: 500,
            child: WebViewWidget(controller: _webViewController),
          ),
        );
      },
    );

    // Wait for the redirect URL
    final redirectURL = await redirectURLCompleter.future;
    debugPrint("Redirect URL: $redirectURL");

    if (redirectURL != null) {
      final Uri uri = Uri.parse(redirectURL);
      final String? code = uri.queryParameters['code'];
      debugPrint("Extracted code: $code");

      if (code != null) {
        final response = await http.get(Uri.parse(
            'https://bd88-103-149-240-172.ngrok-free.app/instagram-auth?code=$code'));

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          final firebaseToken = data['firebaseToken'];

          await auth.signInWithCustomToken(firebaseToken).then((userCredential) async {
            bool userExists = await FirebaseServices.userExists();

            if (userExists) {
              FlushMessagesUtil.snackBarMessage(
                  'Success', 'You are logged in successfully', context);
              Get.offAll(() => BottomNavBar());
            } else {
              await FirebaseServices.createUserWithOtherMethods().then((_) {
                FlushMessagesUtil.snackBarMessage(
                    'Success', 'You are logged in successfully', context);
                Get.offAll(() => AboutYouScreen());
              });
            }
          });
        } else {
          FlushMessagesUtil.snackBarMessage(
              "Error", "Authentication failed", context);
        }
      } else {
        FlushMessagesUtil.snackBarMessage(
            "Error", "Code extraction failed", context);
      }
    } else {
      FlushMessagesUtil.snackBarMessage("Error", "Redirect failed", context);
    }
  }



  Future<void> isUserLogin() async {
    if (FirebaseAuth.instance.currentUser != null) {
      if ((await FirebaseServices.userExists())) {
        Get.offAll(() => BottomNavBar());
      } else {
        Get.offAll(() => LoginScreen());
      }
    } else {
      Get.offAll(() => LoginScreen());
    }
  }
}
