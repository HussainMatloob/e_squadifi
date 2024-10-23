import 'package:e_squadifi/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? message;
  final String? hintText;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final double? width;
  final double? height;
  final bool isPassword;
  final Color? color;
  final FocusNode? focusNode;
  final Color? fillColor;
  final double? hintTextSize;
  final Color? hintTextColor;
  final FontWeight? hintTextFw;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.controller,
    this.message,
    this.borderColor =const Color(0xFF3A5175),
    this.focusedBorderColor = const Color(0xFF3A5175),
    this.errorBorderColor = Colors.red,
    this.width,
    this.height,
    this.isPassword = false,
    this.color,
    this.focusNode, this.fillColor, this.hintTextSize, this.hintTextColor, this.hintTextFw, this.borderRadius, this.horizontalPadding, this.verticalPadding
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width??0.w,
      height: widget.height??0.h,
      decoration: BoxDecoration(
          color: widget.color??Colors.transparent,
          borderRadius: BorderRadius.circular(widget.borderRadius??10.r)),
      child: TextFormField(
        focusNode: widget.focusNode,
        //keyboardType: TextInputType.multiline,
        maxLines: null,
        obscureText: false, // Toggle visibility based on state
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text,
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintStyle: TextStyle(
            fontWeight:widget.hintTextFw??FontWeight.w400,
            fontSize: widget.hintTextSize??16.sp,
            color: widget.hintTextColor??Color(0xFF9E9E9E),

          ),
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius??10.r),
            borderSide: BorderSide(color: widget.borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius??10.r),
            borderSide: BorderSide(color: widget.focusedBorderColor, width: 2.0.w),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius??10.r),
            borderSide: BorderSide(color: widget.borderColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius??10.r),
            borderSide: BorderSide(color: widget.errorBorderColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius??10.r),
            borderSide: BorderSide(color: widget.errorBorderColor, width: 2.0.w),
          ),
          suffixIcon:null,
            fillColor: widget.fillColor??ColorConstant.greyColor,
          filled: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: widget.verticalPadding ?? 0.r,
            horizontal: widget.horizontalPadding ?? 0.r,
          )
        ),
        validator: (value) {
          if(value==null||value.trim().isEmpty){
            return  null;
          }
          else {
            return null;
          }
        },
      ),
    );
  }
}