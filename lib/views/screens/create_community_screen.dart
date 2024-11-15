import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/constants/image_constants.dart';
import 'package:e_squadifi/controllers/community_controller.dart';
import 'package:e_squadifi/services/firebase_services.dart';
import 'package:e_squadifi/utils/flush_messages.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text_form_field.dart';
import 'package:e_squadifi/views/custom_widgets/reuseable_gradient_container.dart';
import 'package:e_squadifi/views/screens/create_community_group_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class CreateCommunityScreen extends StatefulWidget {
  const CreateCommunityScreen({super.key});
  @override
  State<CreateCommunityScreen> createState() => _CreateCommunityScreenState();
}
class _CreateCommunityScreenState extends State<CreateCommunityScreen> {
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  TextEditingController nameController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  CommunityController communityController=Get.put(CommunityController());
  @override
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
       child: GetBuilder<CommunityController>(
         builder: (communityController){
           return Scaffold(
             body:
             Form(
               key: formKey,
               child: Container(
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
                       colors:ColorConstant.primaryGradiantColor,

                       begin: FractionalOffset(1.0,1.0),
                       end: FractionalOffset(-0.2,0.1),
                       // begin: Alignment.topLeft, // Start the gradient at top-left
                       // end: Alignment.bottomRight, // End the gradient at bottom-right
                       stops: [0.0, 0.2, 0.5, 0.8, 1.0],
                     ),
                     borderRadius: BorderRadius.circular(50.r),
                     // border: Border.all(width: 10,color: Colors.purple)
                   ),
                   child: Container(
                     padding: EdgeInsets.all(20.r),
                     child: SingleChildScrollView(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           SizedBox(
                             height: 50.h,
                           ),
                           CustomText(
                             "Start A",
                             fw: FontWeight.w700,
                             size: 32.sp,
                             color: ColorConstant.whiteColor,
                           ),
                           CustomText(
                             "Community",
                             fw: FontWeight.w700,
                             size: 32.sp,
                             color: ColorConstant.whiteColor,
                           ),
                           SizedBox(height: 50.h,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               ReuseableGradientContainer(
                                 height: 134.h,
                                 width: 137.w,
                                 borderRadius: 60.r,
                                 gradientColor: ColorConstant.profilePicGradient,
                                 padding: 4.r,
                                 image: ImageConstants.profileImagesList[3],
                                 color: ColorConstant.deepPurpleColor,
                                 internalPadding: 10.r,
                               ),
                             ],
                           ),
                           SizedBox(height: 50.h,),
                           CustomText("Community Name",fw: FontWeight.w700,size: 16.sp,color: ColorConstant.whiteColor,),
                           SizedBox(height: 8.h,),
                           CustomTextFormField(
                             horizontalPadding: 15.w,
                             controller: nameController,
                             //color: ColorConstant.greyColor,
                             hintText: "Game",
                             message: "Please enter community name",
                             validateFunction: communityController.communityNameValidate,
                           ),
                           SizedBox(height: 25.h,),
                           CustomText("Community Description",fw: FontWeight.w700,size: 16.sp,color: ColorConstant.whiteColor,),
                           SizedBox(height: 8.h,),
                           CustomTextFormField(
                             horizontalPadding: 15.w,
                             width: 312.w,
                             height: 137.h,
                             controller: descriptionController,
                             color: ColorConstant.greyColor,
                             hintText: "Mr:",
                             isMultiline: true,
                           ),
                           SizedBox(
                             height: 30.h,
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               ButtonWidget(
                                 text: "Next",
                                 paddingHorizontal: 70.w,
                                 height: 51.h,
                                 color: ColorConstant.cyanBlue,
                                 radius: 47.r,
                                 textColor: ColorConstant.whiteColor,
                                 fw: FontWeight.w700,
                                 textSize: 14.sp,
                                 onTap: (){
                                   if(formKey.currentState!.validate()){
                                     FirebaseServices.createCommunity(nameController.text.toString(),descriptionController.text.toString(),context).then((onValue){
                                       FlushMessagesUtil.snackBarMessage("Success", "Community created successfully", context);
                                       Get.to(()=>CreateCommunityGroupScreen());
                                       SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
                                     });
                                   }
                                 },
                               ),
                             ],
                           ),
                           SizedBox(
                             height: 20.h,
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),),
             ),
           );
         },
       ),
     ),
   );
  }
}
