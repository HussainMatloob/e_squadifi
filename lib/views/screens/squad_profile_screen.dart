import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_image_container.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/reuseable_colum_widget.dart';
import 'package:e_squadifi/views/custom_widgets/reuseable_friends_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SquadProfileScreen extends StatefulWidget {
  const SquadProfileScreen({super.key});

  @override
  State<SquadProfileScreen> createState() => _SquadProfileScreenState();
}

class _SquadProfileScreenState extends State<SquadProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          borderRadius: BorderRadius.circular(50.r),
        ),
        child:  Container(

          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:ColorConstant.primaryGradiantColors,

              begin: FractionalOffset(1.0,1.0),
              end: FractionalOffset(-0.2,0.1),
              // begin: Alignment.topLeft, // Start the gradient at top-left
              // end: Alignment.bottomRight, // End the gradient at bottom-right
              stops: [0.0, 0.2, 0.5, 0.8, 1.0],
            ),
            borderRadius: BorderRadius.circular(50.r),
            // border: Border.all(width: 10,color: Colors.purple)
          ),
          child:   Column(
            mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                              child: Center(child: Icon( Icons.search,color: ColorConstant.whiteColor,),),
                            ),
                          ),
                        ],

                      ),
                      SizedBox(height: 30.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          CustomImageContainer(
                            image: ImageConstants.profileImagesList[2],
                            width: 126.w,
                            height: 111.h,
                            borderRadius: 16.r,

                          ),
                          SizedBox(width: 8.w,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText("Wade Warren",color:ColorConstant.whiteColor,fw: FontWeight.w700,size: 22.sp,),

                              Row(children: [
                                ButtonWidget(
                                  radius: 6.r,
                                  paddingHorizontal: 10.w,
                                  height:  22.h,
                                  text: "Skill level",
                                  fw: FontWeight.w700,
                                  textSize: 10.sp,
                                  color: ColorConstant.greyColor,
                                  textColor: ColorConstant.whiteColor,
                                ),
                                SizedBox(width: 5.w,),
                                ButtonWidget(
                                  radius: 6.r,
                                  paddingHorizontal: 10.w,
                                  height:  22.h,
                                  text: "RPG",
                                  fw: FontWeight.w700,
                                  textSize: 10.sp,
                                  color: ColorConstant.greyColor,
                                  textColor: ColorConstant.whiteColor,
                                )
                              ],),
                              SizedBox(height: 5.h,),
                              ButtonWidget(
                                radius: 6.r,
                                paddingHorizontal: 10.w,
                                height:  22.h,
                                text: "Preferred Role",
                                fw: FontWeight.w700,
                                textSize: 10.sp,
                                color: ColorConstant.greyColor,
                                textColor: ColorConstant.whiteColor,
                              )
                            ],),

                        ],),
                    ],

                  ),
                ),

             Divider(color:ColorConstant.purpleLightColor ,),

                Container(
                    padding: EdgeInsets.symmetric(horizontal:  40.w),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      ColumnWidget(
                        text1: "233",
                        text2: "Friends",
                      ),
                        SizedBox(
                          height: 90.h,  // Set the desired height for the divider
                          child: VerticalDivider(
                            color: ColorConstant.purpleLightColor,
                            width: 1,

                          ),
                        ),
                        ColumnWidget(
                          text1: "233",
                          text2: "Friends",
                        ),
                        SizedBox(
                          height: 90.h,  // Set the desired height for the divider
                          child: VerticalDivider(
                            color: ColorConstant.purpleLightColor,

                          ),
                        ),
                        ColumnWidget(
                          text1: "233",
                          text2: "Friends",
                        ),

                    ],)),

                Divider(color:ColorConstant.purpleLightColor,),
                Container(
                  padding: EdgeInsets.all(20.r),
                  child: Row(children: [CustomText("Games and Data",color: ColorConstant.whiteColor,fw: FontWeight.w700,size: 14.sp,)],),),
               Container(
                 padding: EdgeInsets.symmetric(horizontal:  20.r),
                    child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child:
                                Row(
                                  children: [
                                    for(int i=0;i<6;i++)
                                    Padding(
                                      padding: EdgeInsets.only(right: 10.w),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            CustomImageContainer(
                                              width: 100.w,
                                              height: 133.h,
                                              borderRadius: 16.r,
                                              image: ImageConstants.memberPost,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],

                                ),


                          ),
                  ),

                Container(
                  padding: EdgeInsets.all(20.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    CustomText("List of goals and aspirations",fw: FontWeight.w600,size: 14.w,color: ColorConstant.whiteColor,),
                      SizedBox(height: 20.h),
                    Wrap(
                       alignment: WrapAlignment.start,
                       //direction: Axis.horizontal,
                       spacing: 12.w,
                       runSpacing: 15.w,
                       children: [
                         FittedBox(
                           child: ButtonWidget(
                             text: "Family",
                             height: 39.h,
                             color: ColorConstant.cyanBlue,
                             radius: 90.r,
                             textColor: ColorConstant.whiteColor,
                             fw: FontWeight.w700,
                             textSize: 14.sp,
                             paddingHorizontal: 15.w,
                             onTap: (){
                             },
                           ),
                         ),
                         FittedBox(
                           child: ButtonWidget(
                             text: "Creativity",
                             height: 39.h,
                             color: ColorConstant.cyanBlue,
                             radius: 90.r,
                             textColor: ColorConstant.whiteColor,
                             fw: FontWeight.w700,
                             textSize: 14.sp,
                             paddingHorizontal: 15.w,
                             onTap: (){
                             },
                           ),
                         ),
                         FittedBox(
                           child: ButtonWidget(
                             text: "Relaxation and self-core",
                             height: 39.h,
                             color: ColorConstant.cyanBlue,
                             radius: 90.r,
                             textColor: ColorConstant.whiteColor,
                             fw: FontWeight.w700,
                             textSize: 14.sp,
                             onTap: (){
                             },
                             paddingHorizontal: 15.w,
                           ),
                         ),
                       ],
                     ),


                  ],),
                ),





              ],

            ),

        ),),
    );
  }
}
