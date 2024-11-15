import 'package:e_squadifi/constants/color_constants.dart'; // Your custom color constants
import 'package:e_squadifi/controllers/authentication_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/screens/authentications/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/flush_messages.dart';
import '../../custom_widgets/custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  GlobalKey<FormState> formKey= GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  final String countryCode = "+92";
  AuthenticationController authenticationController=Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
      builder: (authenticationController){
        return  GestureDetector(
          onTap: (){
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
            FocusScope.of(context).unfocus();
          },
          child: WillPopScope(
            onWillPop: () async{
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
                    borderRadius: BorderRadius.circular(50.r),),
                  child: Container(
                    padding: EdgeInsets.all(20.r),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: ColorConstant.primaryGradiantColor,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(50.r)
                    ),
                    child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          InkWell(
                            onTap: (){
                              Get.back();
                              SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
                            },
                            child: Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Colors.white38,
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                              child: Center(child: Icon(CupertinoIcons.back,color: ColorConstant.whiteColor,),),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child:   Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Back Arrow Icon
                                    SizedBox(height: 30.h),

                                    // "SignUp" text
                                    Text(
                                      'SignUp',
                                      style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),

                                    // Subtext for description
                                    Text(
                                      'Lorem ipsum dolor sit amet consectetur. In viverra eget orci amet cras.',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    SizedBox(height: 30.h),

                                    // Two buttons for sign up with phone or email

                                    CustomTextFormField(
                                      validateFunction: authenticationController.emailValidate,
                                      horizontalPadding: 20.w,
                                      controller: emailController,
                                      hintText: "Enter your Email",
                                      hintTextColor: ColorConstant.whiteColor,
                                      hintTextFw: FontWeight.w400,
                                      hintTextSize: 12.sp,
                                    ),
                                    SizedBox(height: 10.h,),
                                    CustomTextFormField(
                                      horizontalPadding: 20.w,
                                      hintText: "must be 8 characters",
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp,
                                          color: ColorConstant.whiteColor),
                                      obSecureTap: () {
                                        authenticationController.ObsecureSignup();
                                      },
                                      isObSecure: authenticationController.signupObSecure,
                                      validateFunction:
                                      authenticationController.passwordValidate,
                                      controller: passwordController,
                                    ),

                                    SizedBox(height: 50.h),

                                    // Login button

                                   authenticationController.loaderSignup? Center(child: CircularProgressIndicator(color: ColorConstant.whiteColor,)):ButtonWidget(
                                      text:  'Sign Up',
                                      height: 51.h,
                                      color: ColorConstant.cyanBlue,
                                      radius: 47.r,
                                      textColor: ColorConstant.whiteColor,
                                      fw: FontWeight.w700,
                                      textSize: 14.sp,
                                      onTap: (){
                                        if (formKey.currentState!.validate()) {
                                          authenticationController.loadingFunctionSignup();
                                          auth.createUserWithEmailAndPassword(
                                              email: emailController.text.toString(),
                                              password: passwordController.text.toString())
                                              .then((value) async {
                                            Get.back();
                                            authenticationController.loadingFunctionSignup();
                                            SharedPreferences sp =
                                            await SharedPreferences.getInstance();
                                            sp.setString('name', "Game User");
                                            sp.setString('email', emailController.text);
                                            FlushMessagesUtil.snackBarMessage("Success", "SignUp Successfully", context);
                                              }).onError((error, stackTrace) {
                                            authenticationController.loadingFunctionSignup();
                                            FlushMessagesUtil.snackBarMessage("Error", error.toString(), context);
                                          });
                                        }
                                      },
                                    ),

                                    SizedBox(height: 20.h),

                                    // OR divider
                                    Row(
                                      children: [
                                        Expanded(child: Divider(color: Colors.white54)),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                                          child: Text(
                                            'Or',
                                            style: TextStyle(color: Colors.white54),
                                          ),
                                        ),
                                        Expanded(child: Divider(color: Colors.white54)),
                                      ],
                                    ),
                                    SizedBox(height: 20.h),

                                    // Social media buttons


                                    ButtonWidget(
                                      sizedBoxWidth: 50.w,
                                      paddingHorizontal: 20.w,
                                      text:  'Sign in with Apple',
                                      height: 51.h,

                                      color: ColorConstant.blackColor,
                                      radius: 47.r,
                                      textColor: ColorConstant.whiteColor,
                                      fw: FontWeight.w400,
                                      textSize: 13.sp,
                                      onTap: (){
                                        authenticationController.signInWithApple(context);
                                      },
                                      icon: Icon(Icons.apple, size: 24.sp, color: Colors.white),
                                      isAuth: true,
                                    ),

                                    SizedBox(height: 8.h),
                                    ButtonWidget(
                                      sizedBoxWidth: 45.w,
                                      paddingHorizontal: 20.w,
                                      text:  'Continue with Google',
                                      height: 51.h,

                                      color: ColorConstant.whiteColor,
                                      radius: 47.r,
                                      textColor: ColorConstant.blackColor,
                                      fw: FontWeight.w400,
                                      textSize: 13.sp,
                                      onTap: (){
                                        authenticationController.handleGoogleBtnClick(context);
                                      },
                                      icon: Icon( Icons.g_mobiledata, size: 30.sp, color: Colors.pinkAccent),
                                      isAuth: true,
                                    ),
                                    SizedBox(height: 8.h),
                                    ButtonWidget(
                                      sizedBoxWidth: 45.w,
                                      paddingHorizontal: 20.w,
                                      text:  'Continue with Facebook',
                                      height: 51.h,

                                      color: ColorConstant.blueColor,
                                      radius: 47.r,
                                      textColor: ColorConstant.whiteColor,
                                      fw: FontWeight.w400,
                                      textSize: 13.sp,
                                      onTap: (){
                                        authenticationController.signInWithFacebook(context);
                                      },
                                      icon: Icon( Icons.facebook, size: 30.sp, color: ColorConstant.whiteColor),
                                      isAuth: true,
                                    ),

                                    SizedBox(height: 8.h),

                                    ButtonWidget(
                                      sizedBoxWidth: 45.w,
                                      paddingHorizontal: 20.w,
                                      text:  'Continue with Instagram',
                                      height: 51.h,

                                      color:  Colors.pink,
                                      radius: 47.r,
                                      textColor: ColorConstant.whiteColor,
                                      fw: FontWeight.w400,
                                      textSize: 13.sp,
                                      onTap: (){
                                        authenticationController.loginWithInstagram(context);
                                      },
                                      icon: Icon( Icons.camera, size: 30.sp, color: ColorConstant.whiteColor),
                                      isAuth: true,
                                    ),

                                    SizedBox(height: 20.h),
                                    // Sign-in text at the bottom
                                    FittedBox(
                                      child: Row(
                                        children: [
                                          CustomText(
                                            "Have an Account?",
                                            fw: FontWeight.w400,
                                            size: 14.sp,
                                            color: ColorConstant.whiteColor,
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Get.back();
                                              SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
                                            },
                                            child: CustomText(
                                              "Sign in",
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
                        ],),
                  ),
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}
