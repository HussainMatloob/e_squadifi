import 'package:e_squadifi/views/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_squadifi/constants/color_constants.dart';
import 'package:get/get.dart'; // Assuming your constants file

class AboutYouPersonalityScreen extends StatefulWidget {
  const AboutYouPersonalityScreen({super.key});

  @override
  State<AboutYouPersonalityScreen> createState() =>
      _AboutYouPersonalityScreenState();
}

class _AboutYouPersonalityScreenState extends State<AboutYouPersonalityScreen> {
  String selectedTrait = '';
  List<String> traits = [
    'Extroverted',
    'Introverted',
    'Curious',
    'Organized',
    'Ambitious',
    'Easygoing',
    'Emotional',
    'Analytical',
    'Teamwork',
    'Problem-solving skills',
    'Mental endurance',
    'Reaction time'
  ];

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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            gradient: LinearGradient(
              colors: ColorConstant.primaryGradiantColor,
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
                    'About You',
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.h),

                  // Subheading
                  Text(
                    'Which of the following activities do you enjoy in your free time?',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Personality Traits Text
                  Text(
                    'Personality traits',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 15.h),

                  // Traits (Dynamic Buttons)
                  Wrap(
                    spacing: 10.w,
                    runSpacing: 10.h,
                    children: traits
                        .map((trait) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedTrait = trait;
                                });
                              },
                              child: GoalButton(
                                goal: trait,
                                isSelected: selectedTrait == trait,
                              ),
                            ))
                        .toList(),
                  ),
                  SizedBox(height: 30.h),

                  // Next Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(( )=> OtpScreen());
                        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
                        'Next',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ),
                  ),

                  SizedBox(height: 30.h),

                  // User Agreement and Privacy Policy
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'User Agreement',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 12.sp,
                        ),
                      ),
                      Text(
                        'Privacy & Cookie Policy',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
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

class GoalButton extends StatelessWidget {
  final String goal;
  final bool isSelected;

  const GoalButton({
    Key? key,
    required this.goal,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: isSelected ? Colors.cyan : Colors.transparent,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.teal),
      ),
      child: Text(
        goal,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.cyan,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
