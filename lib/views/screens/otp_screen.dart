import 'package:e_squadifi/views/screens/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_squadifi/constants/color_constants.dart';
import 'package:get/get.dart'; // Assuming your constants file

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return Scaffold(
      body: Container(
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
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            gradient: LinearGradient(
              colors: ColorConstant.gradientScreenColor,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 50.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  IconButton(
                    icon:
                        Icon(Icons.arrow_back, color: Colors.white, size: 28.sp),
                    onPressed: () {
                       Get.back();
                    },
                  ),
                  SizedBox(height: 20.h),

                  // Heading
                  Text(
                    'Code Verification',
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.h),

                  // Subheading
                  Text(
                    'Enter Verification code you received in your email.',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Code Input Boxes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      6,
                      (index) => Container(
                        width: 40.w,
                        height: 55.h,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                            ),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),

                  // Verify Code Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(( )=>BottomNavBar());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 100.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(47.r),
                        ),
                      ),
                      child: Text(
                        'Verify Code',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // Resend Code
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Didn\'t get the Code? Resend Code',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
