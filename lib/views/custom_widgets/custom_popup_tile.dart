import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPopupTile extends StatelessWidget {
  final Icon? icon;
  final Color? color;
  final String? text;
  final VoidCallback? onTap;
  const CustomPopupTile({super.key,
    this.icon,
    this.color,
    this.text,
    this.onTap});

  @override
  Widget build(BuildContext context) {
  return
      Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: Row(children: [
            icon!,
            SizedBox(width: 10.w,),
            CustomText(text,fw: FontWeight.w700,size: 16.sp,color: color,)
          ],),
        ),
      );
  }
}


