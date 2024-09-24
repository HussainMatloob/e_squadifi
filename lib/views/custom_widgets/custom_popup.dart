
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPopUpDialog extends StatelessWidget {
 // final CustomPopupMenuController controller = CustomPopupMenuController();
  final double? width;
  final double? height;
  final Color? color;
  final Widget? child;
  final Widget? icon;
  final Widget? filterButton;
  final  CustomPopupMenuController? controller;
   CustomPopUpDialog({super.key,
       this.width,
    this.height,
     this.color,
      this.child,
     this.icon,
     this.filterButton,
     this.controller
  });
  @override
  Widget build(BuildContext context) {
    return   CustomPopupMenu(
      controller: controller,
      pressType: PressType.singleClick, // Trigger the popup with a click
      verticalMargin: -7.h, // Space below the icon
      menuBuilder: () => Transform.translate(
        offset: Offset(-55, 0), // Manually adjust the position (negative moves left)
      child: Container(
        width: width??0.w, // Custom width
        height: height??0.h, // Custom height
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(19.r),
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
        ),
        child:  child,
      ),
    ),
        child: icon==null? ButtonWidget(
          height: 20.h,
          icon: Icon(Icons.filter_alt_outlined,
              color: ColorConstant.whiteColor,
              size: 20.sp),
          text: "Filter",
          borderColor: ColorConstant.cyanBlue,
          radius: 8.r,
          textSize: 12.sp,
          fw: FontWeight.w700,
          textColor: ColorConstant.whiteColor,
          onTap: () {
            controller!.showMenu(); // Trigger popup
          },
          borderWidth: 1.w,
          paddingHorizontal: 10.w,
        ): icon!
    );
  }
}


