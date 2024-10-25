import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_list_tile.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/reuseable_gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShareLinkScreen extends StatefulWidget {
  const ShareLinkScreen({super.key});

  @override
  State<ShareLinkScreen> createState() => _ShareLinkScreenState();
}

class _ShareLinkScreenState extends State<ShareLinkScreen> {
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
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                                CustomText("Community Group",fw: FontWeight.w400,size: 14.sp,color: ColorConstant.whiteColor,)
                              ],),

                          ],),
                        SizedBox(width: 15.w,),
                        Icon(Icons.more_vert,color: ColorConstant.whiteColor,)
                      ],
                    ),
                  ),
                  SizedBox(height: 50.w,),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Container(
                          padding: EdgeInsets.all(20.r),
                          width: 310.w,
                          decoration: BoxDecoration(
                            color: ColorConstant.greyLightColor,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child:CustomListTile(
                            text: "http://chat.esquadifi.com/abcdef",
                            color: ColorConstant.whiteColor,
                            icon: Icon(
                              Icons.link,
                              color: ColorConstant.whiteColor,
                              size: 20,
                            ),
                            fw: FontWeight.w500,
                            textSize: 14.sp,
                            fontStyle: FontStyle.italic,
                            sizedBoxedWidth: 12.w,
                            width: 32.w,
                            height: 32.h,
                            containerColor: ColorConstant.dullPurpleColor,
                            borderRadius: 8.r,
                            onTap: (){},
                          ),
                        ),
                        SizedBox(height: 15.w,),
                        Container(
                          padding: EdgeInsets.all(20.r),
                          width: 310.w,
                          height: 213.h,
                          decoration: BoxDecoration(
                            color: ColorConstant.greyLightColor,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomListTile(
                                text: "Copy link",
                                color: ColorConstant.whiteColor,
                                icon: Icon(
                                  Icons.copy,
                                  color: ColorConstant.whiteColor,
                                  size: 20,
                                ),
                                fw: FontWeight.w500,
                                textSize: 16.sp,
                                fontStyle: FontStyle.italic,
                                sizedBoxedWidth: 12.w,
                                width: 32.w,
                                height: 32.h,
                                containerColor: ColorConstant.dullPurpleColor,
                                borderRadius: 8.r,
                                onTap: (){},
                              ),
                              Divider(color: ColorConstant.greyColor,),
                              CustomListTile(
                                text: "Share link",
                                color: ColorConstant.whiteColor,
                                icon: Icon(
                                  Icons.share,
                                  color: ColorConstant.whiteColor,
                                  size: 20,
                                ),
                                fw: FontWeight.w500,
                                textSize: 16.sp,
                                fontStyle: FontStyle.italic,
                                sizedBoxedWidth: 12.w,
                                width: 32.w,
                                height: 32.h,
                                containerColor: ColorConstant.dullPurpleColor,
                                borderRadius: 8.r,
                                onTap: (){},
                              ),
                              Divider(color: ColorConstant.greyColor,),
                              CustomListTile(
                                text: "QR code",
                                color: ColorConstant.whiteColor,
                                icon: Icon(
                                  Icons.qr_code,
                                  color: ColorConstant.whiteColor,
                                  size: 20,
                                ),
                                fw: FontWeight.w500,
                                textSize: 16.sp,
                                fontStyle: FontStyle.italic,
                                sizedBoxedWidth: 12.w,
                                width: 32.w,
                                height: 32.h,
                                containerColor: ColorConstant.dullPurpleColor,
                                borderRadius: 8.r,
                                onTap: (){},
                              ),
                            ],),
                        ),

                      ],),
                    ),
                  )
                ]
            ),


          ),
        ),),
    );
  }
}
 