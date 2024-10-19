import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/profile_controller.dart';

class CustomImageContainer extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? height;
  final double? width;
  final String? image;
  final Color? borderColor;
  final double? borderRadius;
  final double? borderWidth;
  final VoidCallback? onTap;
  final int? index;
  final double? marginBottom;
  final double? marginTop;
  final double? marginLeft;
  final double? marginRight;
  const CustomImageContainer({super.key,
    this.text,
    this.color,
    this.height,
    this.width,
    this.image,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.onTap,
    this.index,
  this.marginBottom,
    this.marginTop,
    this.marginLeft,
    this.marginRight
  });
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: ( profileController){
        return GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(bottom: marginBottom??0.r, top: marginTop??0.r,left: marginLeft??0.r),
            width: width,   // Set the container's width
            height: height, // Set the container's height
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 0.r), // Set the radius for the container
              border: Border.all(
                width: borderWidth ?? 0.w,
                color:index==null?borderColor??Colors.transparent:index==profileController.selectedIndex? borderColor ?? Colors.transparent: Colors.transparent, // Default transparent if no border color
              ),
              color: color??Colors.transparent
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius ?? 0.r), // Clip the image with same radius
              child: Image.asset(
                height: height,
                width: width,
                image ?? "",  // Fallback to empty string if no image is provided
                fit: BoxFit.cover, // Ensure the image covers the container fully
              ),
            ),
          ),
        );
      },
    );

  }
}
