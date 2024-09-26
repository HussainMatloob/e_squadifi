import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/reuseable_gradient_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child:  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.w,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                              CustomText("Just Play",color: ColorConstant.whiteColor,fw: FontWeight.w700,size: 20,),

                          Row(
                            children: [
                              Container(
                                height: 40.h,
                                width: 40.w,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(48.r),
                                    color: Colors.white38
                                ),
                                child: Center(child: Icon(Icons.search,color: ColorConstant.whiteColor,),),
                              ),
                              SizedBox(width: 8.w,),
                              Container(
                                height: 40.h,
                                width: 40.w,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(48.r),
                                    color: Colors.white38
                                ),
                                child: Center(child: Icon(Icons.menu,color: ColorConstant.whiteColor,),),
                              ),
                            ],

                          ),
                        ],
                      ),
            SizedBox(height: 25.h,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for(int i=0;i<10;i++)
                            Padding(
                              padding: EdgeInsets.only(right: 15.w),
                              child: Row(children: [
                                Column(
                              children: [
                                ReuseableGradientContainer(
                                  height: 69.h,
                                  width: 71.w,
                                  borderRadius: 31.r,
                                  gradientColor: ColorConstant.profilePicGradient,
                                  padding: 2.r,
                                  image: ImageConstants.profileImagesList[3],
                                  color: ColorConstant.purple,
                                  internalPadding: 5.r,
                                  onTap: (){

                                  },
                                ),
                                SizedBox(height: 20.h,),
                                CustomText("Player Name",fw: FontWeight.w700,size: 11.sp,color: ColorConstant.whiteColor,)
                              ],
                                ),
                              ],),
                            ),
                          ],

                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [


                            ],
                          ),
                        ),
                      ),
                    ]
                ),
              ),
            ),

          ],

        ),
      ),
    );
  }
}


