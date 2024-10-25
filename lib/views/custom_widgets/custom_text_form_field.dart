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
  final Widget? child;
  final bool? isObSecure;
  final VoidCallback? obSecureTap;
  final Function(dynamic value)? onChanged;
  final String? Function(String?)? validateFunction;
  final TextStyle? hintStyle;
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
    this.focusNode, this.fillColor, this.hintTextSize, this.hintTextColor, this.hintTextFw, this.borderRadius, this.horizontalPadding, this.verticalPadding, this.child, this.isObSecure, this.onChanged, this.hintStyle, this.obSecureTap, this.validateFunction
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          color: widget.color??Colors.transparent,
          borderRadius: BorderRadius.circular(widget.borderRadius??10.r)),
      child: TextFormField(
        onChanged: widget.onChanged,
        focusNode: widget.focusNode,
        //keyboardType: TextInputType.multiline,
        //maxLines: null,
        obscureText: widget.isObSecure??false, // Toggle visibility based on state
        obscuringCharacter: "*",
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text,
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintStyle:widget.hintStyle??TextStyle(
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
          prefixIcon: widget.child == null
              ? null
              : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 10.w,
              ),
              widget.child!,
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
            suffixIcon: widget.obSecureTap!=null?InkWell(
                onTap: widget.obSecureTap,
                child: widget.isObSecure! ? Icon(Icons.visibility_off_outlined,color: ColorConstant.whiteColor,):Icon(Icons.remove_red_eye,color: ColorConstant.whiteColor,)
            ):null,
            fillColor: widget.fillColor??ColorConstant.greyColor,
          filled: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: widget.verticalPadding ?? 0.h,
            horizontal: widget.horizontalPadding ?? 0.w,
          )
        ),
        validator:widget.validateFunction
      ),
    );
  }
}