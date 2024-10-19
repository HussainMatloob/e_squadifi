import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/controllers/navigation_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_list_tile.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/reuseable_gradient_container.dart';
import 'package:e_squadifi/views/screens/bottom_navigation_bar.dart';
import 'package:e_squadifi/views/screens/your_groups_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddGroupScreen extends StatefulWidget {
  const AddGroupScreen({super.key});

  @override
  State<AddGroupScreen> createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends State<AddGroupScreen> {
  @override
  NavController navController=Get.put( NavController());
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body:  Container(
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
        child:  Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:ColorConstant.primaryGradiantColor,
              begin: FractionalOffset(1.0,1.0),
              end: FractionalOffset(-0.2,0.1),
              // begin: Alignment.topLeft, // Start the gradient at top-left
              // end: Alignment.bottomRight, // End the gradient at bottom-right
              stops: [0.0, 0.2, 0.5, 0.8, 1.0],
            ),
            borderRadius: BorderRadius.circular(50.r),
            // border: Border.all(width: 10,color: Colors.purple)
          ),
          child: Container(
            padding: EdgeInsets.all(20.r),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.w,),
                  Row(
                    children: [
                      ReuseableGradientContainer(
                        height: 62.h,
                        width: 63.w,
                        borderRadius: 28.r,
                        gradientColor: ColorConstant.profilePicGradient,
                        padding: 2.r,
                        image: ImageConstants.profileImagesList[3],
                        color: ColorConstant.purple,
                        internalPadding: 5.r,
                      ),
                      SizedBox(width: 15.w,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText("Community Name",fw: FontWeight.w700,size: 18.sp,color: ColorConstant.whiteColor,),
                          CustomText("Announcement Group",fw: FontWeight.w400,size: 14.sp,color: ColorConstant.whiteColor,)
                        ],),

                    ],),
                  SizedBox(height: 50.w,),
                  CustomText("Add Group",fw: FontWeight.w700,size: 24.sp,color: ColorConstant.whiteColor,),
                  SizedBox(height: 50.w,),
                  CustomListTile(
                    text: "Create group",
                    color: ColorConstant.whiteColor,
                    icon: Icon(
                      Icons.group_outlined,
                      color: ColorConstant.whiteColor,
                      size: 20,
                    ),
                    fw: FontWeight.w500,
                    textSize: 16.sp,
                    fontStyle: FontStyle.italic,
                    sizedBoxedWidth: 12.w,
                    width: 32.w,
                    height: 32.h,
                    containerColor: ColorConstant.purpleLightColor,
                    borderRadius: 8.r,
                    onTap: (){
                      navController.groupCreate(true);
                      navController.navIndex(2);
                      Get.offAll(()=>BottomNavBar());
                    },
                  ),
                  SizedBox(height: 20.w,),
                  CustomListTile(
                    text: "Create group",
                    color: ColorConstant.whiteColor,
                    icon: Icon(
                      Icons.add,
                      color: ColorConstant.whiteColor,
                      size: 20,
                    ),
                    fw: FontWeight.w500,
                    textSize: 16.sp,
                    fontStyle: FontStyle.italic,
                    sizedBoxedWidth: 12.w,
                    width: 32.w,
                    height: 32.h,
                    containerColor: ColorConstant.purpleLightColor,
                    borderRadius: 8.r,
                    onTap: (){
                      navController.groupCreate(true);
                      navController.navIndex(2);
                      Get.offAll(()=>BottomNavBar());
                    },
                  ),
                ]
              ),
            ),
          ),
        ),),
    );
  }
}
