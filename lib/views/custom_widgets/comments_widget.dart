import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_image_container.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentsWidget extends StatefulWidget {
  const CommentsWidget({super.key});
  @override
  State<CommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            CustomImageContainer(
              image: ImageConstants.profileImagesList[0],
              height: 36.h,
              width: 36.h,
              borderRadius: 100.r,
            ),
            SizedBox(width: 10.w,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                CustomText("Johan Mic",size:12.sp,fw: FontWeight.w400,color: ColorConstant.whiteColor,),
                SizedBox(height: 5.h,),
                CustomText("I hate this, Why you always ignoring me!",size:16.sp,fw: FontWeight.w400,color: ColorConstant.whiteColor,),
              ],),
            ),]
      ),
    );

  }
}
