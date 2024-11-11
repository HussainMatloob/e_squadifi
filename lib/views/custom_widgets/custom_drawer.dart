import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/controllers/authentication_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_image_container.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../screens/challenge.dart';
import '../screens/challenge_details_screen.dart';
import '../screens/connect_video_game_screen.dart';
import '../screens/games_list_screen.dart';
import '../screens/new_promotion_screen.dart';
import '../screens/player_user_list_screen.dart';
import '../screens/set_token _Screen.dart';
import '../screens/user_List_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
      init: AuthenticationController(),
      builder: (authenticationController)
      {
       return Drawer(
          child: Container(

            child: Container(
              color: ColorConstant.deepPurpleColor,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    child:Row(
                      children: [
                        CustomImageContainer(image:ImageConstants.appLogo,height: 200.h,width: 200.w,),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.deepPurpleColor, // Set the background color here
                    ),
                  ),


                  ListTile(
                    title: CustomText("Live Videos",
                      size: 16.sp,
                      fw: FontWeight.w700,
                      color: ColorConstant.whiteColor,
                    ),
                    // trailing: Text("6:30"),
                    onTap: () {
                      Get.to(( )=>GamesListScreen());
                    },
                    leading: Icon(Icons.live_tv,color: ColorConstant.whiteColor,),
                  ),
                  Divider(
                    height: 1,color: ColorConstant.dividerColor,
                  ),
                  ListTile(
                    title: CustomText("Start Live Game Connection",
                      size: 16.sp,
                      fw: FontWeight.w700,
                      color: ColorConstant.whiteColor,
                    ),
                    // trailing: Text("6:30"),
                    onTap: () {
                      Get.to(() => ConnectVideoGameScreen());
                    },
                    leading: Icon(Icons.gamepad,color: ColorConstant.whiteColor,),
                  ),
                  Divider(
                    height: 1,color: ColorConstant.dividerColor,
                  ),
                  ListTile(
                    title: CustomText("Challenges",
                      size: 16.sp,
                      fw: FontWeight.w700,
                      color: ColorConstant.whiteColor,
                    ),
                    // trailing: Text("6:30"),
                    onTap: () {
                      Get.to(( )=>Challenge());
                    },
                    leading: Icon(Icons.flag,color: ColorConstant.whiteColor,),
                  ),
                  Divider(
                    height: 1,color: ColorConstant.dividerColor,
                  ),
                  //Divider(height: 1,),
                  ListTile(
                    title: CustomText("Challenges Detail",
                      size: 16.sp,
                      fw: FontWeight.w700,
                      color: ColorConstant.whiteColor,
                    ),
                    // trailing: Text("6:30"),
                    onTap: () {
                      Get.to(( )=> ChallengeDetailScreen());
                    },
                    leading: Icon(Icons.description,color: ColorConstant.whiteColor,),
                  ),
                  Divider(
                    height: 1,color: ColorConstant.dividerColor,
                  ),

                  ListTile(
                    title: CustomText("Players",
                      size: 16.sp,
                      fw: FontWeight.w700,
                      color: ColorConstant.whiteColor,
                    ),
                    // trailing: Text("6:30"),
                    onTap: () {
                      Get.to(( )=>PlayerSquadScreen());
                    },
                    leading: Icon(Icons.groups,color: ColorConstant.whiteColor,),
                  ),

                  Divider(
                    height: 1,color: ColorConstant.dividerColor,
                  ),
                  ListTile(
                    title: CustomText("Log out",
                      size: 16.sp,
                      fw: FontWeight.w700,
                      color: ColorConstant.whiteColor,
                    ),
                    // trailing: Text("6:30"),
                    onTap: () {
                      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
                      authenticationController.logOut();
                    },
                    leading: Icon(Icons.logout,color: ColorConstant.redColor,),
                  ),
                  // Divider(height: 1,)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
