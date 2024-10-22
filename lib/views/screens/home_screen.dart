import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/controllers/navigation_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/home_page_profiles_widget.dart';
import 'package:e_squadifi/views/custom_widgets/latest_stream_widget.dart';
import 'package:e_squadifi/views/custom_widgets/reuseable_gradient_container.dart';
import 'package:e_squadifi/views/screens/games_list_screen.dart';
import 'package:e_squadifi/views/screens/player_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  NavController navController=Get.put(NavController());
  Widget build(BuildContext context) {
    return GetBuilder<NavController>(
      builder: (navController){
        return  GestureDetector(
          onTap: (){
            navController.setBottomSheetFalse();
          },
          child: Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.w,
                          ),
                          Container(
                            padding: EdgeInsets.all(20.r),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  "Just Play",
                                  color: ColorConstant.whiteColor,
                                  fw: FontWeight.w700,
                                  size: 20,
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        navController.toggleBottomSheet();
                                        },
                                      child: Container(
                                        height: 40.h,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(48.r),
                                            color: Colors.white38),
                                        child: Center(
                                          child: Icon(
                                            Icons.search,
                                            color: ColorConstant.whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Get.to(( )=>GamesListScreen());
                                      },
                                      child: Container(
                                        height: 40.h,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(48.r),
                                            color: Colors.white38),
                                        child: Center(
                                          child: Icon(
                                            Icons.menu,
                                            color: ColorConstant.whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              padding: EdgeInsets.only(left: 20.r),
                              child: Row(
                                children: [
                                  for (int i = 0; i < 10; i++)
                                    Padding(
                                      padding: EdgeInsets.only(right: 15.w),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              ReuseableGradientContainer(
                                                height: 69.h,
                                                width: 71.w,
                                                borderRadius: 31.r,
                                                gradientColor: ColorConstant
                                                    .profilePicGradient,
                                                padding: 2.r,
                                                image: ImageConstants
                                                    .profileImagesList[3],
                                                color: ColorConstant.purple,
                                                internalPadding: 5.r,
                                                onTap: () {},
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              CustomText(
                                                "Player Name",
                                                fw: FontWeight.w700,
                                                size: 11.sp,
                                                color: ColorConstant.whiteColor,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Container(
                                      padding: EdgeInsets.only(left: 20.r),
                                      child: Row(
                                        children: [
                                          for (int i = 0; i < ImageConstants
                                                  .profileImagesList.length; i++)
                                            HomePageProfilesWidget(
                                              onTap: (){
                                             Get.to(()=>PlayerDetailScreen(
                                               image: ImageConstants
                                                   .profileImagesList[i],
                                             ));
                                              },
                                              image: ImageConstants
                                                  .profileImagesList[i],
                                              name: "Wade Warren",
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20.r),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        CustomText(
                                          "Latest Stream &",
                                          fw: FontWeight.w700,
                                          size: 18.sp,
                                          color: ColorConstant.whiteColor,
                                        ),
                                        CustomText(
                                          "Podcasts",
                                          fw: FontWeight.w700,
                                          size: 18.sp,
                                          color: ColorConstant.whiteColor,
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        for (int i = 0; i <= 3; i++)
                                          LatestStreamWidget(),
                                        SizedBox(
                                          height: 100.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ]),
                  ),
                ),
              ],
            ),

          ),
        );
      },
    );
  }
}
