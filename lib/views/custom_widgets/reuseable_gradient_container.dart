import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReuseableGradientContainer extends StatelessWidget {
  final List<double>? stops;
  final List<Color>?  gradientColor;
  final double? padding;
  final double? borderRadius;
  final String? text1;
  final double? width;
  final double? height;
  final Color? color;
  final String? image;
  final double? internalPadding;
  const ReuseableGradientContainer({super.key,
    this.stops,
    this.gradientColor,
    this.padding,
    this.borderRadius,
    this.text1,
    this.width,
    this.height,
    this.color,
    this.image,
    this.internalPadding
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(padding??0.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius??0.r),
        gradient: LinearGradient(colors: gradientColor!,
          stops: stops,  // Ensure the gradient stops at the halfway point
          begin: Alignment.centerLeft, // Start the gradient from the left
          end: Alignment.centerRight,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(internalPadding??0.r),
        width: width,
        height: height,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius??0.r),
          color:color??Colors.transparent,
        ),
        child: Center(
          child: image!=null? ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius??0.r),
            child: Image.asset(
              image!,
              fit: BoxFit.fill,
            ),
          ):CustomText(
            text1,
            fw: FontWeight.w700,
            size: 24.sp,
            color: ColorConstant.whiteColor,
          ),
        ),
      ),
    );
  }
}
