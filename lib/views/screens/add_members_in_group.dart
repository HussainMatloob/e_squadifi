import 'package:e_squadifi/controllers/community_controller.dart';
import 'package:e_squadifi/models/group_model.dart';
import 'package:e_squadifi/models/user_model.dart';
import 'package:e_squadifi/utils/flush_messages.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paginate_firestore_plus/paginate_firestore.dart';
import '../../constants/color_constants.dart';
import '../../constants/image_constants.dart';
import '../../services/firebase_services.dart';
import '../custom_widgets/custom_text.dart';
import '../custom_widgets/reuseable_gradient_container.dart';

class AddMembersInGroup extends StatelessWidget {
  CommunityController communityController=Get.put(CommunityController());
  final GroupModel? groupModel;
  AddMembersInGroup({super.key, this.groupModel});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommunityController>(
      builder: (communityController){
        return  Scaffold(
          body: Container(
              height: Get.height,
              width: Get.width,
              padding: EdgeInsets.all(8.r),
              // Border width
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: ColorConstant.gradientBorderColor,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: Container(
                    padding: EdgeInsets.all(20.r),
                    height: Get.height,
                    width: Get.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: ColorConstant.primaryGradiantColor,
                        begin: FractionalOffset(1.0, 1.0),
                        end: FractionalOffset(-0.2, 0.1),
                        stops: [0.0, 0.3, 0.5, 0.8, 2.0],
                      ),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child:  Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            ButtonWidget(
                              onTap: (){
                               if(communityController.selectedUsers!=[]){
                                 FlushMessagesUtil.easyLoading();
                                   FirebaseServices.addUsersInGroup(
                                     communityController.selectedUsers,groupModel!
                                   ).then((value){
                                     EasyLoading.dismiss();
                                   });
                               }
                              },
                              paddingHorizontal: 20.w,
                              radius: 50.r,height: 30.h,
                              color: ColorConstant.cyanBlue,
                              text: "Add",textColor: ColorConstant.whiteColor,)
                          ],),
                        SizedBox(height: 15.h,),
                        Expanded(
                          child:

                          PaginateFirestore(itemBuilder: (context,documentSnapshot,index){
                            UserModel userModel=UserModel.fromJson(documentSnapshot[index].data() as Map<String,dynamic>);

                            return Padding(
                              padding:EdgeInsets.only(bottom: 10.h),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ReuseableGradientContainer(
                                        height: 50.h,
                                        width: 50.w,
                                        borderRadius: 50.r,
                                        gradientColor: ColorConstant
                                            .profilePicGradient,
                                        padding: 2.r,
                                        image: ImageConstants
                                            .profileImagesList[1],
                                        color: ColorConstant
                                            .deepPurpleColor,
                                        internalPadding: 5.r,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      CustomText(
                                        userModel.name,
                                        color: ColorConstant.whiteColor,
                                        fw: FontWeight.w400,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                  CheckboxTheme(
                                    data: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(4.r), // Optional, to make the border rounded
                                        side: BorderSide(
                                          color: Color(0x261B0D38), // #1B0D38 with 15% opacity
                                          width: 1.5.w, // Border width
                                        ),
                                      ),
                                      fillColor: MaterialStateProperty
                                          .resolveWith((states) {
                                        if (states.contains(
                                            MaterialState.selected)) {
                                          return ColorConstant
                                              .purpleLightColor; // Tick color when selected
                                        }
                                        return Colors
                                            .transparent; // Background color when unchecked
                                      }),
                                      checkColor: MaterialStateProperty
                                          .all(ColorConstant
                                          .blackColor), // Tick color
                                    ),
                                    child: Checkbox(
                                      //value:false,
                                      value: (communityController.selectedUsers??[]).contains(userModel.userId)?true:false,
                                      onChanged: (value) {
                                        communityController.inviteUserCheck(userModel.userId!);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                            query: FirebaseServices.getUsers(),
                            itemBuilderType: PaginateBuilderType.listView,
                            isLive: true,
                            scrollDirection: Axis.vertical,
                            physics: BouncingScrollPhysics(),
                            onEmpty: Center(
                              child: CustomText(
                                "Say Hii 👋!",
                                size: 20.sp,
                                color: ColorConstant.whiteColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              )),
        );
      },
    );
  }
}
