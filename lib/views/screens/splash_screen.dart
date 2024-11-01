import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/controllers/authentication_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, });
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    // Force portrait orientation for this screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
  @override
  void dispose() {
    super.dispose();
    // Optionally, reset orientation back to portrait when leaving this screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
  AuthenticationController authenticationController=Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
      builder: (authenticationController){
        return  Scaffold(
          body:
          Container(
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
              child:  Container(

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:ColorConstant.primaryGradiantColor,

                    begin: FractionalOffset(1.0,1.0),
                    end: FractionalOffset(-0.2,0.1),
                    // begin: Alignment.topLeft, // Start the gradient at top-left
                    // end: Alignment.bottomRight, // End the gradient at bottom-right
                    stops: [0.0, 0.2, 0.5, 0.8, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(50.r),
                  // border: Border.all(width: 10,color: Colors.purple)
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 76.h),
                      width: 820.w,    // Set width
                      height: 546.h,   // Set height
                      child: Image.asset(
                        ImageConstants.gameController, // Replace with your image path
                        fit: BoxFit.fill,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(children: [
                            SizedBox(height: 150.h,),
                            Stack(children: [
                              FittedBox(
                                child: Container(
                                  margin: EdgeInsets.only(left: 190.w,top: 140.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(167.r),
                                      color:Color(0x20394F73),
                                      boxShadow:[BoxShadow(
                                          color: Color(0x20394F73).withOpacity(0.70.r),
                                          blurRadius: 50.r, // High blur radius for a soft blur effect
                                          spreadRadius: 120.r,
                                          offset: Offset(0,0)
                                      )]
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 80.h),
                                width: 345.w,
                                height: 80.h,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Image.asset(
                                  ImageConstants.appLogo, // Replace with your image path
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],),
                            SizedBox(height: 200.h,),
                            Flexible(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child:   CustomText("Your Story, Your game, your Future",
                                  fw: FontWeight.w800,
                                  size: 32.h,
                                  color: ColorConstant.whiteColor,
                                ),
                              ),
                            ),
                            FittedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    //width: 136.w,    // Set width
                                    height: 102.h,   // Set height
                                    child: ClipRRect(
                                      child: Image.asset(
                                        ImageConstants.vectorImage, // Replace with your image path
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),

                                  Container(
                                    margin: EdgeInsets.only(top: 35.h),
                                    //width: 173.w,
                                    height: 51.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(47.r),
                                        color: ColorConstant.darkBlueColor
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 20.w,right: 10.w),
                                      child: GestureDetector(
                                        onTap:() {
                                          authenticationController.isUserLogin();
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText("Get Started",
                                              fw: FontWeight.w700,
                                              size: 14.sp,
                                              color: ColorConstant.whiteColor,
                                            ),
                                            SizedBox(width: 3.w,),
                                            Container(
                                              height: 37.h,
                                              width: 37.w,
                                              decoration: BoxDecoration(color: ColorConstant.greyColor,
                                                  borderRadius: BorderRadius.circular(100)
                                              ),
                                              child: Center(child: Icon(Icons.arrow_forward,color: Colors.white,)),
                                            ),
                                          ],),
                                      ),
                                    ),
                                  ),

                                ],),
                            )
                          ],),
                        )
                      ],)
                  ],
                ),
              )
          ),
        );
      },

    ) ;
  }
}

