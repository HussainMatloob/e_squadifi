import 'package:e_squadifi/constants/app_data.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_drop_down_button.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/color_constants.dart';
class ConnectVideoGameScreen extends StatefulWidget {
  const ConnectVideoGameScreen({super.key});

  @override
  State<ConnectVideoGameScreen> createState() => _ConnectVideoGameScreenState();
}

class _ConnectVideoGameScreenState extends State<ConnectVideoGameScreen> {
  TextEditingController gameIdController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      },
      child: WillPopScope(
        onWillPop: () async{
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
          return true;
        },
        child: Scaffold(
          body: Container(
            height: Get.height,
            width: Get.width,
            padding: EdgeInsets.all(8.r), // Border width
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: ColorConstant.gradientBorderColor,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(50.r),),
            child: Container(
              padding: EdgeInsets.all(20.r),
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      GestureDetector(
                        onTap: (){
                          SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
                          Get.back();
                        },
                        child: Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Center(
                            child: Icon(
                              CupertinoIcons.back,
                              color: ColorConstant.whiteColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      CustomText("Connect Video Game",fw: FontWeight.w700,size: 20.sp,color: Colors.white,)
                    ],),
                    SizedBox(height: 40.h,),
                    CustomText("SELECT GAME",fw: FontWeight.w400,size: 14.sp,color: Colors.white,),
                    SizedBox(height: 20.h,),
                    CustomDropDownButton(
                      text: "Select game",
                      dropDownButtonList: AppData.gameType,
                    ),
                    SizedBox(height: 20.h,),
                    CustomText("ENTER GAME ID",fw: FontWeight.w400,size: 14.sp,color: Colors.white,),
                    SizedBox(height: 20.h,),
                    CustomTextFormField(
                      hintTextColor: ColorConstant.whiteColor,
                      hintTextSize: 12.sp,
                      hintTextFw: FontWeight.w400,
                      borderRadius: 93.r,
                      fillColor:ColorConstant.greyLightColor ,
                      width: 311.w,
                      height: 57.h,
                      controller: gameIdController,
                      color:  ColorConstant.greyLightColor,
                      borderColor: ColorConstant.greyLightColor,
                      focusedBorderColor: ColorConstant.greyLightColor,
                      hintText: "Game ID",
                      horizontalPadding: 20.r,
                    ),
                    SizedBox(height: 35.h,),
                    ButtonWidget(
                      text: "Save",
                      marginAll: 8.w,
                      height: 51.h,
                      color: ColorConstant.cyanBlue,
                      radius: 47.r,
                      textColor: ColorConstant.whiteColor,
                      fw: FontWeight.w700,
                      textSize: 14.sp,
                      onTap: (){
                      },
                    )
                  ],),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
