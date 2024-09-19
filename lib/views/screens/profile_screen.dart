import 'package:e_squadifi/constants/enum_constant.dart';
import 'package:e_squadifi/controllers/profile_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_image_container.dart';
import 'package:e_squadifi/views/custom_widgets/custom_list_tile.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/reuseable_colum_widget.dart';
import 'package:e_squadifi/views/custom_widgets/reuseable_gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/color_constants.dart';
import '../../constants/image_constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  ProfileController profileController = Get.put(ProfileController());
  void initState() {
    // TODO: implement initState
    super.initState();
    // Set the orientation to landscape mode only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        return true;
      },
      child: GetBuilder<ProfileController>(
        builder: (profileController) {
          return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                foregroundColor: ColorConstant.whiteColor,
                leading: Padding(
                    padding: EdgeInsets.only(left: 40.w, top: 15.h),
                    child: Icon(
                      Icons.home,
                      size: 32.sp,
                    )),
                actions: [
                  Container(

                    padding: EdgeInsets.only(top: 10.h,right: 25.h),
                    child: Row(children: [
                      Stack(children: [
                        ReuseableGradientContainer(
                          gradientColor: ColorConstant.profilePicGradient,
                           width: 31.w,
                          height: 31.w,
                          padding: 4.r,
                          borderRadius: 100.r,
                          color: ColorConstant.greyColor,
                        ),
                        Positioned(
                          bottom: -5,
                          left: 6.w,
                          child: Container(
                            width: 27.w,
                            height: 35.h,
                            decoration: BoxDecoration(),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(50.r),
                                  topLeft: Radius.circular(50.r)),
                              child: Image.asset(
                                ImageConstants.profilePic,

                              ),
                            ),
                          ),
                        ),
                      ],),
                      SizedBox(width: 5.w,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        CustomText("Petter Ray",
                          fw: FontWeight.w700,
                          size: 14.sp,
                          color: ColorConstant.whiteColor,
                        ),
                        CustomText("genre player",
                          fw: FontWeight.w400,
                          size: 10.sp,
                          color: ColorConstant.whiteColor,
                        ),
                      ],),

                    ],),
                  )
                ],
              ),
              body: Container(
                height: Get.height,
                width: Get.width,
                padding: EdgeInsets.all(8.r), // Border width
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: ColorConstant. gradientBorderLandScapeColor,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: ColorConstant.gradientScreenColor,

                      begin: FractionalOffset(1.0, 1.0),
                      end: FractionalOffset(-0.2, 0.1),
                      stops: [0.0, 0.2, 0.5, 0.8, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(50.r),

                  ),
                  child: Row(
                    children: [
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
                                        Flexible(
                                          child: CustomImageContainer(
                                            height: 30.h,
                                            width: 51.w,
                                            borderRadius: 16.r,
                                            image: ImageConstants
                                                .AchievementIcons[i],
                                            onTap: () {},
                                            color: ColorConstant.iconColors[i],
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: ColorConstant.dividerColor,),
                          Container(
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
                      SizedBox(width: 10.w,),
                      Container(
                        margin: EdgeInsets.only(top: 35.h),
                        height: 429.h,
                        width: 160.w,
                        decoration: BoxDecoration(
                          color: ColorConstant.greyColor,
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(50.r),topLeft: Radius.circular(13.r))
                        ),
                        child: Column(
                          children: [
                            for(int i=0;i<EnumConstant.profileTilesText.length;i++)
                              CustomListTile(
                              height: 42.h,
                              width: 217.w,
                              size: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: ColorConstant.cyanBlue,
                              radiusBottomLeft: 14.r,
                              radiusTopLeft: 14.r,
                              text:EnumConstant.profileTilesText[i],
                              index: i,
                              onTap: (){
                              profileController.changeTileSelection(i);
                              },
                            ),
                         SizedBox(height: 5.h,),
                           ButtonWidget(
                           height: 25.h,
                             width: 140.w,
                             icon: Icon(Icons.account_balance_wallet,color: ColorConstant.whiteColor,),
                             text: "Wallet",
                             color: ColorConstant.cyanBlue,
                             radius: 47.r,
                             textSize: 12.sp,
                             fw: FontWeight.w700,
                             textColor: ColorConstant.whiteColor,
                             onTap: (){
                             },
                           ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
