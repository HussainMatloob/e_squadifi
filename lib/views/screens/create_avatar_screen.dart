import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_image_container.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/screens/set_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateAvatarScreen extends StatefulWidget {
  const CreateAvatarScreen({super.key});

  @override
  State<CreateAvatarScreen> createState() => _CreateAvatarScreenState();
}

class _CreateAvatarScreenState extends State<CreateAvatarScreen> {
  @override
  Widget build(BuildContext context) {

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
                                SizedBox(width: 15.w,),

                                InkWell(
                                    onTap: (){
                                      Get.to(( )=>SetProfileScreen());
                                    },
                                    child: Container(child: CustomText("Skip",fw: FontWeight.w700,size: 14.sp,color: ColorConstant.whiteColor,))),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 25.h,),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              CustomText("Create a Avatar for Yourself",fw: FontWeight.w800,size: 32.sp,color: ColorConstant.whiteColor,),
                                SizedBox(height: 10.h,),
                                CustomText("Give yourself a unique character to play the game with your squad.",fw: FontWeight.w400,size: 13.sp,color: ColorConstant.whiteColor,),
                               SizedBox(height: 25.h,),
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   CustomImageContainer(
                                     color: ColorConstant.grayColor,
                                     image: ImageConstants.profilePic,
                                     width: 255.w,
                                     height: 255.h,
                                     borderRadius: 127.r,
                                   ),
                                   SizedBox(height: 25.h,),
                                   ButtonWidget(
                                     textColor: ColorConstant.whiteColor,
                                     radius: 47.r,
                                     fw: FontWeight.w700,
                                     textSize: 14.sp,
                                     text: "Take a Picture",
                                     height: 50.h,
                                     paddingHorizontal: 30.w,
                                     color: ColorConstant.cyanBlue,
                                     onTap: (){

                                     },
                                   ),
                               ],),

                              ],
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
              ),
            ],
          ),
        ),),
    );

  }
}
