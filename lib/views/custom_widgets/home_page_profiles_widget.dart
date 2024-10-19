import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_image_container.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomePageProfilesWidget extends StatelessWidget {
  final String? image;
  final String? name;
  final VoidCallback? onTap;
  const HomePageProfilesWidget({super.key, this.image, this.name, this.onTap});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(right: 5.w),
      child: Column(children: [
        CustomImageContainer(
          onTap: onTap,
          width: 173.w,
          height: 153.h,
          image: image,
          borderRadius: 16.r,
        ),
        SizedBox(height:10.h,),
        CustomText(name,fw: FontWeight.w700,size: 22.sp,color: ColorConstant.whiteColor,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          ButtonWidget(
            marginAll: 3.r,
            radius: 6.r,
            height: 22.h,
            paddingHorizontal: 10.w,
            text: "Action",
            fw: FontWeight.w700,
            textSize: 10.sp,
            color: ColorConstant.grayColor,
            textColor: ColorConstant.whiteColor,
          ),
          ButtonWidget(
            marginAll: 3.r,
            radius: 6.r,
            height: 22.h,
            paddingHorizontal: 10.w,
            text: "Shooter",
            fw: FontWeight.w700,
            textSize: 10.sp,
            color: ColorConstant.grayColor,
            textColor: ColorConstant.whiteColor,
          ),
          ButtonWidget(
            marginAll: 3.r,
            radius: 6.r,
            height: 22.h,
            paddingHorizontal: 10.w,
            text: "RPG",
            fw: FontWeight.w700,
            textSize: 10.sp,
            color: ColorConstant.grayColor,
            textColor: ColorConstant.whiteColor,
          ),
        ],)
      ],),
    );
  }
}
