import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/controllers/squad_pod_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_image_container.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/screens/squad_pod_video_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controllers/live_streaming_controller.dart';
class SquadLiveVideoWidget extends StatefulWidget {
  final String? videoUrl;
  final double? height;
  final double? width;
  final String? videoName;
  final String? ownerName;
  final String? views;
  const SquadLiveVideoWidget({super.key,this.videoUrl,
  this.height,this.width,this.videoName,this.ownerName,this.views
  });
  @override
  State<SquadLiveVideoWidget> createState() => _SquadLiveVideoWidgetState();
}
class _SquadLiveVideoWidgetState extends State<SquadLiveVideoWidget> {
  @override
  SquadPodController squadPodController=Get.put(SquadPodController());

  void initState() {
    super.initState();
      squadPodController.generateThumbnail(widget.videoUrl);
  }
  Widget build(BuildContext context) {
    return GetBuilder<SquadPodController>(
    builder: (squadPodController){
      return GestureDetector(
        onTap: (){
          Get.to(()=>SquadPodVideoScreen(videoUrl:widget.videoUrl,));
        },
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r)),
          child: Stack(children: [
            Container(
              height: widget.height,
              width: widget.width,
              child: Center(
                child: squadPodController.thumbnailData != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: Image.memory(
                    squadPodController.thumbnailData!,
                    fit: BoxFit.fill,
                    height: widget.height,
                    width: widget.width,
                  ),
                )
                    : Center(child: CircularProgressIndicator(color: ColorConstant.whiteColor,),)  // Show a loader while generating
              ),
            ),
            Container(
              height: widget.height,
              width: widget.width,
              padding: EdgeInsets.all(8.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                FittedBox(
                  child: Row(children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      height: 16.h,
                      //width: 27.w,
                      decoration: BoxDecoration(
                          color: ColorConstant.redColor,
                        borderRadius: BorderRadius.circular(3.r)
                      ),
                      child: Center(child: CustomText("Live",fw: FontWeight.w600,size: 8.sp,color: ColorConstant.whiteColor,)),
                    ),
                            SizedBox(width: 5.w,),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              height: 16.h,
                              decoration: BoxDecoration(
                    color: ColorConstant.darkGrayColor,
                    borderRadius: BorderRadius.circular(3.r)
                              ),
                              child: Row(children: [
                  Icon(Icons.remove_red_eye,color:ColorConstant.whiteColor,size: 10,),
                  SizedBox(width: 3.w,),
                  CustomText(widget.views,fw: FontWeight.w600,size: 8.sp,color: ColorConstant.whiteColor,),
                              ]),
                            ),
                    SizedBox(width: 5.w,),
                    Container(
                      height: 16.h,
                      decoration: BoxDecoration(
                          color: ColorConstant.darkGrayColor,
                          borderRadius: BorderRadius.circular(3.r)
                      ),
                      child: Row(children: [
                        CustomImageContainer(image:ImageConstants.pubGImage,
                          height: 14.h,
                          width: 14.w,
                          borderRadius: 2.r,
                        ),
                        SizedBox(width: 3.w,),
                        CustomText("PUBG Mobile",fw: FontWeight.w600,size: 8.sp,color: ColorConstant.whiteColor,),
                      ]),
                    ),
                  ],),
                ),
              FittedBox(
                child: Row(children: [
                  CustomImageContainer(image: ImageConstants.pubGImage,
                  height: 23.h,
                    width: 23.w,
                    borderRadius: 100.r,
                  ),
                   SizedBox(width: 5.w,),
                   Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                     CustomText(widget.videoName,fw: FontWeight.w600,size: 12.sp,color: ColorConstant.whiteColor,),
                     CustomText(widget.ownerName,fw: FontWeight.w400,size: 10.sp,color: ColorConstant.whiteColor,),
                   ],)
                ],),
              )
              ],),
            ),
          ],),
        ),
      );
    },

    );
  }
}
