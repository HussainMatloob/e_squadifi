import 'package:e_squadifi/constants/app_data.dart';
import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/controllers/profile_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_drop_down_button.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

 class CustomBottomSheet extends StatefulWidget {
   const CustomBottomSheet({super.key});

   @override
   State<CustomBottomSheet> createState() => _CustomBottomSheetState();
 }

 class _CustomBottomSheetState extends State<CustomBottomSheet> {
   @override
   ProfileController profileController=Get.put(ProfileController());
   Widget build(BuildContext context) {

     return GetBuilder<ProfileController>(
         builder: (profileController) {
           return Align(
             alignment: Alignment.bottomCenter,
             child: Container(
               padding: EdgeInsets.only(top: 7.h),
               decoration: BoxDecoration(
                 color: ColorConstant.purpleLightColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))
               ),
               child: AnimatedContainer(
                 duration: Duration(
                     milliseconds: 300),
                 // Smooth opening/closing
                 height: 550.h,
                 // Adjust height as per your need
                 width: double.infinity,
                 decoration: BoxDecoration(
                     color: ColorConstant.deepPurpleColor,
                     borderRadius:
                     BorderRadius.vertical(top: Radius.circular(30.r)),
                 ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Container(
                       padding: EdgeInsets.all(20.r),
                       child: CustomText("Filter BY", size: 14.sp,
                         fw: FontWeight.w700,
                         color: ColorConstant.whiteColor,),),
                     Divider(color: ColorConstant.bottomSheetDividerColor,),
                     Container(
                       padding: EdgeInsets.all(20.r),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           CustomText("SKILL LEVEL", size: 14.sp,
                             fw: FontWeight.w400,
                             color: ColorConstant.whiteColor,),
                           SizedBox(height: 10.h,),
                           CustomDropDownButton(
                             text: "Select Skill Level",
                             dropDownButtonList: AppData.skillLevelList,
                           ),
                           SizedBox(height: 10.h,),
                           CustomText("PREFERRED GAME ROLE", size: 14.sp,
                             fw: FontWeight.w400,
                             color: ColorConstant.whiteColor,),
                           SizedBox(height: 10.h,),
                           CustomDropDownButton(
                             text: "Select Game Role",
                             dropDownButtonList: AppData.gameRoleList,
                           ),
                           SizedBox(height: 10.h,),
                           CustomText("PREFERRED GAME MODE", size: 14.sp,
                             fw: FontWeight.w400,
                             color: ColorConstant.whiteColor,),

                         ],),
                     ),
                     Container(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                         Padding(
                           padding: EdgeInsets.only(left: 10.w),
                           child: Wrap(
                             alignment: WrapAlignment.start,
                             //direction: Axis.horizontal,
                             spacing: 12.w,
                             runSpacing: 15.w,
                             children: [
                               FittedBox(
                                 child: ButtonWidget(
                                   borderColor: ColorConstant.cyanBlue,
                                   borderWidth: 2.sp,
                                   text: "Shooter",
                                   height: 48.h,
                                   color: ColorConstant.cyanBlue,
                                   radius: 90.r,
                                   textColor: ColorConstant.whiteColor,
                                   fw: FontWeight.w700,
                                   textSize: 14.sp,
                                   paddingHorizontal: 15.w,
                                   onTap: () {},
                                 ),
                               ),
                               FittedBox(
                                 child: ButtonWidget(
                                   borderColor: ColorConstant.cyanBlue,
                                   borderWidth: 2.sp,
                                   text: "Action",
                                   height: 48.h,
                                   radius: 90.r,
                                   textColor: ColorConstant.cyanBlue,
                                   fw: FontWeight.w700,
                                   textSize: 14.sp,
                                   paddingHorizontal: 15.w,
                                   onTap: () {},
                                 ),
                               ),
                             ],
                           ),
                         ),
                         SizedBox(height: 15.h,),
                         SingleChildScrollView(
                           scrollDirection: Axis.horizontal,
                           child: Row(
                             children: [
                             for(int i = 0; i < AppData.preferredGameMode.length; i++)
                                Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: ButtonWidget(
                                     borderColor: ColorConstant.cyanBlue,
                                     borderWidth: 2.sp,
                                     text: AppData.preferredGameMode[i],
                                     height: 48.h,
                                     color: (profileController.preferredGameModeIndexes ?? []).contains(i)
                                         ? ColorConstant.cyanBlue
                                         : Colors.transparent,
                                     radius: 90.r,
                                     textColor: (profileController.preferredGameModeIndexes ?? []).contains(i)?ColorConstant.whiteColor:ColorConstant.cyanBlue,
                                     fw: FontWeight.w700,
                                     textSize: 14.sp,
                                     paddingHorizontal: 25.w,
                                     onTap: () {
                                       profileController.selectPreferredGameMode(i);
                                     },
                                   ),
                                ),
                           ],),
                         ),
                       ],),
                     ),
                     SizedBox(height: 10.h,),
                     Divider(color: ColorConstant.bottomSheetDividerColor,),
                     SizedBox(height: 10.h,),
                     FittedBox(
                       child: Container(
                         padding: EdgeInsets.symmetric(horizontal: 30.w),
                         child: Row(
                           children: [
                           ButtonWidget(
                             text: "Reset",
                             height: 50.h,
                             radius: 69.r,
                             color: ColorConstant.greyColor,
                             textColor: ColorConstant.whiteColor,
                             fw: FontWeight.w700,
                             textSize: 14.sp,
                             paddingHorizontal: 50.w,
                             onTap: () {},
                           ),
                             SizedBox(width: 15.w,),
                             ButtonWidget(
                               text: "Save",
                               height: 50.h,
                               radius: 69.r,
                               color: ColorConstant.cyanBlue,
                               textColor: ColorConstant.whiteColor,
                               fw: FontWeight.w700,
                               textSize: 14.sp,
                               paddingHorizontal: 50.w,
                               onTap: () {},
                             ),
                         ],),
                       ),
                     )
                   ],
                 ),
               ),
             ),
           );
         }
     );
   }
 }