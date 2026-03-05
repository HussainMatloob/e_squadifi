import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PercentageLine extends StatelessWidget {
  final int percentage;
  const PercentageLine({super.key, required this.percentage,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // LinearPercentIndicator widget
        LinearPercentIndicator(
          width: 156.w, // Width of the progress bar
          lineHeight: 1.3.h, // Height of the progress bar
          percent: percentage / 100, // Convert percentage to value between 0 and 1
          backgroundColor: ColorConstant.whiteColor, // Background color of the line
          progressColor: ColorConstant.purpleLightColor, // Color of the filled portion based on percentage
          linearStrokeCap: LinearStrokeCap.roundAll, // Round edges of the line
        padding: EdgeInsets.zero,
        ),
        // Percentage Text
        SizedBox(width: 4.w),
        CustomText(
          '${percentage}%', // Display percentage with 1 decimal
           fw: FontWeight.w700,
          size: 13.sp,
          color: ColorConstant.whiteColor,
        ),
      ],
    );
  }
}
