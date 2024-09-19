import 'package:e_squadifi/controllers/profile_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/color_constants.dart';
import '../../constants/image_constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override

  ProfileController profileController=Get.put(ProfileController());
  void initState() {
    // TODO: implement initState
    super.initState();
    // Set the orientation to landscape mode only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        return true;
      },
      child: GetBuilder<ProfileController>(
        builder: (profileController){
          return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                foregroundColor: ColorConstant.whiteColor,
                leading: Padding(
                    padding: EdgeInsets.only(left: 40.w,top: 15.h),
                    child: Icon(Icons.home,size: 32.sp,)),
              ),
              body: Container(
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
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: ColorConstant.gradientScreenColor,

                      begin: FractionalOffset(1.0, 1.0),
                      end: FractionalOffset(-0.2, 0.1),
                      // begin: Alignment.topLeft, // Start the gradient at top-left
                      // end: Alignment.bottomRight, // End the gradient at bottom-right
                      stops: [0.0, 0.2, 0.5, 0.8, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(50.r),
                    // border: Border.all(width: 10,color: Colors.purple)
                  ),
                  child: Row(children: [
                    Stack(
                      children: [
                          // Match the outer container's radius
                           Container(
                            width: 384.w,
                            height: 430.h,
                            decoration: BoxDecoration(
                            ),
                            child:
                            ClipRRect(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.r),
                                  topLeft: Radius.circular(50.r)
                              ),
                           child: Image.asset(
                              ImageConstants.profileImagesList[profileController.selectedIndex], // Replace with your image path
                              fit: BoxFit.cover,
                            ),

                          ),),


                        Positioned(
                          bottom: 10, // Position the Row at the bottom
                          left: 0,   // Align it to the left
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for(int i=0;i<ImageConstants.profileImagesList.length;i++)
                                CustomImageContainer(
                                  height: 30.h,
                                  width: 54.w,
                                  borderRadius: 14.r,
                                  borderColor:ColorConstant.whiteColor,
                                  borderWidth: 1.w,
                                  image: ImageConstants.profileImagesList[i],
                                  onTap: (){
                                   profileController.changeProfile(i);
                                  },
                                  index: i,
                                ),
                            ],),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    Container(
                      height: 397.h,
                      width: 344.w,
                      margin: EdgeInsets.symmetric(vertical: 6.h),
                      decoration: BoxDecoration(
                          color: ColorConstant.greyColor,
                          borderRadius: BorderRadius.circular(14.r),
                          border: Border.all(width: 1,color: ColorConstant.borderColor)
                      ),
                    )
                  ],),
                ),
              ));
        },

      ),
    );
  }
}
