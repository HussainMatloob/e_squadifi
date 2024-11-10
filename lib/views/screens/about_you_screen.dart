import 'package:e_squadifi/constants/app_data.dart';
import 'package:e_squadifi/controllers/authentication_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/screens/about_you_aspiration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_squadifi/constants/color_constants.dart';
import 'package:get/get.dart'; // Assuming this is your constants file

class AboutYouScreen extends StatefulWidget {
  const AboutYouScreen({super.key});

  @override
  State<AboutYouScreen> createState() => _AboutYouScreenState();
}

class _AboutYouScreenState extends State<AboutYouScreen> {
AuthenticationController authenticationController=Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

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
                  child:   Column(
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
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                CustomText(
                                  'About You',
                                  fw: FontWeight.w800,
                                  size: 32.sp,
                                  color: ColorConstant.whiteColor,
                                ),

                                SizedBox(height: 10.h),

                                // Subheading
                                CustomText(
                                  'Answer some questions to let you get started with your profile.',
                                  fw: FontWeight.w400,
                                  size: 13.sp,
                                  color: ColorConstant.whiteColor,
                                ),

                                SizedBox(height: 40.h),

                                CustomText(
                                  "Date of birth:",
                                  fw: FontWeight.w600,
                                  size: 14.sp,
                                  color: ColorConstant.whiteColor,
                                ),
                                SizedBox(height: 10.h,),
                                // Age Dropdowns
                                Row(
                                  children: [
                                    Expanded(
                                      child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: ColorConstant.greyColor,
                                          hintText: 'Year',
                                          hintStyle:
                                          TextStyle(color: Colors.white.withOpacity(0.6)),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12.r),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                        dropdownColor: ColorConstant.greyColor,
                                        value: authenticationController.selectedYear,
                                        onChanged: (newValue) {
                                          authenticationController.selectYear(newValue!);
                                        },
                                        items: AppData.years.map((year) {
                                          return DropdownMenuItem<String>(
                                            value: year,
                                            child: Text(
                                              year,
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Expanded(
                                      child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor:  ColorConstant.greyColor,
                                          hintText: 'Month',
                                          hintStyle:
                                          TextStyle(color: Colors.white.withOpacity(0.6)),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12.r),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                        dropdownColor: ColorConstant.greyColor,
                                        value:authenticationController.selectedMonth,
                                        onChanged: (newValue) {
                                          authenticationController.selectMonth(newValue!);
                                        },
                                        items:AppData.months.map((month) {
                                          return DropdownMenuItem<String>(
                                            value: month,
                                            child: Text(
                                              month,
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                CustomText(
                                  "Gender",
                                  fw: FontWeight.w600,
                                  size: 14.sp,
                                  color: ColorConstant.whiteColor,
                                ),
                                SizedBox(height: 10.h,),

                                // Gender Selection
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      for(int i =0;i<AppData.genderList.length;i++)
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.w),
                                          child: ButtonWidget(
                                            borderColor: ColorConstant.cyanBlue,
                                            borderWidth: 2.sp,
                                            text: AppData.genderList[i],
                                            height: 48.h,
                                            color: authenticationController.gender==AppData.genderList[i]
                                                ? ColorConstant.cyanBlue
                                                : Colors.transparent,
                                            radius: 90.r,
                                            textColor:  authenticationController.gender==AppData.genderList[i]?ColorConstant.whiteColor:ColorConstant.cyanBlue,
                                            fw: FontWeight.w700,
                                            textSize: 14.sp,
                                            paddingHorizontal: 25.w,
                                            onTap: () {
                                              authenticationController.selectGender(AppData.genderList[i]);
                                            },
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 40.h),

                                // Next Button

                                ButtonWidget(
                                  text:  'Next',
                                  height: 51.h,
                                  color: ColorConstant.cyanBlue,
                                  radius: 47.r,
                                  textColor: ColorConstant.whiteColor,
                                  fw: FontWeight.w700,
                                  textSize: 14.sp,
                                  onTap: (){
                                    Get.to(( )=>AboutYouAspirationScreen());
                                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
                                  },
                                ),
                              ],),
                            ),
                          ),
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
            ),
          ),
        );
      },
    );
  }
}


