import 'package:country_code_picker/country_code_picker.dart';
import 'package:e_squadifi/constants/color_constants.dart'; // Your custom color constants
import 'package:e_squadifi/controllers/authentication_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text_form_field.dart';
import 'package:e_squadifi/views/screens/about_you_screen.dart';
import 'package:e_squadifi/views/screens/authentications/signup_screen.dart';
import 'package:e_squadifi/views/screens/bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../services/firebase_services.dart';
import '../../../utils/flush_messages.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String countryCode = "+92";
  final auth = FirebaseAuth.instance;
  AuthenticationController authenticationController =
      Get.put(AuthenticationController());
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
      builder: (authenticationController) {
        return GestureDetector(
          onTap: () {
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
            FocusScope.of(context).unfocus();
          },
          child: WillPopScope(
            onWillPop: () async {
              SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
              return true;
            },
            child: Form(
              key: formKey,
              child: Scaffold(
                body: Container(
                  height: Get.height,
                  width: Get.width,
                  padding: EdgeInsets.all(8.r), // Border width
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: ColorConstant.gradientBorderColor,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Container(
                      padding: EdgeInsets.all(20.r),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: ColorConstant.primaryGradiantColor,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                              //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
                            },
                            child: Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Colors.white38,
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                              child: Center(
                                child: Icon(
                                  CupertinoIcons.back,
                                  color: ColorConstant.whiteColor,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 30.h),
                                  // "Enter your phone number" text
                                  authenticationController.isPhone
                                      ? CustomText(
                                          'Enter your\nphone number',
                                          fw: FontWeight.w800,
                                          size: 32.sp,
                                          color: ColorConstant.whiteColor,
                                        )
                                      : CustomText(
                                          'Enter your\nemail/password',
                                          fw: FontWeight.w800,
                                          size: 32.sp,
                                          color: ColorConstant.whiteColor,
                                        ),
                                  SizedBox(height: 10.h),
                                  // Subtext for instruction
                                  CustomText(
                                    'Enter Phone number. you will receive\nVerification code in your email.',
                                    fw: FontWeight.w400,
                                    size: 13.sp,
                                    color: ColorConstant.whiteColor,
                                  ),
                                  SizedBox(height: 40.h),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 51.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(47.r),
                                            color: ColorConstant.greyColor),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ButtonWidget(
                                              paddingHorizontal: 10.w,
                                              text: 'Login with Phone',
                                              height: 50.h,
                                              color: authenticationController
                                                      .isPhone
                                                  ? ColorConstant.cyanBlue
                                                  : Colors.transparent,
                                              radius: 47.r,
                                              textColor:
                                                  ColorConstant.whiteColor,
                                              fw: FontWeight.w400,
                                              textSize: 14.sp,
                                              onTap: () {
                                                if (authenticationController
                                                        .loaderLogin ==
                                                    false) {
                                                  authenticationController
                                                      .signInWithPhone();
                                                }
                                              },
                                            ),
                                            ButtonWidget(
                                              paddingHorizontal: 10.w,
                                              text: 'Login with Email',
                                              height: 50.h,
                                              color: authenticationController
                                                      .isEmail
                                                  ? ColorConstant.cyanBlue
                                                  : Colors.transparent,
                                              radius: 47.r,
                                              textColor:
                                                  ColorConstant.whiteColor,
                                              fw: FontWeight.w400,
                                              textSize: 14.sp,
                                              onTap: () {
                                                if (authenticationController
                                                        .loaderLogin ==
                                                    false) {
                                                  authenticationController
                                                      .signInWithEmail();
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 30.h),
                                  authenticationController.isPhone
                                      ? CustomTextFormField(
                                          controller: phoneController,
                                          verticalPadding: 10.h,
                                          hintText: "Enter phone number",
                                          hintTextColor:
                                              ColorConstant.whiteColor,
                                          hintTextFw: FontWeight.w400,
                                          hintTextSize: 12.sp,
                                          validateFunction:
                                              authenticationController
                                                  .phoneValidate,
                                          child: CountryCodePicker(
                                            builder: (countryCode) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: ColorConstant
                                                        .whiteColor,
                                                    size: 15.sp,
                                                  ),
                                                  SizedBox(
                                                    width: 5.h,
                                                  ),
                                                  Image.asset(
                                                    countryCode?.flagUri ?? '',
                                                    package:
                                                        'country_code_picker',
                                                    height: 18.h,
                                                    width: 18.w,
                                                  ),
                                                  SizedBox(
                                                    width: 5.h,
                                                  ),
                                                  CustomText(
                                                    "$countryCode",
                                                    size: 14.sp,
                                                    fw: FontWeight.w400,
                                                    color: ColorConstant
                                                        .whiteColor,
                                                  ),
                                                ],
                                              );
                                            },
                                            onChanged: (code) {},
                                            initialSelection: countryCode,
                                            favorite: const ['+92'],
                                            showCountryOnly: false,
                                            showOnlyCountryWhenClosed: false,
                                            alignLeft: false,
                                          ),
                                        )
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CustomTextFormField(
                                              horizontalPadding: 20.w,
                                              controller: emailController,
                                              hintText: "Enter your Email",
                                              hintStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12.sp,
                                                  color:
                                                      ColorConstant.whiteColor),
                                              validateFunction:
                                                  authenticationController
                                                      .emailValidate,
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            CustomTextFormField(
                                              horizontalPadding: 20.w,
                                              hintText: "must be 8 characters",
                                              hintStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12.sp,
                                                  color:
                                                      ColorConstant.whiteColor),
                                              obSecureTap: () {
                                                authenticationController
                                                    .ObsecureLogin();
                                              },
                                              isObSecure:
                                                  authenticationController
                                                      .loginObSecure,
                                              validateFunction:
                                                  authenticationController
                                                      .passwordValidate,
                                              controller: passwordController,
                                            ),
                                          ],
                                        ),

                                  SizedBox(height: 20.h),

                                  // Login button
                                  authenticationController.loaderLogin
                                      ? Center(
                                          child: CircularProgressIndicator(
                                            color: ColorConstant.whiteColor,
                                          ),
                                        )
                                      : ButtonWidget(
                                          text: 'Login',
                                          height: 51.h,
                                          color: ColorConstant.cyanBlue,
                                          radius: 47.r,
                                          textColor: ColorConstant.whiteColor,
                                          fw: FontWeight.w700,
                                          textSize: 14.sp,
                                          onTap: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              {
                                                if (authenticationController
                                                    .isPhone) {
                                                  authenticationController
                                                      .loadingFunctionLogin();
                                                  authenticationController
                                                      .verifyPhoneNumber(
                                                          countryCode +
                                                              phoneController
                                                                  .text,
                                                          context,
                                                          "");
                                                } else {
                                                  authenticationController
                                                      .loadingFunctionLogin();
                                                  auth.signInWithEmailAndPassword(
                                                          email: emailController.text.toString(),
                                                          password: passwordController.text.toString())
                                                      .then((value) async {
                                                    authenticationController.loadingFunctionLogin();
                                                    if (value != null) {
                                                      if ((await FirebaseServices.userExists())) {
                                                        FlushMessagesUtil.snackBarMessage("Success", "Login Successfully", context);
                                                        Get.offAll(() => BottomNavBar());
                                                        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
                                                      } else {
                                                        await FirebaseServices.createUserWithEmailOrContact().then((value) {
                                                          FlushMessagesUtil.snackBarMessage("Success", "Login Successfully", context);
                                                          authenticationController.phoneLoginOrNot();
                                                          SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
                                                          Get.offAll(() => AboutYouScreen());
                                                        });
                                                      }
                                                    }
                                                  }).onError(
                                                          (error, stackTrace) {
                                                    authenticationController
                                                        .loadingFunctionLogin();
                                                    FlushMessagesUtil.snackBarMessage("Error", error.toString(), context);
                                                  });
                                                }
                                              }
                                            }
                                          },
                                        ),

                                  SizedBox(height: 20.h),

                                  // OR divider
                                  Row(
                                    children: [
                                      Expanded(
                                          child:
                                              Divider(color: Colors.white54)),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w),
                                        child: const Text(
                                          'Or',
                                          style:
                                              TextStyle(color: Colors.white54),
                                        ),
                                      ),
                                      Expanded(
                                          child:
                                              Divider(color: Colors.white54)),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),

                                  // Social media buttons
                                  ButtonWidget(
                                    sizedBoxWidth: 50.w,
                                    paddingHorizontal: 20.w,
                                    text: 'Sign in with Apple',
                                    height: 51.h,
                                    color: ColorConstant.blackColor,
                                    radius: 47.r,
                                    textColor: ColorConstant.whiteColor,
                                    fw: FontWeight.w400,
                                    textSize: 13.sp,
                                    onTap: () {
                                      authenticationController
                                          .signInWithApple(context);
                                    },
                                    icon: Icon(Icons.apple,
                                        size: 24.sp, color: Colors.white),
                                    isAuth: true,
                                  ),

                                  SizedBox(height: 8.h),

                                  ButtonWidget(
                                    sizedBoxWidth: 45.w,
                                    paddingHorizontal: 20.w,
                                    text: 'Continue with Google',
                                    height: 51.h,
                                    color: ColorConstant.whiteColor,
                                    radius: 47.r,
                                    textColor: ColorConstant.blackColor,
                                    fw: FontWeight.w400,
                                    textSize: 13.sp,
                                    onTap: () async {
                                      authenticationController
                                          .handleGoogleBtnClick(context);
                                    },
                                    icon: Icon(Icons.g_mobiledata,
                                        size: 30.sp, color: Colors.pinkAccent),
                                    isAuth: true,
                                  ),

                                  SizedBox(height: 8.h),

                                  ButtonWidget(
                                    sizedBoxWidth: 45.w,
                                    paddingHorizontal: 20.w,
                                    text: 'Continue with Facebook',
                                    height: 51.h,
                                    color: ColorConstant.blueColor,
                                    radius: 47.r,
                                    textColor: ColorConstant.whiteColor,
                                    fw: FontWeight.w400,
                                    textSize: 13.sp,
                                    onTap: () {
                                      authenticationController
                                          .signInWithFacebook(context);
                                    },
                                    icon: Icon(Icons.facebook,
                                        size: 30.sp,
                                        color: ColorConstant.whiteColor),
                                    isAuth: true,
                                  ),

                                  SizedBox(height: 8.h),

                                  ButtonWidget(
                                    sizedBoxWidth: 45.w,
                                    paddingHorizontal: 20.w,
                                    text: 'Continue with Instagram',
                                    height: 51.h,
                                    color: Colors.pink,
                                    radius: 47.r,
                                    textColor: ColorConstant.whiteColor,
                                    fw: FontWeight.w400,
                                    textSize: 13.sp,
                                    onTap: () {
                                      authenticationController
                                          .loginWithInstagram(context);
                                    },
                                    icon: Icon(Icons.camera,
                                        size: 30.sp,
                                        color: ColorConstant.whiteColor),
                                    isAuth: true,
                                  ),

                                  SizedBox(
                                      height: 20
                                          .h), // Replace Spacer with SizedBox for space
                                  FittedBox(
                                    child: Row(
                                      children: [
                                        CustomText(
                                          "Don't have an Account?",
                                          fw: FontWeight.w400,
                                          size: 14.sp,
                                          color: ColorConstant.whiteColor,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Get.to(() => SignUpScreen());
                                            SystemChrome.setEnabledSystemUIMode(
                                                SystemUiMode.immersiveSticky);
                                          },
                                          child: CustomText(
                                            "Signup",
                                            fw: FontWeight.w700,
                                            size: 14.sp,
                                            color: ColorConstant.whiteColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
