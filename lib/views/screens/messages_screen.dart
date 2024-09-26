import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text_form_field.dart';
import 'package:e_squadifi/views/custom_widgets/reuseable_gradient_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
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
                          Row(
                            children: [
                              InkWell(
                                onTap: (){
                                  Get.back();
                                  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
                              SizedBox(width: 15.w,),
                              CustomText("Community Name",fw: FontWeight.w700,size: 18.sp,color: ColorConstant.whiteColor,),
                            ],),
                          Icon(Icons.video_camera_front_outlined,color: ColorConstant.whiteColor,),
                          Icon(Icons.call_outlined,color: ColorConstant.whiteColor,)
                        ],
                      ),

                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(children: [
                              receiverMessage(),
                                senderMessage(),
                            receiverMessage(),
                            senderMessage(),
                            receiverMessage(),
                            senderMessage()
                          ],),
                        ),
                      ),
                      Divider(color: ColorConstant.greyColor,),
                      SizedBox(height: 10.h,),
                      Container(
                        width: 327.w,
                        height:55.h,
                        decoration: BoxDecoration(color: ColorConstant.greyColor,
                        borderRadius: BorderRadius.circular(16.r)
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(children: [
                            Icon(Icons.emoji_emotions_outlined,color: ColorConstant.whiteColor,),
                          Expanded(child: CustomTextFormField(hintText: "Send a message",)),
                            GestureDetector(
                                onTap: (){},
                                child: Icon(Icons.send,color: ColorConstant.whiteColor,)),
                          ],),
                        ),
                      ),
                    ]
                ),
              ),
            ),),
        ),
      ),
    );
  }
}

Widget receiverMessage(){
  return Row(children: [
    ReuseableGradientContainer(
      height: 38.h,
      width: 38.w,
      borderRadius: 16.r,
      image: ImageConstants.profileImagesList[2],
      padding: 1.r,
      gradientColor: ColorConstant.profilePicGradient,
      color: ColorConstant.deepPurpleColor,
      internalPadding: 2.r,
    ),
    SizedBox(width: 18.w,),
    Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Container(
                width: 169,
                  padding: EdgeInsets.all(15.r),
                margin: EdgeInsets.only(top: 60.h),
              decoration: BoxDecoration(
                  color: ColorConstant.deepPurpleColor,
                  border: Border.all(width: 1,color: ColorConstant.messageBorderColor),
                  borderRadius: BorderRadius.only(topRight:Radius.circular(18.r) ,bottomLeft:Radius.circular(18.r) ,bottomRight:Radius.circular(18.r) )),
                  child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               Flexible(child: CustomText("hy",color: ColorConstant.whiteColor,size: 13.sp,fw: FontWeight.w400,)),
              ],)
                    ),
          SizedBox(height: 10.w,),
         CustomText("12:00 Am",color: ColorConstant.whiteColor,size: 11.sp,fw: FontWeight.w400,),
      ],),
    )
  ],);
}

Widget senderMessage(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
               Container(
                 width: 169,
                margin: EdgeInsets.only(top: 60.h),

                          padding: EdgeInsets.all(15.r),
                          decoration: BoxDecoration(
                color: ColorConstant.senderMessageColor,
                  border: Border.all(width: 1,color: ColorConstant.messageBorderColor),
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(18.r) ,bottomLeft:Radius.circular(18.r) ,bottomRight:Radius.circular(18.r) )),
                          child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(child: CustomText("hi sdaljs ld;sakd asd;salkd;as sjd sl,d;lsad sdsa;lmdsa;md sdmasmdl",color: ColorConstant.whiteColor,size: 13.sp,fw: FontWeight.w400,)),
                          ],)
                  ),

          SizedBox(height: 10.w,),
        CustomText("12:00 Am",color: ColorConstant.whiteColor,size: 11.sp,fw: FontWeight.w400,),
      ],),
    ),
    SizedBox(width: 18.w,),
    ReuseableGradientContainer(
      height: 38.h,
      width: 38.w,
      borderRadius: 16.r,
      image: ImageConstants.profileImagesList[2],
      padding: 1.r,
      gradientColor: ColorConstant.profilePicGradient,
      color: ColorConstant.deepPurpleColor,
      internalPadding: 2.r,
    ),
  ],);
}