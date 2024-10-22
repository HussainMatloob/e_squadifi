import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/pod_container_widget.dart';
import 'package:e_squadifi/views/custom_widgets/squad_live_video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SquadPodScreen extends StatefulWidget {
  const SquadPodScreen({super.key});

  @override
  State<SquadPodScreen> createState() => _SquadPodScreenState();
}

class _SquadPodScreenState extends State<SquadPodScreen> {
  @override
  String videoUrl = "https://drive.google.com/uc?export=view&id=1uQYXnnrwlsQTk9u9sAB4dP9L4VFGuUFX";
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.w,),
              FittedBox(
                child: Container(
                  width: Get.width,
                  padding: EdgeInsets.all(20.r),
                  child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                             CustomText("Squad POD",fw: FontWeight.w700,size: 20.sp,color: ColorConstant.whiteColor,),

                          ],),
                      Row(children: [
                           ButtonWidget(
                             height: 38.h,
                             width: 115.w,
                             text: "Create",
                             textSize: 16.sp,
                             fw: FontWeight.w600,
                             textColor: ColorConstant.whiteColor,
                             color: ColorConstant.squadPurpleColor,
                             icon: Icon(Icons.surround_sound,color: ColorConstant.whiteColor,),
                             radius: 100.r,
                             onTap: (){

                             },
                           ),
                           SizedBox(width: 10.w,),
                           Container(
                               height: 40.h,
                               width: 40.w,
                               decoration: BoxDecoration(borderRadius: BorderRadius.circular(48.r),
                                   color: Colors.white38
                               ),
                               child: Center(child: Icon(Icons.group_outlined,color: ColorConstant.whiteColor,),),
                             ),
                         ],),
                      ],
                    ),
                ),
              ),
              SizedBox(height: 10.h,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Row(children: [
                    PodContainer(
                      videoUrl: videoUrl,
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
                      videoUrl: videoUrl,
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
                child:Container(
                  padding: EdgeInsets.only(left:20.w,right: 20.w,bottom: 20.w),
                  child: GridView.builder(
                      // shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.zero,
                      // physics: NeverScrollableScrollPhysics(parent: BouncingScrollPhysics()),  // Disable GridView's internal scrolling
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                          mainAxisSpacing: 10.w,
                          childAspectRatio: 1.64.r,
                          //mainAxisExtent: 130,
                          crossAxisSpacing: 12.w
                      ),
                      itemCount: 8,
                      itemBuilder: (context, index) {
                              //padding: EdgeInsets.only(left:20.w,right: 20.w,bottom: 20.w),
                          return
                             SquadLiveVideoWidget(
                             height: 111.h,
                             width: 158.w,
                             videoName: "Diamond Rank!!!",
                             ownerName: "Dr.Munder",
                             views: "3k2",
                               videoUrl: videoUrl,
                           );
                      },
                    ),
                ),

              ),
              SizedBox(height: 80.h,)
            ]
        ),

    );
  }
}
