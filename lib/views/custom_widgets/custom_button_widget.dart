import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? height;
  final double? width;
  final Image? image;
  final FontWeight? fw;
  final Icon?  icon;
  final double? textSize;
  final double? radius;
  final Color? textColor;
  final VoidCallback? onTap;
  final double? paddingHorizontal;
  final double? marginAll;
  final double? borderWidth;
  final Color? borderColor;
    final double? sizedBoxWidth;
  const ButtonWidget(
      {super.key, this.text,
        this.color,
        this.height,
        this.width,
        this.image,
        this.fw,
        this.icon,
        this.textSize,
        this.radius,
        this.textColor,
        this.onTap,
        this.paddingHorizontal,
        this.marginAll,
        this.borderWidth,
        this.borderColor,
        this.sizedBoxWidth
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(marginAll?? 0.r),
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal??0.r),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: borderWidth !=null? Colors.transparent:color,
          borderRadius: BorderRadius.circular(radius??0.r),
            border: Border.all(width: borderWidth??0.w,color:borderColor??Colors.transparent),
        ),
        child: icon==null?Center(child:  CustomText( text,fw: fw,size: textSize,color: textColor,),) :Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          icon!,
            SizedBox(width: sizedBoxWidth==null?7.w:sizedBoxWidth,),
            CustomText( text,fw: fw,size: textSize,color: textColor,),
          ],
        ),
      ),
    );
  }
}
