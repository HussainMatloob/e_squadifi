import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/controllers/live_streaming_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/reuseable_gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomListTile extends StatelessWidget {
  final Icon? icon;
  final Color? color;
  final String? text;
  final VoidCallback? onTap;
  final FontWeight? fw;
  final double? textSize;
  final FontStyle? fontStyle;
  final double? sizedBoxedWidth;
  final double? height;
  final double? width;
  final Color? containerColor;
  final double? borderRadius;
  final String? image;
  final bool?  isDialog;
  final Icon?  tralingIcon;
  final String? tralingText;
  const CustomListTile({super.key,
    this.icon,
    this.color,
    this.text,
    this.onTap,
  this.textSize,
    this.fw,
    this.fontStyle,
    this.sizedBoxedWidth,
    this.height,
    this.width,
    this.containerColor,
    this.borderRadius,
    this.image,
    this.isDialog=false, this.tralingIcon, this.tralingText
  });
  @override
  Widget build(BuildContext context) {
  return InkWell(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(children: [
              image==null?icon==null?Container():height==null&&width==null?icon!:Container(
                  width: width??0.r,
                  height: height??0.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius??0.r),
                    color: containerColor,
                  ),
                  child: Center(child: icon!)):ReuseableGradientContainer(
                height: 36.h,
                width: 36.w,
                borderRadius: 16.r,
                image: image,
                padding: 1.r,
                gradientColor: ColorConstant.profilePicGradient,
                color: ColorConstant.greyColor,
                internalPadding: 3.r,
              ),
              SizedBox(width: sizedBoxedWidth??0.w,),
              Flexible(child: CustomText(text,fw: fw,size: textSize,color: color,fontStyle: fontStyle ))
            ],),
        ),
        isDialog! ? tralingText==null?Transform.scale(
    scale: 0.9,  // This controls the size of the switch
    child: GetBuilder<LiveStreamingController>(
      builder: (liveStreamingController){
        return Switch(
          value: liveStreamingController.isSwitchedOn,
          onChanged: (value) {
            liveStreamingController.switchedButton();
          },
          activeColor: ColorConstant.whiteColor,            // Color of the thumb when the switch is ON
          activeTrackColor: ColorConstant.cyanBlue,  // Color of the track when the switch is ON
          inactiveThumbColor: ColorConstant.whiteColor,      // Color of the thumb when the switch is OFF
          inactiveTrackColor: ColorConstant.cyanBlue,     // Color of the track when the switch is OFF
        );
      },

    ),
    ):Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            CustomText(tralingText,fw: FontWeight.w700,size: 18.sp,color: color,fontStyle: fontStyle ),
              SizedBox(width: sizedBoxedWidth??0.w,),
              Container(child: tralingIcon,),
            ],)
        :Container()
      ],
    ),
  );
  }
}


