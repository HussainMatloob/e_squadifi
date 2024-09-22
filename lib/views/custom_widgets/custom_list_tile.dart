import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTile extends StatelessWidget {
  final Icon? icon;
  final Color? color;
  final String? text;
  final VoidCallback? onTap;
  final FontWeight? fw;
  final double? textSize;
  final FontStyle? fontStyle;
  final double? sizedBoxedWidth;
  const CustomListTile({super.key,
    this.icon,
    this.color,
    this.text,
    this.onTap,
  this.textSize,
    this.fw,
    this.fontStyle,
    this.sizedBoxedWidth
  });

  @override
  Widget build(BuildContext context) {
  return
        GestureDetector(
          onTap: onTap,
          child: Row(children: [
            icon==null?Container():icon!,
            SizedBox(width: sizedBoxedWidth??0.w,),
            Flexible(child: CustomText(text,fw: fw,size: textSize,color: color,fontStyle: fontStyle ))
          ],),
        );
  }
}


