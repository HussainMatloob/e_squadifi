import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_list_tile.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/screens/community_name_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              CustomText(
                "Start A",
                fw: FontWeight.w700,
                size: 32.sp,
                color: ColorConstant.whiteColor,
              ),
              CustomText(
                "Community",
                fw: FontWeight.w700,
                size: 32.sp,
                color: ColorConstant.whiteColor,
              ),
              SizedBox(
                height: 70.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 134.h,
                    width: 147.w,
                    decoration: BoxDecoration(
                      color: ColorConstant.cyanBlue,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.groups_3,
                        color: ColorConstant.whiteColor,
                        size: 50.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 70.h,
              ),
              CustomListTile(
                text: "Reach out t0 5,000 members with announcement",
                color: ColorConstant.whiteColor,
                icon: Icon(
                  Icons.speaker,
                  color: ColorConstant.whiteColor,
                  size: 30,
                ),
                fw: FontWeight.w500,
                textSize: 16.sp,
                fontStyle: FontStyle.italic,
                sizedBoxedWidth: 15.w,
              ),
              SizedBox(
                height: 12.h,
              ),
              CustomListTile(
                text: "Organize your squads,team and more",
                color: ColorConstant.whiteColor,
                icon: Icon(
                  Icons.groups_3,
                  color: ColorConstant.whiteColor,
                  size: 30,
                ),
                fw: FontWeight.w500,
                textSize: 16.sp,
                fontStyle: FontStyle.italic,
                sizedBoxedWidth: 15.w,
              ),
              SizedBox(
                height: 90.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonWidget(
                    text: "Get Started",
                    width: 311.w,
                    height: 51.h,
                    color: ColorConstant.cyanBlue,
                    radius: 47.r,
                    textColor: ColorConstant.whiteColor,
                    fw: FontWeight.w700,
                    textSize: 14.sp,
                    onTap: (){
                      Get.to(()=>CommunityNameScreen());
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 100.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
