import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_list_tile.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/reuseable_gradient_container.dart';
import 'package:e_squadifi/views/screens/squad_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InviteSquadMemberScreen extends StatefulWidget {
  const InviteSquadMemberScreen({super.key});

  @override
  State<InviteSquadMemberScreen> createState() =>
      _InviteSquadMemberScreenState();
}

class _InviteSquadMemberScreenState extends State<InviteSquadMemberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.all(8.r), // Border width
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: ColorConstant.gradientBorderColor,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: ColorConstant.primaryGradiantColor,

              begin: FractionalOffset(1.0, 1.0),
              end: FractionalOffset(-0.2, 0.1),
              // begin: Alignment.topLeft, // Start the gradient at top-left
              // end: Alignment.bottomRight, // End the gradient at bottom-right
              stops: [0.0, 0.2, 0.5, 0.8, 1.0],
            ),
            borderRadius: BorderRadius.circular(50.r),
            // border: Border.all(width: 10,color: Colors.purple)
          ),
          child: Container(
            padding: EdgeInsets.all(20.r),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            SystemChrome.setEnabledSystemUIMode(
                                SystemUiMode.immersiveSticky);
                            Get.back();
                          },
                          child: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            child: Center(
                              child: Icon(
                                CupertinoIcons.back,
                                color: ColorConstant.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        SystemChrome.setEnabledSystemUIMode(
                            SystemUiMode.immersiveSticky);
                        Get.back();
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.search,
                            color: ColorConstant.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20.r),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.w,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ReuseableGradientContainer(
                                    height: 62.h,
                                    width: 63.w,
                                    borderRadius: 28.r,
                                    gradientColor:
                                        ColorConstant.profilePicGradient,
                                    padding: 2.r,
                                    image: ImageConstants.profileImagesList[3],
                                    color: ColorConstant.purple,
                                    internalPadding: 5.r,
                                    onTap: () {
                                      Get.to(() => SquadProfileScreen());
                                    },
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        "Squad Name",
                                        fw: FontWeight.w700,
                                        size: 18.sp,
                                        color: ColorConstant.whiteColor,
                                      ),
                                      CustomText(
                                        "squad. 2 group",
                                        fw: FontWeight.w400,
                                        size: 14.sp,
                                        color: ColorConstant.whiteColor,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50.w,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(20.r),
                                    width: 310.w,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.greyLightColor,
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: CustomListTile(
                                      text: "Invite squad members",
                                      color: ColorConstant.whiteColor,
                                      icon: Icon(
                                        Icons.person_outline,
                                        color: ColorConstant.whiteColor,
                                        size: 20,
                                      ),
                                      fw: FontWeight.w500,
                                      textSize: 14.sp,
                                      fontStyle: FontStyle.italic,
                                      sizedBoxedWidth: 12.w,
                                      width: 32.w,
                                      height: 32.h,
                                      containerColor:
                                          ColorConstant.dullPurpleColor,
                                      borderRadius: 8.r,
                                      onTap: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
