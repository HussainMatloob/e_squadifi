import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_image_container.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/screens/live_streaming_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class GamesListScreen extends StatefulWidget {
  const GamesListScreen({super.key,});
  @override
  State<GamesListScreen> createState() => _GamesListScreenState();
}
class _GamesListScreenState extends State<GamesListScreen> {
  @override
  String videoUrl = "https://drive.google.com/uc?export=view&id=1uQYXnnrwlsQTk9u9sAB4dP9L4VFGuUFX";
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            GestureDetector(
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
                child: Center(
                  child: Icon(
                    CupertinoIcons.back,
                    color: ColorConstant.whiteColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25.h,),
                    for(int i=0;i<=10;i++)
                      FittedBox(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Row(children: [
                            CustomImageContainer(
                              image: ImageConstants.memberPost,
                              width: 95.w,
                              height: 127.h,
                              borderRadius: 16.r,
                              onTap: (){
                                Get.to(()=>LiveStreamingScreen(videoUrl:videoUrl,));
                              },
                            ),
                            SizedBox(width: 15.w,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText("League of Legends",fw: FontWeight.w700,size: 20.sp,color: ColorConstant.whiteColor,),
                                SizedBox(height: 10.h,),
                                Row(children: [
                                  ButtonWidget(
                                    height: 24.h,
                                    paddingHorizontal: 10.w,
                                    radius: 6.r,
                                    color: ColorConstant.greyColor,
                                    text: "Action",
                                    fw: FontWeight.w600,
                                    textSize: 10.sp,
                                    textColor: ColorConstant.whiteColor,
                                  ),
                                  SizedBox(width: 5.w,),
                                  ButtonWidget(
                                    height: 24.h,
                                    paddingHorizontal: 10.w,
                                    radius: 6.r,
                                    color: ColorConstant.greyColor,
                                    text: "Shooter",
                                    fw: FontWeight.w600,
                                    textSize: 10.sp,
                                    textColor: ColorConstant.whiteColor,
                                  ),
                                  SizedBox(width: 5.w,),
                                  ButtonWidget(
                                    height: 24.h,
                                    paddingHorizontal: 10.w,
                                    radius: 6.r,
                                    color: ColorConstant.greyColor,
                                    text: "RPG",
                                    fw: FontWeight.w600,
                                    textSize: 10.sp,
                                    textColor: ColorConstant.whiteColor,
                                  )
                                ],),
                                SizedBox(height: 15.h,),
                                Row(children: [
                                  ButtonWidget(
                                    onTap: (){},
                                    text: "Just Play",
                                    textColor: ColorConstant.whiteColor,
                                    textSize: 10.sp,
                                    fw: FontWeight.w700,
                                    radius: 47.r,
                                    color: ColorConstant.squadPurpleColor,
                                    height: 32.h,
                                    paddingHorizontal: 10.w,
                                    icon: Icon(Icons.sports_esports_outlined,color: ColorConstant.whiteColor,),
                                  ),
                                  SizedBox(width: 8.w,),
                                  ButtonWidget(
                                    radius: 47.r,
                                    color: ColorConstant.cyanBlue,
                                    height: 32.h,
                                    width: 32.w,

                                    icon: Icon(Icons.emoji_events_outlined,color: ColorConstant.whiteColor,),
                                  ),
                                  SizedBox(width: 8.w,),
                                  ButtonWidget(
                                    radius: 47.r,
                                    color: ColorConstant.blueColor,
                                    height: 32.h,
                                    width: 32.w,
                                    icon: Icon(Icons.bar_chart_outlined,color: ColorConstant.whiteColor,),
                                  )
                                ],)
                              ],)
                          ],),
                        ),
                      ),
                  ],),
              ),
            ),
          ],)

        ),
      ),
    );
  }
}
