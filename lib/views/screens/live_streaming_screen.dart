import 'package:audioplayers/audioplayers.dart';
import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_dialog_box.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text_form_field.dart';
import 'package:e_squadifi/views/screens/connect_video_game_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../constants/image_constants.dart';
import '../../controllers/live_streaming_controller.dart';
import '../custom_widgets/comments_widget.dart';
import '../custom_widgets/custom_image_container.dart';
class LiveStreamingScreen extends StatefulWidget {
  final String? videoUrl;
  const LiveStreamingScreen({
    super.key,
    this.videoUrl,
  });
  @override
  State<LiveStreamingScreen> createState() => _PlayVideoWidgetState();
}

class _PlayVideoWidgetState extends State<LiveStreamingScreen> {
  late LiveStreamingController liveStreamingController;

  @override
  void initState() {
    super.initState();
    liveStreamingController = Get.put(LiveStreamingController());
    liveStreamingController.videoPlayerController(widget.videoUrl);
  }

  @override
  void dispose() {
    liveStreamingController.videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      },
      child: WillPopScope(
        onWillPop: () async {
          liveStreamingController.backAction();
          if (liveStreamingController.isShowingPlay.value == true) {
            liveStreamingController.showingPlay();
          }
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
          return true;
        },
        child: Obx(() {
          return Scaffold(
            backgroundColor: ColorConstant.blackColor,
            extendBodyBehindAppBar: true,
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: Container(
                  height: Get.height,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    gradient: LinearGradient(
                      colors: ColorConstant.primaryGradiantColor,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Stack(
                          children: [
                            liveStreamingController.isLandScape.value
                                ? SizedBox.expand(
                                    // Make video cover the whole screen
                                    child: FutureBuilder(
                                      future: liveStreamingController
                                          .initializeVideoPlayerFuture,
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          return GestureDetector(
                                              onTap: () {
                                                liveStreamingController
                                                    .showingPlay();
                                              },
                                              child: VideoPlayer(
                                                  liveStreamingController
                                                      .videoController));
                                        } else {
                                          return const Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  )
                                : FutureBuilder(
                                    future: liveStreamingController
                                        .initializeVideoPlayerFuture,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        // Get the aspect ratio of the video
                                        final aspectRatio =
                                            liveStreamingController
                                                .videoController
                                                .value
                                                .aspectRatio;

                                        return GestureDetector(
                                          onTap: () {
                                            liveStreamingController
                                                .showingPlay();
                                          },
                                          child: LayoutBuilder(
                                            builder: (context, constraints) {
                                              // Get the available width of the screen
                                              final screenWidth =
                                                  constraints.maxWidth;
                                              // Calculate height based on aspect ratio
                                              final videoHeight =
                                                  screenWidth / aspectRatio;

                                              return ClipRRect(
                                                child: SizedBox(
                                                  width:
                                                      screenWidth, // Full width of the screen
                                                  height:
                                                      videoHeight, // Calculated height based on aspect ratio
                                                  child: VideoPlayer(
                                                      liveStreamingController
                                                          .videoController),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      } else {
                                        return const Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                            // Controls at the bottom of the screen
                            Positioned(
                              child: liveStreamingController.isShowingPlay.value
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 20.w,
                                              right: 20.w,
                                              top: 10.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              liveStreamingController
                                                      .isLandScape.value
                                                  ? Expanded(
                                                      child: Row(
                                                        children: [
                                                          InkWell(
                                                            onTap: () {},
                                                            child: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color: ColorConstant
                                                                  .whiteColor,
                                                              size: 40.sp,
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Container(
                                                                child:
                                                                    CustomText(
                                                              "Aleyang VS Storysast | League of Legend",
                                                              size: 20.sp,
                                                              fw: FontWeight
                                                                  .w700,
                                                              color: ColorConstant
                                                                  .whiteColor,
                                                              textOverflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : Row(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            Get.back();
                                                            liveStreamingController
                                                                .backAction();
                                                            if (liveStreamingController
                                                                    .isShowingPlay
                                                                    .value ==
                                                                true) {
                                                              liveStreamingController
                                                                  .showingPlay();
                                                            }
                                                            SystemChrome
                                                                .setPreferredOrientations([
                                                              DeviceOrientation
                                                                  .portraitUp,
                                                              DeviceOrientation
                                                                  .portraitDown,
                                                            ]);
                                                          },
                                                          child: Icon(
                                                            Icons.arrow_back,
                                                            color: ColorConstant
                                                                .whiteColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                              Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Icon(
                                                      Icons.reply_outlined,
                                                      color: ColorConstant
                                                          .whiteColor,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20.w,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Get.to(() =>
                                                          ConnectVideoGameScreen());
                                                    },
                                                    child: Icon(
                                                      Icons.cast,
                                                      color: ColorConstant
                                                          .whiteColor,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20.w,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      CustomDialogBox().showDialogBox(context,true,400,270);
                                                    },
                                                    child: Icon(
                                                      Icons.settings_outlined,
                                                      color: ColorConstant
                                                          .whiteColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Video control buttons (play/pause, forward, etc.)
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ButtonWidget(
                                                icon: Icon(
                                                  liveStreamingController
                                                              .playerState
                                                              .value ==
                                                          PlayerState.playing
                                                      ? Icons.pause
                                                      : Icons.play_arrow,
                                                  color:
                                                      ColorConstant.whiteColor,
                                                  size: 40.sp,
                                                ),
                                                onTap: () {
                                                  liveStreamingController
                                                      .playAndPause();
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Video duration and fullscreen button
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 15.w,
                                              right: 15.w,
                                              bottom: liveStreamingController
                                                      .isLandScape.value
                                                  ? 5.h
                                                  : 0.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(5.r),
                                                    decoration: BoxDecoration(
                                                        color: ColorConstant
                                                            .orangeColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    100.r)),
                                                  ),
                                                  SizedBox(
                                                    width: 10.w,
                                                  ),
                                                  CustomText(
                                                    "${liveStreamingController.formatDuration(liveStreamingController.position.value)} / ${liveStreamingController.formatDuration(liveStreamingController.videoController.value.duration)}",
                                                    fw: FontWeight.w600,
                                                    size: 14.sp,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(
                                                    width: 20.w,
                                                  ),
                                                  Icon(
                                                    Icons.groups_outlined,
                                                    color: ColorConstant
                                                        .whiteColor,
                                                    size: 20.sp,
                                                  ),
                                                  SizedBox(
                                                    width: 10.w,
                                                  ),
                                                  CustomText(
                                                    "3.5k",
                                                    fw: FontWeight.w600,
                                                    size: 14.sp,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(
                                                    width: 20.w,
                                                  ),
                                                  liveStreamingController
                                                          .isLandScape.value
                                                      ? Icon(
                                                          Icons.chat_outlined,
                                                          color: ColorConstant
                                                              .whiteColor,
                                                          size: 20.sp,
                                                        )
                                                      : Container(),
                                                ],
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  if (liveStreamingController
                                                          .isLandScape.value ==
                                                      false) {
                                                    // Switch to fullscreen (landscape mode)
                                                    SystemChrome
                                                        .setPreferredOrientations([
                                                      DeviceOrientation
                                                          .landscapeRight,
                                                      DeviceOrientation
                                                          .landscapeLeft,
                                                    ]);
                                                    liveStreamingController
                                                        .landscapeOrPortrait();
                                                    SystemChrome
                                                        .setEnabledSystemUIMode(
                                                            SystemUiMode
                                                                .immersiveSticky); // Hide status/navigation bars
                                                  } else {
                                                    // Exit fullscreen (portrait mode)
                                                    SystemChrome
                                                        .setPreferredOrientations([
                                                      DeviceOrientation
                                                          .portraitUp,
                                                      DeviceOrientation
                                                          .portraitDown,
                                                    ]);
                                                    liveStreamingController
                                                        .landscapeOrPortrait();
                                                  }
                                                },
                                                child: Icon(
                                                  Icons.fullscreen,
                                                  color:
                                                      ColorConstant.whiteColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(),
                            ),
                          ],
                        ),
                      ),
                      liveStreamingController.isLandScape.value
                          ? Container()
                          : Expanded(
                              flex: 3,
                              child: Container(
                                padding: EdgeInsets.all(20.r),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CustomImageContainer(
                                              image: ImageConstants.gameImage,
                                              height: 60.h,
                                              width: 60.h,
                                              borderRadius: 100.r,
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Column(
                                              children: [
                                                CustomText(
                                                  "InAdventure",
                                                  size: 18.sp,
                                                  fw: FontWeight.w700,
                                                  color:
                                                      ColorConstant.whiteColor,
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                CustomText(
                                                  "League of Legends",
                                                  size: 14.sp,
                                                  fw: FontWeight.w400,
                                                  color:
                                                      ColorConstant.whiteColor,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        ButtonWidget(
                                          radius: 100.r,
                                          height: 32.h,
                                          paddingHorizontal: 20.w,
                                          color: ColorConstant.cyanBlue,
                                          text: "Follow",
                                          textSize: 14.sp,
                                          fw: FontWeight.w700,
                                          textColor: ColorConstant.whiteColor,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Divider(
                                      color: ColorConstant.greyColor,
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            for (int i = 0; i <= 10; i++)
                                              CommentsWidget(),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: ColorConstant.greyColor,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Container(
                                      width: 327.w,
                                      height: 55.h,
                                      decoration: BoxDecoration(
                                          color: ColorConstant.greyColor,
                                          borderRadius:
                                              BorderRadius.circular(16.r)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.emoji_emotions_outlined,
                                              color: ColorConstant.whiteColor,
                                            ),
                                            Expanded(
                                                child: CustomTextFormField(
                                              horizontalPadding: 15.w,
                                              hintText: "Send a message",
                                            )),
                                            GestureDetector(
                                                onTap: () {},
                                                child: Icon(
                                                  Icons.send,
                                                  color:
                                                      ColorConstant.whiteColor,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
