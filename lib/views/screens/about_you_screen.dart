import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_squadifi/constants/color_constants.dart'; // Assuming this is your constants file

class AboutYouScreen extends StatefulWidget {
  const AboutYouScreen({super.key});

  @override
  State<AboutYouScreen> createState() => _AboutYouScreenState();
}

class _AboutYouScreenState extends State<AboutYouScreen> {
  String? selectedYear;
  String? selectedMonth;
  String selectedGender = 'Male';

  final List<String> years =
      List.generate(100, (index) => (2024 - index).toString());
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: ColorConstant.gradientScreenColor,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 28.sp),
                onPressed: () {
                  // Navigator.pop(context);
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
                'Answer some questions to let you get started with your profile.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              SizedBox(height: 40.h),

              // Age Dropdowns
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.2),
                        hintText: 'Year',
                        hintStyle:
                            TextStyle(color: Colors.white.withOpacity(0.6)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      dropdownColor: Colors.blueGrey,
                      value: selectedYear,
                      onChanged: (newValue) {
                        setState(() {
                          selectedYear = newValue;
                        });
                      },
                      items: years.map((year) {
                        return DropdownMenuItem<String>(
                          value: year,
                          child: Text(
                            year,
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.2),
                        hintText: 'Month',
                        hintStyle:
                            TextStyle(color: Colors.white.withOpacity(0.6)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      dropdownColor: Colors.blueGrey,
                      value: selectedMonth,
                      onChanged: (newValue) {
                        setState(() {
                          selectedMonth = newValue;
                        });
                      },
                      items: months.map((month) {
                        return DropdownMenuItem<String>(
                          value: month,
                          child: Text(
                            month,
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              // Gender Selection
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GenderButton(
                    gender: 'Male',
                    selectedGender: selectedGender,
                    onPressed: () {
                      setState(() {
                        selectedGender = 'Male';
                      });
                    },
                  ),
                  GenderButton(
                    gender: 'Female',
                    selectedGender: selectedGender,
                    onPressed: () {
                      setState(() {
                        selectedGender = 'Female';
                      });
                    },
                  ),
                  GenderButton(
                    gender: 'Non-Binary',
                    selectedGender: selectedGender,
                    onPressed: () {
                      setState(() {
                        selectedGender = 'Non-Binary';
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 40.h),

              // Next Button
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 100.w),
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

              Spacer(),

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
    );
  }
}

class GenderButton extends StatelessWidget {
  final String gender;
  final String selectedGender;
  final VoidCallback onPressed;

  const GenderButton({
    Key? key,
    required this.gender,
    required this.selectedGender,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              selectedGender == gender ? Colors.cyan : Colors.transparent,
          side: BorderSide(color: Colors.cyan),
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(47.r),
          ),
        ),
        child: Text(
          gender,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
