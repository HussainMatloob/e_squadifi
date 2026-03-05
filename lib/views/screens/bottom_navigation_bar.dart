import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/controllers/navigation_controller.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final NavController navController = Get.put(NavController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavController>(
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            if (navController.selectedNavIndex != 0) {
              navController.navIndex(0);
              return false;
            }
            return true;
          },
          child: Scaffold(
            // Gradient background
            body: Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: ColorConstant.primaryGradiantColor,
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  stops: [0.0, 0.3, 0.5, 0.8, 1.0],
                ),
              ),
              child: navController.pages[navController.selectedNavIndex],
            ),

            // Bottom Navigation Bar
            bottomNavigationBar: navController.selectedNavIndex == 3
                ? null
                : BottomAppBar(
                    color: const Color(0xFF1D0E3A),
                    shape: const CircularNotchedRectangle(),
                    notchMargin: 8,
                    child: SizedBox(
                      height: 60, // Fixed height
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: Icon(Icons.home_outlined,
                                color: navController.selectedNavIndex == 0
                                    ? ColorConstant.whiteColor
                                    : ColorConstant.iconColor),
                            onPressed: () => navController.navIndex(0),
                          ),
                          IconButton(
                            icon: Icon(Icons.mic_none,
                                color: navController.selectedNavIndex == 1
                                    ? ColorConstant.whiteColor
                                    : ColorConstant.iconColor),
                            onPressed: () => navController.navIndex(1),
                          ),
                          const SizedBox(width: 40), // Space for FAB
                          IconButton(
                            icon: Icon(Icons.groups_3_outlined,
                                color: navController.selectedNavIndex == 2
                                    ? ColorConstant.whiteColor
                                    : ColorConstant.iconColor),
                            onPressed: () {
                              navController.getCommunityName();
                              navController.communityMethod();
                              navController.navIndex(2);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.person_outline,
                                color: navController.selectedNavIndex == 3
                                    ? ColorConstant.whiteColor
                                    : ColorConstant.iconColor),
                            onPressed: () => navController.navIndex(3),
                          ),
                        ],
                      ),
                    ),
                  ),

            // Floating Action Button
            floatingActionButtonLocation: navController.selectedNavIndex == 3
                ? null
                : FloatingActionButtonLocation.centerDocked,
            floatingActionButton: navController.selectedNavIndex == 3
                ? null
                : FloatingActionButton(
                    onPressed: () {
                      // Handle FAB tap
                    },
                    backgroundColor:
                        Colors.transparent, // Makes FAB background invisible
                    elevation: 4,
                    shape: const CircleBorder(), // Perfect circle
                    child: Container(
                      width: 56, // Default FAB size
                      height: 56,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(ImageConstants.bottomBarLogo),
                          fit: BoxFit.cover, // Image fully covers the FAB
                        ),
                      ),
                    ),
                  ),

            // Overlay bottom sheet if visible
            extendBody: true,
          ),
        );
      },
    );
  }
}
