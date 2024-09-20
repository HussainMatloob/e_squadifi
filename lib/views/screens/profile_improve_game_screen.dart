import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/controllers/profile_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_image_container.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/reuseable_colum_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileImproveGameScreen extends StatefulWidget {
  const ProfileImproveGameScreen({super.key});

  @override
  State<ProfileImproveGameScreen> createState() => _ProfileImproveGameScreenState();
}

class _ProfileImproveGameScreenState extends State<ProfileImproveGameScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (profileController) {
        return Container(
          child: Row(children: [
            Stack(
              children: [
                // Match the outer container's radius
                Container(
                  width: 384.w,
                  height: 430.h,
                  decoration: BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50.r),
                        topLeft: Radius.circular(50.r)),
                    child: Image.asset(
                      ImageConstants.profileImagesList[profileController
                          .selectedIndex],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10, // Position the Row at the bottom
                  left: 0, // Align it to the left
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i < ImageConstants.profileImagesList.length; i++)
                        CustomImageContainer(
                          height: 30.h,
                          width: 54.w,
                          borderRadius: 14.r,
                          borderColor: ColorConstant.whiteColor,
                          borderWidth: 1.w,
                          image: ImageConstants.profileImagesList[i],
                          onTap: () {
                            profileController.changeProfile(i);
                          },
                          index: i,
                        ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              width: 18.w,
            ),
            Container(
              height: 397.h,
              width: 344.w,
              margin: EdgeInsets.symmetric(vertical: 5.h),
              decoration: BoxDecoration(
                  color: ColorConstant.greyColor,
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(
                      width: 1, color: ColorConstant.borderColor)),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(12.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          "Achievement(18)",
                          fw: FontWeight.w700,
                          size: 14,
                          color: ColorConstant.whiteColor,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0; i < ImageConstants.AchievementIcons.length; i++)
                               CustomImageContainer(
                                  height: 30.h,
                                  width: 51.w,
                                  borderRadius: 16.r,
                                  image: ImageConstants
                                      .AchievementIcons[i],
                                  onTap: () {},
                                  color: ColorConstant.iconColors[i],
                                ),

                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(color: ColorConstant.dividerColor,),
                  Flexible(
                    child: Container(
                        padding: EdgeInsets.all(5
                            .r),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ColumnWidget(text1: "232",
                              text2: "Friends",
                            ),
                            Container(
                              height: 70.h,
                              width: 0.1.w,
                              color: ColorConstant.whiteColor,
                            ),
                            ColumnWidget(
                              text1: "674",
                              text2: "Followers",
                            ),
                            Container(
                              height: 70.h,
                              width: 0.1.w,
                              color: ColorConstant.whiteColor,
                            ),
                            ColumnWidget(
                              text1: "674",
                              text2: "Following",
                            ),
                          ],)
                    ),
                  ),
                  Divider(color: ColorConstant.dividerColor,),
                  Flexible(
                    child: Container(
                        padding: EdgeInsets.all(4.r),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ColumnWidget(text1: "232",
                              text2: "Played Games",
                              gradientColor: ColorConstant.gameGradientColor,
                              achievement: true,
                              color: ColorConstant.greyColor,
                              height: 40.h,
                              width: 70.w,
                            ),
                            ColumnWidget(
                              text1: "674",
                              text2: "Challenges",
                              gradientColor: ColorConstant.challengesGradientColor,
                              achievement: true,
                              color: ColorConstant.greyColor,
                              height: 40.h,
                              width: 70.w,
                            ),
                            ColumnWidget(
                              text1: "674",
                              text2: "Tournaments",
                              gradientColor: ColorConstant.tournamentGradientColor,
                              achievement: true,
                              color: ColorConstant.greyColor,
                              height: 40.h,
                              width: 70.w,
                            ),
                          ],)
                    ),
                  ),
                ],
              ),
            ),

          ],),
        );
      },

    );
  }
}
