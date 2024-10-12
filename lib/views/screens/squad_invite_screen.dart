import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/controllers/squad_pod_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_image_container.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/reuseable_gradient_container.dart';
import 'package:e_squadifi/views/screens/create_squad_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SquadInviteScreen extends StatefulWidget {
  const SquadInviteScreen({super.key});

  @override
  State<SquadInviteScreen> createState() => _SquadInviteScreenState();
}

class _SquadInviteScreenState extends State<SquadInviteScreen> {
  SquadPodController squadPodController=Get.put(SquadPodController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SquadPodController>(
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
              child:Column(
                children: [
                  Expanded(
                    child: Container(
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
                                    SizedBox(width: 8.w,),
                                    CustomText("Invite People",color: ColorConstant.whiteColor,fw: FontWeight.w700,size: 20,),
                                  ],
                                ),
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
                            SizedBox(height: 15.h,),
                            CustomText("3 of 1550 selected",color: ColorConstant.whiteColor,fw: FontWeight.w400,size: 16,),
                            SizedBox(height: 12.h,),
                            SingleChildScrollView(
                              child: Row(children: [
                                for(int i =0;i<ImageConstants.profileImagesList.length;i++)
                                  Row(
                                    children: [
                                      Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          CustomImageContainer(
                                            image: ImageConstants.profileImagesList[1],
                                            height: 49.h,
                                            width: 49.w,
                                            borderRadius: 100.r,
                                          ),
                                          InkWell(
                                            onTap: (){

                                            },
                                            child: Container(
                                              height: 12.h,
                                              width: 12.w,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.r),
                                                  color: ColorConstant.redColor
                                              ),
                                              child: Center(child: Icon(Icons.close,color: ColorConstant.blackColor,size: 10.sp,),),
                                            ),
                                          ),
                                        ],),
                                      SizedBox(width: 10.w,)
                                    ],

                                  ),
                              ],),
                            ),
                            SizedBox(height: 16.h,),
                            Divider(color: ColorConstant.greyColor,),
                            SizedBox(height: 16.h,),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for(int i=0;i<20;i++)
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(children: [
                                            ReuseableGradientContainer(
                                              height: 50.h,
                                              width: 50.w,
                                              borderRadius: 50.r,
                                              gradientColor: ColorConstant.profilePicGradient,
                                              padding: 2.r,
                                              image: ImageConstants.profileImagesList[1],
                                              color: ColorConstant.deepPurpleColor,
                                              internalPadding: 5.r,
                                            ),
                                            SizedBox(width: 10.w,),
                                            CustomText("Player Name",color: ColorConstant.whiteColor,fw: FontWeight.w400,size: 16,),

                                          ],),
                                          CheckboxTheme(
                                            data: CheckboxThemeData(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(4.r), // Optional, to make the border rounded
                                                side: BorderSide(
                                                  color: Color(0x261B0D38), // #1B0D38 with 15% opacity
                                                  width: 1.5.w,               // Border width
                                                ),
                                              ),
                                              fillColor: MaterialStateProperty.resolveWith((states) {
                                                if (states.contains(MaterialState.selected)) {
                                                  return ColorConstant.purpleLightColor; // Tick color when selected
                                                }
                                                return Colors.transparent; // Background color when unchecked
                                              }),
                                              checkColor: MaterialStateProperty.all(ColorConstant.blackColor), // Tick color
                                            ),
                                            child: Checkbox(
                                              value:  squadPodController.isCheck,
                                              onChanged: (value) {
                                                squadPodController.inviteCheck(value!);

                                              },
                                            ),
                                          )
                                        ],

                                      ),

                                  ],
                                ),
                              ),
                            ),
                          ]
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(25.r),
                    height: 96,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: ColorConstant.deepPurpleColor,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(15.r),topLeft: Radius.circular(15.r),
                            bottomRight: Radius.circular(50.r),bottomLeft: Radius.circular(50.r)
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      ButtonWidget(
                        paddingHorizontal: 15.w,
                        height: 39.h,
                        text: "Migdh_3hjhdjkkla_y8778",
                        textSize: 13.sp,
                        fw: FontWeight.w400,
                        textColor: ColorConstant.whiteColor,
                        color: ColorConstant.greyLightColor,
                        radius: 12.r,
                        onTap: (){

                        },
                      ),
                      SizedBox(width: 5.w,),
                      ButtonWidget(
                        paddingHorizontal: 15.w,
                        height: 38.h,

                        text: "send Link",
                        textSize: 13.sp,
                        fw: FontWeight.w400,
                        textColor: ColorConstant.whiteColor,
                        color: ColorConstant.cyanBlue,
                        radius: 100.r,
                        onTap: (){
                          Get.to(( )=> CreateSquadScreen());
                        },
                      ),
                    ],),
                  )
                ],

              ),
            ),),
        );
      },

    );
  }
}
