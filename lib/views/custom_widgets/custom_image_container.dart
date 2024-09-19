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
    this.index
  });
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: ( profileController){
        return GestureDetector(
          onTap: onTap,
          child: Container(
            width: width,   // Set the container's width
            height: height, // Set the container's height
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 14.r), // Set the radius for the container
              border: Border.all(
                width: borderWidth ?? 1.w,
                color:index==profileController.selectedIndex? borderColor ?? Colors.transparent: Colors.transparent, // Default transparent if no border color
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius ?? 14.r), // Clip the image with same radius
              child: Image.asset(
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
