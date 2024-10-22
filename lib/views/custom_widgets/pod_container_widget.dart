import 'package:avatar_stack/avatar_stack.dart';
import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/screens/squad_pod_video_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PodContainer extends StatelessWidget {
  final String? videoUrl;
  final double? height;
  final double? width;
  final String? title;
  final String? subtitle;
  final String? podFriends;
  final String? podViews;
  final Color? color1;
  final Color? color2;
  const PodContainer({super.key,
    this.height,
    this.width,
    this.title,
    this.subtitle,
    this.podFriends,
    this.podViews,
    this.color1,
    this.color2, this.videoUrl
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      },
      child: Container(
        padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
             color: color1,
            borderRadius: BorderRadius.circular(20.r),
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          CustomText(title,fw: FontWeight.w500,size: 16.sp,color: ColorConstant.whiteColor,),
            CustomText(subtitle,fw: FontWeight.w400,size: 14.sp,color: color2,),
            SizedBox(height: 10.h,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              height: 40.h,
              width: 176.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(37.r),
                color: color2
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
               Row(children: [
                 Icon(Icons.person,color:ColorConstant.whiteColor,),
                 SizedBox(width: 5.w,),
                 CustomText(podFriends,fw: FontWeight.w500,size: 12.sp,color:ColorConstant.whiteColor,),
               ],),
                  Row(children: [
                    Icon(Icons.remove_red_eye,color:ColorConstant.whiteColor,),
                    SizedBox(width: 5.w,),
                    CustomText(podViews,fw: FontWeight.w500,size: 12.sp,color:ColorConstant.whiteColor,),
                  ],)
              ],),
            ),
            SizedBox(height: 15.h,),
            Container(
              width: 175.w,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AvatarStack(
                    height: 30.h,
                    width: 70.w,
                    avatars: [
                      for (var n = 0; n < ImageConstants.profileImagesList.length; n++)
                        AssetImage(ImageConstants.profileImagesList[n]),
                    ], borderWidth: 0,),
                ButtonWidget(
                  height: 29.h,
                  width: 57.h,
                  color: color2,
                  text: "Add",
                  textColor: ColorConstant.whiteColor,
                  fw: FontWeight.w700,
                  textSize: 14.sp,
                  radius: 48.r,
                ),
              ],),
            )
          ],),
        ),
    );

  }
}
