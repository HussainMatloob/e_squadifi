import 'package:e_squadifi/constants/app_data.dart';
import 'package:e_squadifi/controllers/authentication_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text_form_field.dart';
import 'package:e_squadifi/views/screens/about_you_personalityscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_squadifi/constants/color_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Assuming this is your constants file

class AboutYouAspirationScreen extends StatefulWidget {
  const AboutYouAspirationScreen({super.key});

  @override
  State<AboutYouAspirationScreen> createState() => _AboutYouAspirationScreenState();
}

class _AboutYouAspirationScreenState extends State<AboutYouAspirationScreen> {
  String selectedGoal = '';

AuthenticationController authenticationController=Get.put(AuthenticationController());
  TextEditingController yourSelfController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

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
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    gradient: LinearGradient(
                      colors: ColorConstant.primaryGradiantColor,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
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
                        child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Back Button

                              SizedBox(height: 20.h),

                              // Heading
                              CustomText(
                                'About You',
                                fw: FontWeight.w800,
                                size: 32.sp,
                                color: ColorConstant.whiteColor,
                              ),

                              SizedBox(height: 10.h),

                              // Goals and Aspirations Text
                              CustomText(
                                'Which of the following activities do you enjoy in your free time?',
                                fw: FontWeight.w400,
                                size: 13.sp,
                                color: ColorConstant.whiteColor,
                              ),

                              SizedBox(height: 20.h),

                              CustomText(
                                'List of goals and aspiration',
                                fw: FontWeight.w600,
                                size: 14.sp,
                                color: ColorConstant.whiteColor,
                              ),
                              SizedBox(height: 15.h),
                              // Goals and Aspirations (Dynamic Buttons)
                              Wrap(
                                alignment: WrapAlignment.start,
                                //direction: Axis.horizontal,
                                spacing: 10.w,
                                runSpacing: 15.w,
                                children:AppData.goals
                                    .map((goal) => FittedBox(
                                  child: Row(
                                    children: [
                                      ButtonWidget(
                                        borderColor: ColorConstant.cyanBlue,
                                        borderWidth: 2.sp,
                                        text:  goal,
                                        height: 48.h,
                                        color: (authenticationController.selectedGoals ?? []).contains(goal)
                                            ? ColorConstant.cyanBlue
                                            : Colors.transparent,
                                        radius: 90.r,
                                        textColor: (authenticationController.selectedGoals?? []).contains(goal)?ColorConstant.whiteColor:ColorConstant.cyanBlue,
                                        fw: FontWeight.w700,
                                        textSize: 14.sp,
                                        paddingHorizontal: 15.w,
                                        onTap: () {
                                          authenticationController.selectOrRemoveGoal(goal);
                                        },
                                      ),
                                    ],
                                  ),
                                ),).toList(),
                              ),
                              SizedBox(height: 30.h),

                              // Text Area - Tell us a bit about yourself
                              CustomText(
                                'Tell us a bit about yourself.',
                                fw: FontWeight.w600,
                                size: 14.sp,
                                color: ColorConstant.whiteColor,
                              ),
                              SizedBox(height: 10.h),

                              // Input Box for typing
                              CustomTextFormField(
                                horizontalPadding: 15.w,
                                width: 312.w,
                                height: 137.h,
                                controller:  yourSelfController,
                                color: ColorConstant.greyColor,
                                hintText: "start Typing here....",
                              ),
                              SizedBox(height: 20.h),

                              // Next Button
                              ButtonWidget(
                                text:  'Next',
                                height: 51.h,
                                color: ColorConstant.cyanBlue,
                                radius: 47.r,
                                textColor: ColorConstant.whiteColor,
                                fw: FontWeight.w700,
                                textSize: 14.sp,
                                onTap: () async{
                                  authenticationController.loadingFunctionSignup();
                                  SharedPreferences sp =
                                      await SharedPreferences.getInstance();
                                  sp.setString('about', yourSelfController.text);
                                  Get.to(()=>AboutYouPersonalityScreen());
                                  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
                                },
                              ),
                              SizedBox(height: 20.h),
                              // User Agreement and Privacy Policy
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'User Agreement',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  Text(
                                    'Privacy & Cookie Policy',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

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

