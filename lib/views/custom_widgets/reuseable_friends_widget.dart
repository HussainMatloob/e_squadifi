import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_image_container.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FriendsWidget extends StatefulWidget {

  final String? image;
  final String? friendName;
  final String? level;
  final String? age;
  final String? countryName;
  const FriendsWidget({super.key,
  this.image,
    this.friendName,
    this.level,
    this.age,
    this.countryName
  });


  @override
  State<FriendsWidget> createState() => _FriendsWidgetState();
}

class _FriendsWidgetState extends State<FriendsWidget> {
  @override
  Widget build(BuildContext context) {
    return  FittedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomImageContainer(
                image: widget.image,
                width: 95.w,
                height: 89.h,
                borderRadius: 16.r,

              ),
              SizedBox(width: 8.w,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(widget.friendName,color:ColorConstant.whiteColor,fw: FontWeight.w700,size: 24.sp,),
                      SizedBox(width: 25.w,),
                      Icon(Icons.more_vert,color: Colors.white,)
                    ],),

                  Row(children: [
                    ButtonWidget(
                      radius: 6.r,
                      paddingHorizontal: 10.w,
                      height:  22.h,
                      text: widget.level,
                      fw: FontWeight.w500,
                      textSize: 10.sp,
                      color: ColorConstant.greyColor,
                      textColor: ColorConstant.whiteColor,
                    ),
                    SizedBox(width: 5.w,),
                    ButtonWidget(
                      radius: 6.r,
                      paddingHorizontal: 10.w,
                      height:  22.h,
                      text: "Age:${widget.level}",
                      fw: FontWeight.w500,
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
                    text: "Country:${widget.level}",
                    fw: FontWeight.w500,
                    textSize: 10.sp,
                    color: ColorConstant.greyColor,
                    textColor: ColorConstant.whiteColor,
                  )
                ],),

            ],),
          SizedBox(height: 17.h,)
        ],

      ),
    );
  }
}
