import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_image_container.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/improve_gaming_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileGoalsScreen extends StatefulWidget {
  const ProfileGoalsScreen({super.key});

  @override
  State<ProfileGoalsScreen> createState() => _ProfileGoalsScreenState();
}

class _ProfileGoalsScreenState extends State<ProfileGoalsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 42.h),
      padding: EdgeInsets.symmetric(
          horizontal:30.w
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              for(int i=0;i<3;i++)
                ImproveGamingCard(
                  height: 60.h,
                  width: 211.w,
                  text: "Improve gaming Skill",
                  fw: FontWeight.w700,
                  textSize: 14.sp,
                  color: ColorConstant.greyColor,
                  padding: 10.r,
                  textColor: ColorConstant.whiteColor,
                  radius: 14.r,
                  margin: 15.r,
                ),
            ],),
          SizedBox(height: 12.h,),
          CustomText("Courses",
            fw: FontWeight.w700,
            size: 18.sp,
            color: ColorConstant.whiteColor,
          ),
          CustomText("These courses will help you to reach your goal.",
            fw: FontWeight.w400,
            size: 12.sp,
            color: ColorConstant.whiteColor,
          ),
          SizedBox(height: 8.h,),
          Flexible(
            child: SizedBox(
              width: 600.w,
              //height: 75.h,
              child: GridView.builder(
                // shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.zero,
                // physics: NeverScrollableScrollPhysics(parent: BouncingScrollPhysics()),  // Disable GridView's internal scrolling
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 15.h,
                  // childAspectRatio: 1,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return CustomImageContainer(
                    image: ImageConstants.profileImagesList[2],
                    width: 40.w,
                    height: 40.h,
                    borderRadius: 16.r,
                  );
                },
              ),
            ),
          ),

        ],),
    );
  }
}
