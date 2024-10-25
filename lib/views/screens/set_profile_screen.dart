import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/controllers/profile_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_image_container.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/screens/bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SetProfileScreen extends StatefulWidget {
  const SetProfileScreen({super.key});

  @override
  State<SetProfileScreen> createState() => _SetProfileScreenState();
}

class _SetProfileScreenState extends State<SetProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (prfileController){
        return Scaffold(
          extendBodyBehindAppBar: true,
          body:  Container(
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
              padding: EdgeInsets.all(25.r),
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
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child:  Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.w,),
                            FittedBox(
                              child: Container(
                                width: Get.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        Get.back();
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
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 25.h,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText("Set your profile",fw: FontWeight.w800,size: 32.sp,color: ColorConstant.whiteColor,),
                                  SizedBox(height: 10.h,),
                                  CustomText("Answer some questions to let you get started with your profile.",fw: FontWeight.w400,size: 13.sp,color: ColorConstant.whiteColor,),
                                  SizedBox(height: 25.h,),
                                  CustomText("Choose game you like",fw: FontWeight.w500,size: 20.sp,color: ColorConstant.whiteColor,),
                                  SizedBox(height: 10.h,),
                                  Expanded(
                                    child: GridView.builder(
                                        itemCount: 9,
                                        shrinkWrap: true,
                                        physics: BouncingScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisSpacing: 10.w,
                                            mainAxisSpacing: 10.h,
                                            //childAspectRatio: 1.r,
                                            mainAxisExtent: 140,
                                            crossAxisCount: 3
                                        ),
                                        itemBuilder: (context,index){
                                          return Stack(
                                            children: [
                                              CustomImageContainer(
                                                borderWidth: 3.w,
                                                borderColor: (prfileController.gameIndexes ?? []).contains(index)?ColorConstant.squadPurpleColor:Colors.transparent,
                                                width: 100.w,
                                                height: 133.h,
                                                image: ImageConstants.memberPost,
                                                borderRadius: 16.r,
                                                onTap: (){
                                                  prfileController.selectGames(index);
                                                },
                                              ),
                                              (prfileController.gameIndexes ?? []).contains(index)?Positioned(
                                                top: 15.h,
                                                right: 10.w,
                                                  child: ButtonWidget(
                                                  height: 16.h,
                                                    width: 16.w,
                                                    color: ColorConstant.cyanBlue,
                                                    icon: Icon(Icons.done,color: Colors.white,size: 8.sp,),
                                                    radius: 5.r,
                                              )):Container()
                                            ],
                                          );
                                        }),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ButtonWidget(
                                    radius: 47.r,
                                    color: ColorConstant.grayColor,
                                    height: 50.h,
                                    paddingHorizontal: 60.w,
                                    textColor: ColorConstant.whiteColor,
                                    textSize:14.sp,
                                    fw: FontWeight.w700,
                                    text: "Skip",
                                    onTap: (){
                                      Get.offAll(()=>BottomNavBar());
                                      prfileController.clearGameIndexes();
                                    },
                                  ),
                                  ButtonWidget(
                                    radius: 47.r,
                                    color: ColorConstant.cyanBlue,
                                    height: 50.h,
                                    paddingHorizontal: 40.w,
                                    textColor: ColorConstant.whiteColor,
                                    textSize:14.sp,
                                    fw: FontWeight.w700,
                                    text: "Continue",
                                    onTap: (){},
                                  ),
                                ],),
                            ),
                          ]
                      ),
                    ),
                  ),
                ],
              ),
            ),),
        );
      },

    );
  }
}

