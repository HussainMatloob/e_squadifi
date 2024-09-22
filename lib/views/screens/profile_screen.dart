import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:e_squadifi/constants/app_data.dart';
import 'package:e_squadifi/controllers/navigation_controller.dart';
import 'package:e_squadifi/controllers/profile_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_list_tile.dart';
import 'package:e_squadifi/views/custom_widgets/profile_list_tiles.dart';
import 'package:e_squadifi/views/custom_widgets/custom_popup.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/reuseable_gradient_container.dart';
import 'package:e_squadifi/views/screens/profile_goals_screen.dart';
import 'package:e_squadifi/views/screens/profile_improve_game_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constants/color_constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  ProfileController profileController = Get.put(ProfileController(),permanent: true);
  void initState() {
    // TODO: implement initState
    super.initState();
    // Set the orientation to landscape mode only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  NavController navigationController=Get.put(NavController());

  final CustomPopupMenuController controller = CustomPopupMenuController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        navigationController.navIndex(0);
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
                leading: GestureDetector(
                  onTap: () {
                    Get.back();
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.portraitUp,
                      DeviceOrientation.portraitDown,
                    ]);
                    navigationController.navIndex(0);
                  },
                  child: Padding(
                      padding: EdgeInsets.only(left: 40.w, top: 15.h),
                      child: Icon(
                        Icons.home,
                        size: 32.sp,
                      )),
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, right: 45.w),
                    child: Row(
                      children: [
                        if (profileController.selectedProfileTileIndex == 4)
                          Row(
                            children: [
                              CustomPopUpDialog(
                                controller: controller,
                               // icon: null,
                                width: 190.w,
                                height: 55.h,
                                color: ColorConstant.cyanBlue,
                                child: Container(
                                  padding: EdgeInsets.all(18.r),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomListTile(
                                        text: "Progressing",
                                        color: ColorConstant.whiteColor,
                                        icon: Icon(Icons.hourglass_empty,
                                            size: 19.sp,
                                            color: ColorConstant.whiteColor),
                                        onTap: () {

                                        },
                                        fw: FontWeight.w700,
                                        textSize: 16.sp,
                                        sizedBoxedWidth: 10.w,
                                      ),
                                      SizedBox(height: 5.h),
                                      CustomListTile(
                                        text: "Completed",
                                        color: ColorConstant.whiteColor,
                                        icon: Icon(Icons.check_circle_outline,
                                            size: 19.sp,
                                            color: ColorConstant.whiteColor),
                                        onTap: () {

                                        },
                                        fw: FontWeight.w700,
                                        textSize: 16.sp,
                                        sizedBoxedWidth: 10.w,
                                      ),
                                    ],
                                  ),
                                ),

                              ),

                              SizedBox(
                                width: 10.w,
                              ),
                              ButtonWidget(
                                height: 20.h,
                                icon: Icon(
                                  Icons.add,
                                  color: ColorConstant.whiteColor,
                                  size: 20.sp,
                                ),
                                text: "Add Goal",
                                color: ColorConstant.cyanBlue,
                                radius: 47.r,
                                textSize: 12.sp,
                                fw: FontWeight.w700,
                                textColor: ColorConstant.whiteColor,
                                onTap: () {},
                                paddingHorizontal: 12.w,
                              ),
                              SizedBox(
                                width: 65.w,
                              ),
                            ],
                          ),
                        ReuseableGradientContainer(
                          gradientColor: ColorConstant.profilePicGradient,
                          width: 33.w,
                          height: 33.w,
                          padding: 4.r,
                          borderRadius: 100.r,
                          color: ColorConstant.greyColor,
                          imageExist: true,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                "Petter Ray",
                                fw: FontWeight.w400,
                                size: 14.sp,
                                color: ColorConstant.whiteColor,
                              ),
                              CustomText(
                                "genre player",
                                fw: FontWeight.w400,
                                size: 10.sp,
                                color: Colors.white70,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              body: Container(
                height: Get.height,
                width: Get.width,
                padding: EdgeInsets.all(8.r), // Border width
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: ColorConstant.gradientBorderLandScapeColor,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (profileController.selectedProfileTileIndex == 0 ||
                          profileController.selectedProfileTileIndex == 1 ||
                          profileController.selectedProfileTileIndex == 2 ||
                          profileController.selectedProfileTileIndex == 3)
                        ProfileImproveGameScreen(),
                      if (profileController.selectedProfileTileIndex == 4)
                        ProfileGoalsScreen(),
                      SizedBox(
                        width: 12.w,
                      ),
                      Container(
                        // height: Get.height,
                        width: 155.w,
                        margin: EdgeInsets.only(top: 35.h),
                        decoration: BoxDecoration(
                            color: ColorConstant.greyColor,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50.r),
                                topLeft: Radius.circular(13.r))),
                        child: Column(
                          children: [
                            for (int i = 0;
                                i < AppData.profileTilesText.length;
                                i++)
                              ProfileListTile(
                                height: 40.h,
                                width: 217.w,
                                size: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: ColorConstant.cyanBlue,
                                radiusBottomLeft: 14.r,
                                radiusTopLeft: 14.r,
                                text: AppData.profileTilesText[i],
                                index: i,
                                onTap: () {
                                  profileController.changeTileSelection(i);
                                },
                              ),
                            Flexible(
                              child: ButtonWidget(
                                height: 18.h,
                                width: 130.w,
                                icon: Icon(
                                  Icons.account_balance_wallet,
                                  color: ColorConstant.whiteColor,
                                  size: 20.sp,
                                ),
                                text: "Wallet",
                                color: ColorConstant.cyanBlue,
                                radius: 47.r,
                                textSize: 12.sp,
                                fw: FontWeight.w700,
                                textColor: ColorConstant.whiteColor,
                                onTap: () {},
                                paddingHorizontal: 20.w,
                                marginAll: 5.r,
                              ),
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
