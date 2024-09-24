import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/pod_container_widget.dart';
import 'package:e_squadifi/views/custom_widgets/squad_live_video.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SquadPodScreen extends StatefulWidget {
  const SquadPodScreen({super.key});

  @override
  State<SquadPodScreen> createState() => _SquadPodScreenState();
}

class _SquadPodScreenState extends State<SquadPodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.w,),
              Container(
                padding: EdgeInsets.all(20.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                         CustomText("Squad POD",fw: FontWeight.w700,size: 20.sp,color: ColorConstant.whiteColor,),
                        SizedBox(width: 15.w,),
                      ],),
                   ButtonWidget(
                     height: 38.h,
                     width: 115.w,
                     text: "Create",
                     textSize: 16.sp,
                     fw: FontWeight.w600,
                     textColor: ColorConstant.whiteColor,
                     color: ColorConstant.squadPurpleColor,
                     icon: Icon(Icons.surround_sound,color: ColorConstant.whiteColor,),
                     radius: 100,
                   ),
                   Container(
                     height: 40.h,
                     width: 40.w,
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(48.r),
                       color: Colors.white38
                     ),
                     child: Center(child: Icon(Icons.group_outlined,color: ColorConstant.whiteColor,),),
                   ),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Row(children: [
                    PodContainer(
                      width: 208.w,
                      height: 172.h,
                      color1: ColorConstant.squadPurpleColor,
                      title: "Private Pod",
                      subtitle: "@private.pod",
                       podFriends: "2.3k",
                       podViews: "6.9k",
                      color2: Colors.white24,
                    ),
                    SizedBox(width: 11.w,),
                    PodContainer(
                      width: 208.w,
                      height: 172.h,
                      color1: ColorConstant.cyanBlue,
                      title: "Public Pod",
                      subtitle: "@public.pod",
                       podFriends: "4.3k",
                       podViews: "8.9k",
                      color2: Colors.white24,
                    ),
                    SizedBox(width: 20.w,),
                  ],),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(20.r),
                  child: CustomText("Live Pods",size: 16.sp,fw: FontWeight.w700,color: ColorConstant.whiteColor,)),
              Flexible(
                child:GridView.builder(
                    // shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.zero,
                    // physics: NeverScrollableScrollPhysics(parent: BouncingScrollPhysics()),  // Disable GridView's internal scrolling
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        //childAspectRatio: 20,
                        mainAxisExtent: 130,
                        //crossAxisSpacing: 1
                    ),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                            //padding: EdgeInsets.only(left:20.w,right: 20.w,bottom: 20.w),
                        return Column(children: [
                           SquadLiveVideoWidget(
                           height: 111.h,
                           width: 158.w,
                           videoName: "Diamond Rank!!!",
                           ownerName: "Dr.Munder",
                           views: "3k2",
                         )
                         ],) ;
                    },
                  ),

              ),
              SizedBox(height: 100.h,)
            ]
        ),



    );
  }
}
