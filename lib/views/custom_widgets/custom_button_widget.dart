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
        this.onTap
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius??0.r)
        ),
        child: Row(
          children: [
          icon!,
            SizedBox(width: 7.w,),
            CustomText( text,fw: fw,size: textSize,color: textColor,),
          ],
        ),
      ),
    );
  }
}
