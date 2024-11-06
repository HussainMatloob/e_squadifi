import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/controllers/navigation_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_bottom_sheet.dart';
import 'package:e_squadifi/views/custom_widgets/custom_image_container.dart';
import 'package:e_squadifi/views/screens/profile_screen.dart';
import 'package:e_squadifi/views/screens/community_groups_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}
class _BottomNavBarState extends State<BottomNavBar> {
  @override
  NavController navController=Get.put(NavController(),permanent: true);
  Widget build(BuildContext context) {
    return GetBuilder<NavController>(
      init: NavController(),
      builder: (navController) {
        return WillPopScope(
          onWillPop:()async{
            if(navController.selectedNavIndex!=0){
              navController.navIndex(0);
              return false;
            }
            else{
              return true;
            }
          },
          child: Scaffold(
            body: Container(
              height: Get.height,
              width: Get.width,
              padding: EdgeInsets.all(8.r),
              // Border width
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: ColorConstant.gradientBorderColor,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: Container(
                  height: Get.height,
                  width: Get.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: ColorConstant.primaryGradiantColor,
                      begin: FractionalOffset(1.0, 1.0),
                      end: FractionalOffset(-0.2, 0.1),
                      stops: [0.0, 0.3, 0.5, 0.8, 2.0],
                    ),
                    borderRadius: BorderRadius.circular(50.r),
                  ),

                  child: Stack(
                    children: [
                       navController.pages[navController.selectedNavIndex],
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: BottomAppBar(
                          color: Color(0xFF1D0E3A),
                          shape: CircularNotchedRectangle(),
                          notchMargin: 10.w,
                          // Increase notch margin to move the notch up
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                icon: Icon(
                                    Icons.home_outlined,
                                    color: ColorConstant.iconColor),
                                onPressed:() {
                                  navController.navIndex(0);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.mic_none,
                                    color: ColorConstant.iconColor),
                                onPressed:() {

                                  navController.navIndex(1);
                                },
                              ),
                              SizedBox(width: 40),
                              // Space for the center button (FAB)
                              IconButton(
                                icon: Icon(Icons.groups_3_outlined,
                                    color: ColorConstant.iconColor),
                                onPressed:() {
                                  navController.communityMethod();
                                  navController.navIndex(2);
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                    Icons.person_outline,
                                    color: ColorConstant.iconColor),
                                onPressed:() {

                                  Get.to(()=>ProfileScreen());
                                  //navController.navIndex(3);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (navController.isBottomSheetVisible)
                        CustomBottomSheet()
                    ],
                  ),
                  //
                ),
              ),

            ),
            // Floating Action Button
            floatingActionButton:
            navController.isBottomSheetVisible?Container():CustomImageContainer(
              width: 56.w,
              height: 56.h,
              borderRadius: 56.r / 2,
              image: ImageConstants.bottomBarLogo,
              marginBottom: Get.height/15.h,
              marginTop: Get.height/11.h,
              marginLeft: 15.w,
            ),

            floatingActionButtonLocation: FloatingActionButtonLocation
                .centerDocked,
          ),
        );
      },

    );
  }}