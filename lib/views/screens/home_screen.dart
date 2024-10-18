import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/home_people_widget.dart';
import 'package:e_squadifi/views/custom_widgets/latest_stream_widget.dart';
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
                              GestureDetector(
                               onTap: (){
                                 showModalBottomSheet(
                                   backgroundColor: ColorConstant.deepPurpleColor,
                                   context: context,
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.vertical(
                                       top: Radius.circular(25.0),
                                     ),
                                   ),
                                   builder: (BuildContext context) {
                                     // Wrapping the content inside a ClipRRect
                                     return ClipRRect(
                                       borderRadius: BorderRadius.vertical(
                                         top: Radius.circular(40.r),
                                       ),
                                       child: Container(
                                         height:  563.h, // Adjust height as per outer container
                                         width: 375.w,
                                         decoration: BoxDecoration(
                                           color:ColorConstant.deepPurpleColor,
                                           borderRadius: BorderRadius.vertical(
                                             top: Radius.circular(40.r),
                                           ),
                                         ),
                                       ),
                                     );
                                   },
                                 );
                               },
                                child: Container(
                                  height: 40.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(48.r),
                                      color: Colors.white38
                                  ),
                                  child: Center(child: Icon(Icons.search,color: ColorConstant.whiteColor,),),
                                ),
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
                                SizedBox(height: 10.h,),
                                CustomText("Player Name",fw: FontWeight.w700,size: 11.sp,color: ColorConstant.whiteColor,)
                              ],
                                ),
                              ],),
                            ),
                          ],

                        ),
                      ),
                      SizedBox(height: 20.h,),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(children: [
                                  for(int i=0;i<=10;i++)
                                    HomePeopleWidget(
                                      image: ImageConstants.profileImagesList[1],
                                      name: "Wade Warren",
                                    ),
                                ],),
                              ),
                              SizedBox(height: 20.h,),
                              CustomText("Latest Stream &",fw: FontWeight.w700,size: 18.sp,color: ColorConstant.whiteColor,),
                              CustomText("Podcasts",fw: FontWeight.w700,size: 18.sp,color: ColorConstant.whiteColor,),
                             SizedBox(height: 15.h,),
                              for(int i=0;i<=3;i++)
                              LatestStreamWidget(),
                              SizedBox(height: 100.h,),
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


