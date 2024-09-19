import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/controllers/profile_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomListTile extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? height;
  final double? width;
  final Image? image;
  final FontWeight? fontWeight;
  final double? size;
  final double? radiusTopLeft;
  final double? radiusBottomLeft;
  final double? radiusAll;
  final VoidCallback? onTap;
  final int? index;
  const CustomListTile({super.key,this.text,
    this.color,
    this.height,
    this.width,
    this.image,
    this.fontWeight,
    this.size,
    this.radiusTopLeft,
    this.radiusBottomLeft,
    this.radiusAll,
    this.onTap,
    this.index
  });
  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (profileController){
          return Column(
            children: [
              FittedBox(
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: EdgeInsets.only(left: 19.w,right: 5.w),
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                        color:index==profileController.selectedProfileTileIndex?color: Colors.transparent,
                        borderRadius: BorderRadius.only(topLeft:Radius.circular(radiusTopLeft??0.r),
                            bottomLeft: Radius.circular(radiusBottomLeft??0.r))
                    ),
                    child: Center(
                      child: CustomText(text,
                        fw: index != profileController.selectedProfileTileIndex?FontWeight.w400 :fontWeight,
                        size: size,
                        color:index != profileController.selectedProfileTileIndex?Colors.white60:ColorConstant.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
              index==4?Container():Container(width: width,decoration: BoxDecoration( border: Border.all(width: 0.4.w,color: ColorConstant.dividerColor)),),
            ],

          );
        },

      );

  }
}
