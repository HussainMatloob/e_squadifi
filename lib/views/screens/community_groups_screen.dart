import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/controllers/live_streaming_controller.dart';
import 'package:e_squadifi/models/group_model.dart';
import 'package:e_squadifi/services/firebase_services.dart';
import 'package:e_squadifi/views/custom_widgets/custom_list_tile.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/reuseable_gradient_container.dart';
import 'package:e_squadifi/views/screens/messages_screen.dart';
import 'package:e_squadifi/views/screens/share_community_Link_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paginate_firestore_plus/paginate_firestore.dart';

import '../custom_widgets/custom_dialog_box.dart';

class CommunityGroupsScreen extends StatefulWidget {
  const CommunityGroupsScreen({super.key});

  @override
  State<CommunityGroupsScreen> createState() => _CommunityGroupsScreenState();
}

class _CommunityGroupsScreenState extends State<CommunityGroupsScreen> {
  @override
  LiveStreamingController liveStreamingController = Get.put(LiveStreamingController());
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
              padding: EdgeInsets.all(20.r),
              child:  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.w,),
                      FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ReuseableGradientContainer(
                                  height: 62.h,
                                  width: 63.w,
                                  borderRadius: 28.r,
                                  gradientColor: ColorConstant.profilePicGradient,
                                  padding: 2.r,
                                  image: ImageConstants.profileImagesList[3],
                                  color: ColorConstant.purple,
                                  internalPadding: 5.r,
                                ),
                                SizedBox(width: 15.w,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText("Community Name",fw: FontWeight.w700,size: 18.sp,color: ColorConstant.whiteColor,),
                                    CustomText("Community Group",fw: FontWeight.w400,size: 14.sp,color: ColorConstant.whiteColor,)
                                  ],),

                              ],),
                            SizedBox(width: 15.w,),
                            Icon(Icons.more_vert,color: ColorConstant.whiteColor,)
                          ],
                        ),
                      ),

                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(children: [
                            SizedBox(height: 50.w,),
                            Container(
                              padding: EdgeInsets.all(20.r),
                              width: 310.w,
                              height: 144.h,
                              decoration: BoxDecoration(
                                color: ColorConstant.greyLightColor,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomListTile(
                                    text: "Invite members",
                                    color: ColorConstant.whiteColor,
                                    icon: Icon(
                                      Icons.person_add_alt,
                                      color: ColorConstant.whiteColor,
                                      size: 20,
                                    ),
                                    fw: FontWeight.w500,
                                    textSize: 16.sp,
                                    fontStyle: FontStyle.italic,
                                    sizedBoxedWidth: 12.w,
                                    width: 32.w,
                                    height: 32.h,
                                    containerColor: ColorConstant.dullPurpleColor,
                                    borderRadius: 8.r,
                                    onTap: (){
                                      Get.to(()=>ShareLinkScreen());
                                    },
                                  ),
                                  Divider(color: ColorConstant.greyColor,),
                                  CustomListTile(
                                    text: "Message groups",
                                    color: ColorConstant.whiteColor,
                                    icon: Icon(
                                      Icons.group_outlined,
                                      color: ColorConstant.whiteColor,
                                      size: 20,
                                    ),
                                    fw: FontWeight.w500,
                                    textSize: 16.sp,
                                    fontStyle: FontStyle.italic,
                                    sizedBoxedWidth: 12.w,
                                    width: 32.w,
                                    height: 32.h,
                                    containerColor: ColorConstant.dullPurpleColor,
                                    borderRadius: 8.r,
                                    onTap: (){},
                                  ),
                                ],),
                            ),

                            SizedBox(height: 30.w,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomText("Your Groups",fw: FontWeight.w700,size: 24.sp,color: ColorConstant.whiteColor,),
                                ],),
                            ),
                            SizedBox(height: 20.w,),
                            /* -------------------------------------------------------------------------- */
                            /*                            Fetch Community Groups                          */
                            /* -------------------------------------------------------------------------- */
                            Container(
                              padding: EdgeInsets.all(20.r),
                              width: 310.w,
                              decoration: BoxDecoration(
                                color: ColorConstant.greyLightColor,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: PaginateFirestore(itemBuilder: (context,documentSnapshot,index)
                                  {

                                    GroupModel groupModel = GroupModel.fromJson(
                                        documentSnapshot[index].data()
                                        as Map<String, dynamic>);

                                    return Column(children: [
                                      index==0?Container():SizedBox(height: 10.w,),
                                      index==0? Container():Divider(color: ColorConstant.greyColor,),
                                      index==0?Container():SizedBox(height: 10.w,),
                                      CustomListTile(
                                            text: groupModel.groupName,
                                            color: ColorConstant.whiteColor,
                                            image: ImageConstants.profileImagesList[3],
                                            fw: FontWeight.w500,
                                            textSize: 16.sp,
                                            fontStyle: FontStyle.italic,
                                            sizedBoxedWidth: 12.w,
                                            width: 32.w,
                                            height: 32.h,
                                            containerColor: ColorConstant.dullPurpleColor,
                                            borderRadius: 8.r,
                                            onTap: (){
                                              Get.to(()=>MessagesScreen(groupModel: groupModel));
                                            },
                                          ),
                                    ],);
                                  },
                                  query:FirebaseServices.getYourGroups(),
                                  itemBuilderType:PaginateBuilderType.listView,
                                  isLive: true,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                              )

                            ),
                            // SizedBox(height: 30.w,),
                            // Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: 15.w),
                            //   child: Row(mainAxisAlignment: MainAxisAlignment.start,
                            //     children: [
                            //       CustomText("Your Groups",fw: FontWeight.w700,size: 24.sp,color: ColorConstant.whiteColor,),
                            //     ],),
                            // ),
                            SizedBox(height: 20.w,),
                            Container(
                              padding: EdgeInsets.all(20.r),
                              width: 310.w,
                              height: 69.h,
                              decoration: BoxDecoration(
                                color: ColorConstant.greyLightColor,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child:CustomListTile(
                                text: " Add group",
                                color: ColorConstant.whiteColor,
                                icon: Icon(
                                  Icons.person_add_alt,
                                  color: ColorConstant.whiteColor,
                                  size: 20.sp,
                                ),
                                fw: FontWeight.w500,
                                textSize: 16.sp,
                                fontStyle: FontStyle.italic,
                                sizedBoxedWidth: 12.w,
                                width: 32.w,
                                height: 32.h,
                                containerColor: ColorConstant.purpleLightColor,
                                borderRadius: 8.r,
                                onTap: (){
                                  CustomDialogBox().showDialogBox(context,false,400,200);
                                },
                              ),
                            ),
                            SizedBox(height: 20.w,),
                            Container(
                              padding: EdgeInsets.all(20.r),
                              width: 310.w,
                              height: 144.h,
                              decoration: BoxDecoration(
                                color: ColorConstant.greyLightColor,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomListTile(
                                    text: "Exite community",
                                    color: ColorConstant.whiteColor,
                                    icon: Icon(
                                      Icons.logout,
                                      color: ColorConstant.redColor,
                                      size: 20,
                                    ),
                                    fw: FontWeight.w500,
                                    textSize: 16.sp,
                                    fontStyle: FontStyle.italic,
                                    sizedBoxedWidth: 12.w,
                                    width: 32.w,
                                    height: 32.h,
                                    containerColor: ColorConstant.dullPurpleColor,
                                    borderRadius: 8.r,
                                    onTap: (){},
                                  ),
                                  Divider(color: ColorConstant.greyColor,),
                                  CustomListTile(
                                    text: "Deactivate Community",
                                    color: ColorConstant.whiteColor,
                                    icon: Icon(
                                      Icons.cancel_presentation_outlined,
                                      color: ColorConstant.redColor,
                                      size: 20,
                                    ),
                                    fw: FontWeight.w500,
                                    textSize: 16.sp,
                                    fontStyle: FontStyle.italic,
                                    sizedBoxedWidth: 12.w,
                                    width: 32.w,
                                    height: 32.h,
                                    containerColor: ColorConstant.dullPurpleColor,
                                    borderRadius: 8.r,
                                    onTap: (){},
                                  ),
                                ],),
                            ),
                            SizedBox(height: 90.w,),
                          ],),
                        ),
                      )
                    ]
                ),


          ),

    );
  }
}
