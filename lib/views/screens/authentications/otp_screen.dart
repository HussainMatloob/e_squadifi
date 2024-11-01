import 'package:e_squadifi/controllers/authentication_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/screens/create_avatar_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_squadifi/constants/color_constants.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  AuthenticationController authenticationController=Get.put(AuthenticationController());
  @override
  String pinCode = '';
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
      builder: (authenticationController){
        return GestureDetector(
          onTap: (){
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
            FocusScope.of(context).unfocus();
          },
          child: WillPopScope(
            onWillPop: () async{
              SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
              return true;
            },
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
                  padding:EdgeInsets.all(20.r),
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    gradient: LinearGradient(
                      colors: ColorConstant.primaryGradiantColor,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Back Button
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
                            SizedBox(height: 20.h),

                            // Heading
                            CustomText(
                              'Code Verification',
                              fw: FontWeight.w800,
                              size: 32.sp,
                              color: ColorConstant.whiteColor,
                            ),

                            SizedBox(height: 10.h),

                            // Goals and Aspirations Text
                            CustomText(
                              'Enter Verification code you received in your email.',
                              fw: FontWeight.w400,
                              size: 13.sp,
                              color: ColorConstant.whiteColor,
                            ),
                            SizedBox(height: 20.h),
                            // Code Input Boxes
                            PinCodeTextField(
                              appContext: context,
                              length: 6,
                              cursorColor: Colors.teal,
                              keyboardType: TextInputType.number,
                              //obscureText: true,
                              //obscuringCharacter: '*',
                              enabled: true,
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(10),
                                fieldHeight: 45.h,
                                fieldWidth: 45.w,
                                // Hide border by setting its color to transparent
                                activeColor: Colors.transparent,
                                inactiveColor: Colors.transparent,
                                selectedColor: Colors.transparent,

                                // Ensure background is gray for all states
                                activeFillColor: ColorConstant.greyColor,   // Background when active
                                inactiveFillColor: ColorConstant.greyColor, // Background when inactive
                                selectedFillColor: ColorConstant.greyColor, // Background when selected
                              ),
                              // Set text color to white
                              textStyle: TextStyle(
                                color: Colors.white,  // White text color
                                fontSize: 20,         // You can adjust the font size as needed
                              ),
                              onCompleted: (value) {
                                pinCode = value;
                              },
                              onChanged: (value) {
                                 authenticationController.pinCodeUpdateLength(value);
                              }
                              ,enableActiveFill: true,
                            ),
                            Row(children: [
                              CustomText(
                                "Didn't get the Code? ",
                                fw: FontWeight.w400,
                                size: 12.sp,
                                color: ColorConstant.whiteColor,
                              ),
                              TextButton(onPressed: (){
                                authenticationController.verifyPhoneNumber(
                                     authenticationController.mobileNumber??"",context,"resend");
                              }, child: CustomText("Resend Code",
                                fw: FontWeight.w700,
                                size: 12.sp,
                                color: ColorConstant.whiteColor,)),
                            ],),

                            SizedBox(height: 30.h),
                            // Verify Code Button
                            authenticationController.otpLoader?Center(child: CircularProgressIndicator(color: ColorConstant.whiteColor,),) :ButtonWidget(
                              text:  'Verify Code',
                              height: 51.h,
                              color: ColorConstant.cyanBlue,
                              radius: 47.r,
                              textColor: ColorConstant.whiteColor,
                              fw: FontWeight.w700,
                              textSize: 14.sp,
                              onTap: () async{
                                if (authenticationController.pinCodeLength.length == 6) {
                                  authenticationController.loaderOfOtp();
                                  authenticationController.submitVerificationCode(
                                      pinCode,  authenticationController.verificationID,context);
                                }
                              },
                            ),
                            SizedBox(height: 20.h),

                            // Resend Code

                          ],
                        ),

                      ),
                    ],
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
