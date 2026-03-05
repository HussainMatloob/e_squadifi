import 'package:e_squadifi/constants/app_data.dart';
import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/controllers/profile_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_drop_down_button.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBottomSheet {
  static void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows full height
      backgroundColor:
          ColorConstant.deepPurpleColor, // For custom rounded corners
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.7, // 80% of screen height
          maxChildSize: 0.95,
          minChildSize: 0.4,
          builder: (context, scrollController) {
            return Container(
              padding: EdgeInsets.only(top: 7.h),
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: ColorConstant.purple, width: 6.w)),
                color: ColorConstant.deepPurpleColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.r),
                ),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 550.h, // Adjust as needed
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
                      // Header
                      Container(
                        padding: EdgeInsets.all(20.r),
                        child: CustomText(
                          "Filter BY",
                          size: 14.sp,
                          fw: FontWeight.w700,
                          color: ColorConstant.whiteColor,
                        ),
                      ),
                      Divider(color: ColorConstant.bottomSheetDividerColor),

                      // Skill Level & Game Role
                      Container(
                        padding: EdgeInsets.all(20.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              "SKILL LEVEL",
                              size: 14.sp,
                              fw: FontWeight.w400,
                              color: ColorConstant.whiteColor,
                            ),
                            SizedBox(height: 10.h),
                            CustomDropDownButton(
                              text: "Select Skill Level",
                              dropDownButtonList: AppData.skillLevelList,
                            ),
                            SizedBox(height: 10.h),
                            CustomText(
                              "PREFERRED GAME ROLE",
                              size: 14.sp,
                              fw: FontWeight.w400,
                              color: ColorConstant.whiteColor,
                            ),
                            SizedBox(height: 10.h),
                            CustomDropDownButton(
                              text: "Select Game Role",
                              dropDownButtonList: AppData.gameRoleList,
                            ),
                            SizedBox(height: 10.h),
                            CustomText(
                              "PREFERRED GAME MODE",
                              size: 14.sp,
                              fw: FontWeight.w400,
                              color: ColorConstant.whiteColor,
                            ),
                          ],
                        ),
                      ),

                      // Game Mode Buttons
                      Container(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Wrap(
                              alignment: WrapAlignment.start,
                              spacing: 12.w,
                              runSpacing: 15.w,
                              children: [
                                for (var skill in ["Shooter", "Action"])
                                  FittedBox(
                                    child: ButtonWidget(
                                      borderColor: ColorConstant.cyanBlue,
                                      borderWidth: 2.sp,
                                      text: skill,
                                      height: 48.h,
                                      radius: 90.r,
                                      color: skill == "Shooter"
                                          ? ColorConstant.cyanBlue
                                          : Colors.transparent,
                                      textColor: ColorConstant.whiteColor,
                                      fw: FontWeight.w700,
                                      textSize: 14.sp,
                                      paddingHorizontal: 15.w,
                                      onTap: () {},
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: 15.h),
                            GetBuilder<ProfileController>(
                                builder: (profileController) {
                              return SizedBox(
                                height: 48.h,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: AppData.preferredGameMode.length,
                                  itemBuilder: (context, index) {
                                    final selectedIndexes = profileController
                                            .preferredGameModeIndexes ??
                                        [];
                                    final isSelected =
                                        selectedIndexes.contains(index);
                                    return Padding(
                                      padding: EdgeInsets.only(right: 10.w),
                                      child: ButtonWidget(
                                        borderColor: ColorConstant.cyanBlue,
                                        borderWidth: 2.sp,
                                        text: AppData.preferredGameMode[index],
                                        height: 48.h,
                                        color: isSelected
                                            ? ColorConstant.cyanBlue
                                            : Colors.transparent,
                                        radius: 90.r,
                                        textColor: isSelected
                                            ? ColorConstant.whiteColor
                                            : ColorConstant.cyanBlue,
                                        fw: FontWeight.w700,
                                        textSize: 14.sp,
                                        paddingHorizontal: 25.w,
                                        onTap: () => profileController
                                            .selectPreferredGameMode(index),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }),
                          ],
                        ),
                      ),

                      SizedBox(height: 10.h),
                      Divider(color: ColorConstant.bottomSheetDividerColor),
                      SizedBox(height: 10.h),

                      // Reset & Save Buttons
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
                              SizedBox(width: 15.w),
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
