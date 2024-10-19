import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/reuseable_friends_widget.dart';
import 'package:e_squadifi/views/screens/squad_invite_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SquadFriendsScreen extends StatefulWidget {
  const SquadFriendsScreen({super.key});

  @override
  State<SquadFriendsScreen> createState() => _SquadFriendsScreenState();
}

class _SquadFriendsScreenState extends State<SquadFriendsScreen> {
  @override
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
          child:Container(
            padding: EdgeInsets.all(20.r),
            child:  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.w,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                          InkWell(
                            onTap: (){
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
                      Row(
                        children: [

                               ButtonWidget(
                                  height: 38.h,
                                  width: 158.w,
                                  text: "Create A Squad",
                                  textSize: 16.sp,
                                  fw: FontWeight.w600,
                                  textColor: ColorConstant.whiteColor,
                                  color: ColorConstant.squadPurpleColor,
                                  radius: 100.r,
                                  onTap: (){
                                    Get.to(( )=>SquadInviteScreen());
                                  },
                                ),


                          SizedBox(width: 8.w,),
                          Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(48.r),
                                color: Colors.white38
                            ),
                            child: Center(child: Icon(Icons.notification_important_outlined,color: ColorConstant.whiteColor,),),
                          ),
                        ],

                      ),
                    ],
                  ),
                  SizedBox(height: 25.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    CustomText("Friends",color: ColorConstant.whiteColor,fw: FontWeight.w700,size: 20,),
                    Icon(Icons.more_horiz,color: ColorConstant.whiteColor,),
                  ],),
                  SizedBox(height: 20.h,),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        for(int i=0;i<ImageConstants.profileImagesList.length;i++)
                      FriendsWidget(
                      image:ImageConstants.profileImagesList[i],
                      friendName:"Wade Warren",
                        level:"Level 1 player",
                       age:"25", countryName:"Pakistan"
                      ),
                        SizedBox(height: 20.h,),
                        CustomText("My Squads",color: ColorConstant.whiteColor,fw: FontWeight.w700,size: 20,),
                        SizedBox(height: 20.h,),
                        for(int i=0;i<ImageConstants.profileImagesList.length;i++)
                          FriendsWidget(
                              image:ImageConstants.profileImagesList[i],
                              friendName:"Wade Warren",
                              level:"Level 1 player",
                              age:"25", countryName:"Pakistan"
                          ),
                          SizedBox(height: 20.h,)
                      ],),
                    ),
                  ),

                ]
            ),
          ),
        ),),
    );
  }
}
