import 'package:e_squadifi/constants/color_constants.dart';
import 'package:e_squadifi/controllers/squad_pod_controller.dart';
import 'package:e_squadifi/views/custom_widgets/custom_button_widget.dart';
import 'package:e_squadifi/views/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class PlayVideoWidget extends StatefulWidget {
  final double? height;
  final double? width;
  final double? borderRadius;
  final String? videoUrl;
  const PlayVideoWidget({super.key,
  this.height,
    this.width,
    this.borderRadius,
    this.videoUrl,
  });

  @override
  State<PlayVideoWidget> createState() => _PlayVideoWidgetState();
}

class _PlayVideoWidgetState extends State<PlayVideoWidget> {
  late SquadPodController squadPodController;

  @override
  void initState() {
    super.initState();
    squadPodController = Get.put(SquadPodController());
    squadPodController.videoPlayerController(widget.videoUrl);
  }

  @override
  void dispose() {
    squadPodController.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
              color: Colors.green
            ),
            child:  Stack(children: [
              FutureBuilder(
                future: squadPodController.initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(widget.borderRadius ?? 0), // Set border radius here
                      child: Container(
                        width: widget.width, // Adjusts to full width of parent
                        height: widget.height, // Adjusts to full height of parent
                        child: FittedBox(
                          fit: BoxFit.cover, // Adjust the fit based on your preference (BoxFit.cover, BoxFit.contain, etc.)
                          child: SizedBox(
                            width: squadPodController.controller.value.size.width,
                            height: squadPodController.controller.value.size.height,
                            child: VideoPlayer(squadPodController.controller),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: Container(
                        height: 30.h,
                        width: 30.w,
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                    );
                  }
                },
              ),
              Positioned(
                   bottom: 2.h,
                     left: 0,
                right: 0,
                child:  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    children: [
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 3.h, // Set the track height to 2 for width
                          activeTrackColor: Colors.white, // Active track color
                          inactiveTrackColor: Colors.grey, // Inactive track color
                          thumbColor: Colors.white, // Thumb color
                          overlayColor: Colors.white.withOpacity(0.2), // Overlay color when thumb is pressed
                          valueIndicatorColor: Colors.white, // Value indicator color
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 0), // Set horizontal padding to zero
                          child: Slider(
                            value: squadPodController.sliderValue.value,
                            min: 0,
                            max: squadPodController.controller.value.duration.inSeconds.toDouble(),
                            onChanged: (value) {
                              squadPodController.sliderPosition(value);
                            },
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText( squadPodController.formatDuration(
                              squadPodController.controller.value.position),fw: FontWeight.w500,size: 16.sp,color: Colors.white,),
                          CustomText(squadPodController.formatDuration(
                              squadPodController.controller.value.duration),fw: FontWeight.w500,size: 16.sp,color: Colors.white,),
                      ],)

                    ],
                  ),
                ),

                 )
            ],)
          ),
         SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.skip_previous, color: Colors.white, size: 30.sp),
                onPressed: () {
                  // Implement skip previous logic if needed.
                },
              ),
              IconButton(
                icon: Icon(Icons.replay_10, color: Colors.white, size: 30.sp),
                onPressed: () {
                  final currentPosition = squadPodController.controller.value
                      .position;
                  final newPosition = currentPosition.inSeconds > 10
                      ? Duration(seconds: currentPosition.inSeconds - 10)
                      : Duration.zero;
                  squadPodController.controller.seekTo(newPosition);
                },
              ),
              ButtonWidget(
                height: 66.h,
                width: 66.w,
                radius: 100.r,
                sizedBoxWidth: 0.w,
                color: ColorConstant.squadPurpleColor,
                icon: Icon(
                  squadPodController.controller.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow,
                  color: ColorConstant.whiteColor,
                  size: 30.sp,
                ),
                onTap: () {
                  if (squadPodController.controller.value.isPlaying) {
                    squadPodController.videoPause();
                  } else {
                    squadPodController.videoPlay();
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.forward_10, color: Colors.white, size: 30.sp),
                onPressed: () {
                  final currentPosition = squadPodController.controller.value
                      .position;
                  final maxDuration = squadPodController.controller.value
                      .duration;
                  final newPosition = currentPosition.inSeconds + 10 <
                      maxDuration.inSeconds
                      ? Duration(seconds: currentPosition.inSeconds + 10)
                      : maxDuration;
                  squadPodController.controller.seekTo(newPosition);
                },
              ),
              IconButton(
                icon: Icon(Icons.skip_next, color: Colors.white, size: 30.sp),
                onPressed: () {
                  // Implement skip next logic if needed.
                },
              ),
            ],
          ),
        ],
      );
    });
  }}
