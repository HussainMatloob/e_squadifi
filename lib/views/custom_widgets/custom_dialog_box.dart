import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/controllers/live_streaming_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_list_tile.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../services/firebase_services.dart';
import '../../utils/flush_messages.dart';
class CustomDialogBox {
  // The method to show the dialog
  void showDialogBox(BuildContext context,bool isVideoDialog,double dialogWidth,double dialogHeight) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GetBuilder<LiveStreamingController>(
          builder: (liveStreamingController){
            return  Dialog(// Use Dialog instead of AlertDialog for more control over sizing
              backgroundColor:  ColorConstant.dialogColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.r), // Optional: Add rounded corners
              ),
              child: Container(
                height: liveStreamingController.isLandScape.value?150.h:dialogHeight.h, // Set custom height
                width: dialogWidth.w,  // Set custom width
                padding: EdgeInsets.all(28.r), // Add some padding
                decoration: BoxDecoration(
                  color: ColorConstant.dialogColor, // Set background color
                  borderRadius: BorderRadius.circular(28.r), // Optional: Add rounded corners
                ),
                child:isVideoDialog==true?Column(
                  mainAxisSize: MainAxisSize.min, // Wrap content height
                  children: [
                    CustomListTile(
                      icon: Icon(
                        Icons.settings_outlined,
                        color: ColorConstant.whiteColor,
                      ),
                      text: "Quality",
                      textSize: 16.sp,
                      fw: FontWeight.w700,
                      color: ColorConstant.whiteColor,
                      isDialog: true,
                      tralingText: "1080p",
                      tralingIcon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: ColorConstant.whiteColor,
                      ),
                      sizedBoxedWidth: 15.w,
                    ),
                    SizedBox(height: 15.h,),
                    CustomListTile(
                      icon: Icon(
                        Icons.mic_none_outlined,
                        color: ColorConstant.whiteColor,
                      ),
                      text: "Background Audio",
                      textSize: 16.sp,
                      fw: FontWeight.w700,
                      color: ColorConstant.whiteColor,
                      isDialog: true,
                      tralingText: "Never",
                      tralingIcon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: ColorConstant.whiteColor,
                      ),
                      sizedBoxedWidth: 15.w,
                    ),
                    SizedBox(height: 15.h,),
                    CustomListTile(
                      isDialog: true,
                      icon: Icon(
                        Icons.exit_to_app,
                        color: ColorConstant.whiteColor,
                      ),
                      text: "Pop out",
                      textSize: 16.sp,
                      fw: FontWeight.w700,
                      color: ColorConstant.whiteColor,
                      sizedBoxedWidth: 15.w,
                    ),
                    SizedBox(height: 15.h,),
                    CustomListTile(
                      isDialog: true,
                      tralingText: "abc",
                      icon: Icon(
                        Icons.report_gmailerrorred,
                        color: ColorConstant.whiteColor,
                      ),
                      text: "Report",
                      textSize: 16.sp,
                      fw: FontWeight.w700,
                      color: ColorConstant.whiteColor,
                      sizedBoxedWidth: 15.w,
                    ),
                  ],
                ):Form(
                  key:liveStreamingController.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      CustomText("Create new group",color: ColorConstant.whiteColor,size: 16.sp,fw: FontWeight.w700,),

                        CustomTextFormField(
                          validateFunction: liveStreamingController.groupNameValidate,
                          controller: liveStreamingController.groupNameController,
                          horizontalPadding: 10.w,
                          hintText: "Enter group name",
                        ),

                      Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        ButtonWidget(
                          onTap: (){
                          if(liveStreamingController.formKey.currentState!.validate()){
                            FlushMessagesUtil.easyLoading();
                            FirebaseServices.createGroup(context,liveStreamingController.groupNameController.text.toString()).then((onValue){
                              EasyLoading.dismiss();
                              Get.back();
                            });
                          }
                          },
                          text:"Create",textColor: ColorConstant.whiteColor,
                          color: ColorConstant.purpleLightColor,
                          paddingHorizontal: 10.w,
                          height: 30.h,radius: 50.r,),
                          SizedBox(width: 10.w,),
                          ButtonWidget(
                            onTap: (){
                              Get.back();
                            },
                            text:"Cancel",textColor: ColorConstant.whiteColor,
                            color: ColorConstant.redColor,
                            paddingHorizontal: 10.w,
                            height: 30.h,radius: 50.r,),
                      ],)
                    ],),

                ),
              ),
            );
          },
        );
      },
    );
  }
}