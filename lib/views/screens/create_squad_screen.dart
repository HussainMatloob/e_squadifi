import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text_form_field.dart';
import 'package:e_squadifi/views/screens/invite_squad_member_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateSquadScreen extends StatefulWidget {
  const CreateSquadScreen({super.key});

  @override
  State<CreateSquadScreen> createState() => _CreateSquadScreenState();
}

class _CreateSquadScreenState extends State<CreateSquadScreen> {
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  TextEditingController squadController=TextEditingController();
  TextEditingController squadNameController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        FocusScope.of(context).unfocus();
      },
      child: WillPopScope(
        onWillPop: () async{
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
          return true;
        },
        child: Scaffold(
          body:
          Form(
            key: formKey,
            child: Container(
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
                    colors:ColorConstant.gradientScreenColor,

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
                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
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
                                  child: Center(child: Icon(CupertinoIcons.back,color: ColorConstant.whiteColor,),),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(

                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  CustomText(
                                    "Create A",
                                    fw: FontWeight.w700,
                                    size: 32.sp,
                                    color: ColorConstant.whiteColor,
                                  ),
                                  CustomText(
                                    "Squad",
                                    fw: FontWeight.w700,
                                    size: 32.sp,
                                    color: ColorConstant.whiteColor,
                                  ),

                                  SizedBox(height: 50.h,),
                                  CustomText("Selected squad",fw: FontWeight.w700,size: 16.sp,color: ColorConstant.whiteColor,),
                                  SizedBox(height: 8.h,),
                                  CustomTextFormField(
                                    controller: squadController,
                                    //color: ColorConstant.greyColor,
                                    hintText: "select squad to create",
                                    width: 312.w,
                                    height: 54.h,
                                  ),
                                  SizedBox(height: 25.h,),
                                  CustomText("Selected squad",fw: FontWeight.w700,size: 16.sp,color: ColorConstant.whiteColor,),
                                  SizedBox(height: 8.h,),
                                  CustomTextFormField(
                                    controller: squadNameController,
                                    //color: ColorConstant.greyColor,
                                    hintText: "squad name",
                                    width: 312.w,
                                    height: 54.h,
                                  ),
                                  SizedBox(height: 25.h,),
                                  CustomText("Squad Description",fw: FontWeight.w700,size: 16.sp,color: ColorConstant.whiteColor,),
                                  SizedBox(height: 8.h,),
                                  CustomTextFormField(
                                    width: 312.w,
                                    height: 137.h,
                                    controller: descriptionController,
                                    color: ColorConstant.greyColor,
                                    hintText: "Mr:",
                                  ),
                                  SizedBox(
                                    height: 50.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ButtonWidget(
                                        text: "Next",
                                        width: 311.w,
                                        height: 51.h,
                                        color: ColorConstant.cyanBlue,
                                        radius: 47.r,
                                        textColor: ColorConstant.whiteColor,
                                        fw: FontWeight.w700,
                                        textSize: 14.sp,
                                        onTap: (){
                                          if(formKey.currentState!.validate()){
                                            Get.to(()=>InviteSquadMemberScreen());
                                            SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],

                  ),
                ),
              ),),
          ),
        ),
      ),
    );
  }
}
