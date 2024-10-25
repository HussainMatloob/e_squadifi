import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_image_container.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text_form_field.dart';
import 'package:e_squadifi/views/custom_widgets/reuseable_gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LatestStreamWidget extends StatelessWidget {
  const LatestStreamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
     // height: 412.h,
      width: 327.w,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.sp),
        gradient: LinearGradient(
          colors: ColorConstant.wildCatColor,
          begin: Alignment.topCenter,
          end:  Alignment.bottomCenter,
          //stops:  [0.5, 0.5],
        ),
      ),
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(20.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Row(children: [
              Container(
                padding: EdgeInsets.all(4.r),
                width: 61.w,
                height: 70.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(33.r),
                    border: Border.all(width: 3.w,color:ColorConstant.borderColor)),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(33.r),
                    color: ColorConstant.lighterCyanBlue),
              child: CustomImageContainer(
                image: ImageConstants.wildAvatar,
              ),
              ),
              ),
               SizedBox(width: 10.w,),
               Column(children: [
                 CustomText("Wild Cat",size:18.sp ,fw: FontWeight.w700,color: ColorConstant.whiteColor,),
                 CustomText("genre player",size:12.sp ,fw: FontWeight.w400,color: Colors.white70,),
               ],)
            ],),
            Icon(Icons.more_horiz,color: ColorConstant.whiteColor,),
        ],),),
        CustomImageContainer(image: ImageConstants.wildPic,width: 327.w,height: 200.h,),
        Container(
      padding: EdgeInsets.all(20.r),
      child: Row(children: [
        ReuseableGradientContainer(
          gradientColor: ColorConstant.profilePicGradient,
          width: 42.w,
          height: 48.w,
          padding: 2.r,
          borderRadius: 30.r,
          color: ColorConstant.greyColor,
          image:  ImageConstants.profilePic,
        ),
        SizedBox(width: 10.w,),
        Expanded(
          child: CustomTextFormField(
            horizontalPadding: 15.w,
            borderColor: Colors.transparent,
            focusedBorderColor: Colors.transparent,
            hintTextColor: Colors.white54,
            hintTextFw: FontWeight.w400,
            hintTextSize: 12.sp,
            fillColor: ColorConstant.searchFieldColor,
           // height: 42.h,
            hintText: "Write down your comment",
          ),
        ),
        ],),)
      ],),
    );
  }
}
