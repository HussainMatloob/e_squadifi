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
            bottomNavigationBar: BottomAppBar(
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
                          color: ColorConstant.iconColor),
                      onPressed: () => navController.navIndex(0),
                    ),
                    IconButton(
                      icon:
                          Icon(Icons.mic_none, color: ColorConstant.iconColor),
                      onPressed: () => navController.navIndex(1),
                    ),
                    const SizedBox(width: 40), // Space for FAB
                    IconButton(
                      icon: Icon(Icons.groups_3_outlined,
                          color: ColorConstant.iconColor),
                      onPressed: () {
                        navController.getCommunityName();
                        navController.communityMethod();
                        navController.navIndex(2);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.person_outline,
                          color: ColorConstant.iconColor),
                      onPressed: () => navController.navIndex(3),
                    ),
                  ],
                ),
              ),
            ),

            // Floating Action Button
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
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
// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key});
//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   @override
//   NavController navController = Get.put(NavController(), permanent: true);
//   Widget build(BuildContext context) {
//     return GetBuilder<NavController>(
//       init: NavController(),
//       builder: (navController) {
//         return WillPopScope(
//           onWillPop: () async {
//             if (navController.selectedNavIndex != 0) {
//               navController.navIndex(0);
//               return false;
//             } else {
//               return true;
//             }
//           },
//           child: Scaffold(
//             backgroundColor: ColorConstant.purple,
//             body: ClipRRect(
//               child: Container(
//                 height: Get.height,
//                 width: Get.width,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: ColorConstant.primaryGradiantColor,
//                     begin: FractionalOffset(1.0, 1.0),
//                     end: FractionalOffset(-0.2, 0.1),
//                     stops: [0.0, 0.3, 0.5, 0.8, 2.0],
//                   ),
//                 ),

//                 child: Stack(
//                   children: [
//                     navController.pages[navController.selectedNavIndex],
//                     Align(
//                       alignment: Alignment.bottomCenter,
//                       child: BottomAppBar(
//                         color: Color(0xFF1D0E3A),
//                         shape: CircularNotchedRectangle(),
//                         notchMargin: 10.w,
//                         // Increase notch margin to move the notch up
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             IconButton(
//                               icon: Icon(Icons.home_outlined,
//                                   color: ColorConstant.iconColor),
//                               onPressed: () {
//                                 navController.navIndex(0);
//                               },
//                             ),
//                             IconButton(
//                               icon: Icon(Icons.mic_none,
//                                   color: ColorConstant.iconColor),
//                               onPressed: () {
//                                 navController.navIndex(1);
//                               },
//                             ),
//                             SizedBox(width: 40),
//                             // Space for the center button (FAB)
//                             IconButton(
//                               icon: Icon(Icons.groups_3_outlined,
//                                   color: ColorConstant.iconColor),
//                               onPressed: () {
//                                 navController.getCommunityName();
//                                 navController.communityMethod();
//                                 navController.navIndex(2);
//                               },
//                             ),
//                             IconButton(
//                               icon: Icon(Icons.person_outline,
//                                   color: ColorConstant.iconColor),
//                               onPressed: () {
//                                 Get.to(() => ProfileScreen());
//                                 //navController.navIndex(3);
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     if (navController.isBottomSheetVisible) CustomBottomSheet()
//                   ],
//                 ),
//                 //
//               ),
//             ),

//             // Floating Action Button
//             floatingActionButton: navController.isBottomSheetVisible
//                 ? Container()
//                 : CustomImageContainer(
//                     width: 56.w,
//                     height: 56.h,
//                     borderRadius: 56.r / 2,
//                     image: ImageConstants.bottomBarLogo,
//                     marginBottom: Get.height / 15.h,
//                     marginTop: Get.height / 11.h,
//                     marginLeft: 15.w,
//                   ),

//             floatingActionButtonLocation:
//                 FloatingActionButtonLocation.centerDocked,
//           ),
//         );
//       },
//     );
//   }
// }
