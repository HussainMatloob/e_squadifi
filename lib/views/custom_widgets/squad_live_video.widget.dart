import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/controllers/squad_pod_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_image_container.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


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

  String videoUrl = "https://drive.google.com/uc?export=view&id=1uQYXnnrwlsQTk9u9sAB4dP9L4VFGuUFX";
  void initState() {
    super.initState();
      squadPodController.generateThumbnail(videoUrl);
  }

  Widget build(BuildContext context) {
    return GetBuilder<SquadPodController>(
    builder: (squadPodController){
      return Container(
        height: widget.height,
        width: widget.width,

        decoration: BoxDecoration(
            color: Colors.blue,
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
                      CustomImageContainer(image:ImageConstants.profileImagesList[2],
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
            Row(children: [
              CustomImageContainer(image: ImageConstants.profileImagesList[2],
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
            ],)
            ],),
          ),

        ],),
      );
    },

    );
  }
}
