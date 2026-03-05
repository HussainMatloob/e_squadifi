import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_image_container.dart';
import 'package:e_squadifi/views/custom_widgets/custom_list_tile.dart';
import 'package:e_squadifi/views/custom_widgets/custom_popup.dart';

import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/percentage_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ImproveGamingCard extends StatelessWidget {
  final CustomPopupMenuController _controller = CustomPopupMenuController();
  final String? text;
  final Color? color;
  final double? height;
  final double? width;
  final Image? image;
  final FontWeight? fw;
  final Icon?  icon;
  final double? textSize;
  final double? radius;
  final Color? textColor;
  final VoidCallback? onTap;
  final double? padding;
  final double? margin;

  ImproveGamingCard({super.key,
    this.text,
  this.color,
    this.height,
    this.width,
    this.image,
    this.fw,
    this.icon,
    this.textSize,
    this.radius,
    this.textColor,
    this.onTap,
    this.padding,
    this.margin
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding??0.r),
      margin: EdgeInsets.only(right: margin??0.r),
      width: width??0.w,
      height: height??0.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius??0.r),
        border: Border.all(width: 1.w,color: ColorConstant.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           CustomImageContainer(
             image: ImageConstants.AchievementIcons[3],
             height: 26.h,
             width: 52.w,
             color: ColorConstant.iconColors[3],
             borderRadius: 16.r,
           ),
            CustomPopUpDialog(
               height: Get.height/2.h,
              width: 199.w,
              color:  ColorConstant.purpleLightColor,
              icon: Icon(Icons.more_horiz,color: ColorConstant.iconColor,),
              child: Container(
                padding: EdgeInsets.all(15.r),
                child: Column(
                  children: [
                    CustomListTile(
                      text: "Edit",
                      color: ColorConstant.whiteColor,
                      icon: Icon(Icons.edit,size: 19.sp,color: ColorConstant.whiteColor,),
                      onTap: (){},
                      fw: FontWeight.w700,
                      textSize: 16.sp,
                      sizedBoxedWidth: 10.w,
                    ),
                    SizedBox(height: 8.h),
                    CustomListTile(
                      text: "Delete",
                      color: ColorConstant.whiteColor,
                      icon: Icon(Icons.delete,size: 19.sp,color: ColorConstant.whiteColor,),
                      onTap: (){},
                      fw: FontWeight.w700,
                      textSize: 16.sp,
                      sizedBoxedWidth: 10.w,
                    ),
                    SizedBox(height: 8.h),
                    CustomListTile(
                      text: "Complete Goal",
                      color: ColorConstant.whiteColor,
                      icon: Icon(Icons.emoji_events_outlined,size: 19.sp,color: ColorConstant.whiteColor,),
                      onTap: (){},
                      fw: FontWeight.w700,
                      textSize: 16.sp,
                      sizedBoxedWidth: 10.w,
                    ),

                  ],),
              ),

            ),
        ],),
        SizedBox(height: 3.h,),
        CustomText(text,color: textColor,fw: fw,size: textSize,),
          PercentageLine(
            percentage: 50, // Set the percentage here
          ),
      ],),
    );
  }
}
