import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_image_container.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImproveGamingCard extends StatelessWidget {
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

  const ImproveGamingCard({super.key,
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
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding??0.r),
      width: width,
      height: height,
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
             height: 52,
             width: 52,
             color: ColorConstant.iconColors[3],
           ),

        ],),
        CustomText(text,color: textColor,fw: fw,size: textSize,),
      ],),
    );
  }
}
