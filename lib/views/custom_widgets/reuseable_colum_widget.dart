import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/reuseable_gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColumnWidget extends StatelessWidget {
  final String? text1;
  final String? text2;
  final bool? achievement;
  List<Color>? gradientColor;
  final Color? color;
  final double? height;
  final double? width;
  ColumnWidget(
      {super.key,
      this.text1,
      this.text2,
        this.achievement=false,
      this.gradientColor,
      this.color,
        this.height,
        this.width
      });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        achievement == false
            ? Container()
            :  ReuseableGradientContainer(
              text1: text1,
              borderRadius: 100.r,
          padding: 7.r,
          stops: [0.5,0.5],
          height: height,
          width: width,
          color: color,
          gradientColor: gradientColor,
        ),
        achievement == false
            ? CustomText(
                text1,
                fw: FontWeight.w700,
                size: 24.sp,
                color: ColorConstant.whiteColor,
              )
            : Container(),
        SizedBox(
          height: 5.h,
        ),
        CustomText(
          text2,
          fw: FontWeight.w400,
          size: 12.sp,
          color: ColorConstant.whiteColor,
        ),
      ],
    );
  }
}
