import 'package:e_squadifi/constants/color_constants.dart'; // Your custom color constants
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        FocusScope.of(context).unfocus();
      },
      child: WillPopScope(
        onWillPop: () async{
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
          return true;
        },
        child: Scaffold(
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
        borderRadius: BorderRadius.circular(50.r),),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: ColorConstant.gradientScreenColor,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                  borderRadius: BorderRadius.circular(50.r)
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  // Add scroll view here to avoid overflow

                    child: Container(
                      padding: EdgeInsets.all(20.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Back Arrow Icon
                          IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () {
                              Get.back();
                              SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
                            },
                          ),
                          SizedBox(height: 30.h),

                          // "SignUp" text
                          Text(
                            'SignUp',
                            style: TextStyle(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10.h),

                          // Subtext for description
                          Text(
                            'Lorem ipsum dolor sit amet consectetur. In viverra eget orci amet cras.',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 30.h),

                          // Two buttons for sign up with phone or email
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(vertical: 15.h),
                                    backgroundColor: Colors.transparent,
                                    side: BorderSide(color: Colors.cyan),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Sign up with Phone',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(vertical: 15.h),
                                    backgroundColor: Colors.cyan,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Sign up with Email',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h),

                          // Input field for phone or email
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            decoration: BoxDecoration(
                              color: Colors.grey[850],
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Enter your phone / email',
                                hintStyle: TextStyle(color: Colors.white70),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 30.h),

                          // Sign up button
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 15.h),
                                backgroundColor: Colors.cyan,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              onPressed: () {
                                SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(fontSize: 16.sp, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),

                          // OR divider
                          Row(
                            children: [
                              Expanded(child: Divider(color: Colors.white54)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Text(
                                  'Or',
                                  style: TextStyle(color: Colors.white54),
                                ),
                              ),
                              Expanded(child: Divider(color: Colors.white54)),
                            ],
                          ),
                          SizedBox(height: 20.h),

                          // Social media buttons
                          _buildSocialButton(
                            icon: Icons.apple,
                            text: 'Sign in with Apple',
                            backgroundColor: Colors.black,
                          ),
                          SizedBox(height: 10.h),
                          _buildSocialButton(
                            icon: Icons.g_mobiledata,
                            text: 'Continue with Google',
                            backgroundColor: Colors.red,
                          ),
                          SizedBox(height: 10.h),
                          _buildSocialButton(
                            icon: Icons.facebook,
                            text: 'Continue with Facebook',
                            backgroundColor: Colors.blue,
                          ),
                          SizedBox(height: 10.h),
                          _buildSocialButton(
                            icon: Icons.camera,
                            text: 'Continue with Instagram',
                            backgroundColor: Colors.pink,
                          ),
                          SizedBox(height: 20.h),
                          // Sign-in text at the bottom
                          FittedBox(
                            child: Row(
                              children: [
                                CustomText(
                                  "Have an Account?",
                                  fw: FontWeight.w400,
                                  size: 14.sp,
                                  color: ColorConstant.whiteColor,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
                                  },
                                  child: CustomText(
                                    "Sign in",
                                    fw: FontWeight.w700,
                                    size: 14.sp,
                                    color: ColorConstant.whiteColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to build social buttons
  Widget _buildSocialButton({
    required IconData icon,
    required String text,
    required Color backgroundColor,
  }) {
    return Container(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(icon, size: 24.sp, color: Colors.white),
        label: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
