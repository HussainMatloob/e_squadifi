import 'dart:math';
import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/controllers/squad_pod_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_image_container.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text_form_field.dart';
import 'package:e_squadifi/views/custom_widgets/play_video_widget.dart';
import 'package:e_squadifi/views/screens/squad_friends_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class SquadPodVideoScreen extends StatefulWidget {
  final String? videoUrl;
  const SquadPodVideoScreen({super.key,this.videoUrl});

  @override
  State<SquadPodVideoScreen> createState() => _SquadPodVideoScreenState();
}

class _SquadPodVideoScreenState extends State<SquadPodVideoScreen>  with SingleTickerProviderStateMixin{
  @override
  SquadPodController squadPodController=Get.put(SquadPodController());
   TextEditingController podController=TextEditingController();
  final double radius = 110.0.r;
  final List<String> podImages = ImageConstants.podImagesList;
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
        child: GetBuilder<SquadPodController>(
          builder: (squadPodController){
            return Scaffold(
              extendBodyBehindAppBar: true,
              body:  Container(
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
                child:  Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors:ColorConstant.primaryGradiantColors,
                      begin: FractionalOffset(1.0,1.0),
                      end: FractionalOffset(-0.2,0.1),
                      // begin: Alignment.topLeft, // Start the gradient at top-left
                      // end: Alignment.bottomRight, // End the gradient at bottom-right
                      stops: [0.0, 0.2, 0.5, 0.8, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(50.r),
                    // border: Border.all(width: 10,color: Colors.purple)
                  ),
                  child:Container(
                    padding: EdgeInsets.all(20.r),
                    child:  Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.w,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Get.back();
                                      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
                                    },
                                    child: Container(
                                      height: 40.h,
                                      width: 40.w,
                                      decoration: BoxDecoration(
                                        color: Colors.white38,
                                        borderRadius: BorderRadius.circular(100.r),
                                      ),
                                      child: Center(child: Icon(CupertinoIcons.back,color: ColorConstant.whiteColor,),),
                                    ),
                                  ),
                                  SizedBox(width: 15.w,),
                                  CustomText("squad pod",fw: FontWeight.w700,size: 18.sp,color: ColorConstant.whiteColor,),
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
                                radius: 100.r,
                                onTap: (){
                                  Get.to(( )=> SquadFriendsScreen());
                                },
                              ),
                            ],
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(children: [
                                SizedBox(height: 40.h,),

                                Center(
                                  child: SizedBox(
                                    width: radius * 2.r,
                                    height: radius * 2.r,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: List.generate(podImages.length, (index) {
                                        final angle = (2 * pi / podImages.length) * index;
                                        final x = radius * cos(angle);
                                        final y = radius * sin(angle);

                                        // Creating each widget in circular arrangement
                                        return Transform.translate(
                                          offset: Offset(x, y),
                                          child: GestureDetector(
                                            onTap: () {
                                                squadPodController.circularImages(index);  // Set selected widget index
                                            },
                                            child: AnimatedContainer(
                                                duration: Duration(milliseconds: 300),
                                                width: squadPodController.circularImageIndex== index ? 100.w : 66.0.w, // Larger size if selected
                                                height:  squadPodController.circularImageIndex == index ? 100.0.h : 66.0.h,
                                                decoration: BoxDecoration(
                                                  borderRadius: squadPodController.circularImageIndex == index? BorderRadius.circular(42.r):BorderRadius.circular(100.r),

                                                  //shape: BoxShape.circle,
                                                ),
                                                child: CustomImageContainer(
                                                  width: squadPodController.circularImageIndex== index ? 114.w : 66.0.w, // Larger size if selected
                                                  height:  squadPodController.circularImageIndex== index ? 115.0.h : 66.0.h,
                                                  borderRadius:  squadPodController.circularImageIndex == index?42.r :100.r,
                                                  image: ImageConstants.podImagesList[index],
                                                )
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 70.h,),
                           PlayVideoWidget(
                             width: 290.w,
                             height: 175.h,
                             videoUrl: widget.videoUrl,
                             borderRadius: 20.r,
                           ),
                              ],),
                            ),
                          ),
                          Divider(color: ColorConstant.greyColor,),
                          SizedBox(height: 10.h,),
                          Container(
                            width: 327.w,
                            height:55.h,
                            decoration: BoxDecoration(color: ColorConstant.greyColor,
                                borderRadius: BorderRadius.circular(16.r)
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(children: [
                                Icon(Icons.emoji_emotions_outlined,color: ColorConstant.whiteColor,),
                                Expanded(child: CustomTextFormField(
                                  controller: podController,
                                  hintText: "Send a message...",)),
                                GestureDetector(
                                    onTap: (){

                                    },
                                    child: Icon(Icons.send,color: ColorConstant.whiteColor,)),
                              ],),
                            ),
                          ),
                        ]
                    ),
                  ),
                ),),
            );
          },

        ),
      ),
    );
  }
}
