import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'dart:typed_data';
class SquadPodController extends GetxController{
  int circularImageIndex=-1;
  bool isCheck=false;

  Uint8List? thumbnailData;
  void  generateThumbnail(videoUrl){
     thumbNail(videoUrl).then((data) {
      thumbnailData = data;
      update();
    });
  }

  Future<Uint8List?> thumbNail(String videoUrl) async {
    final uint8list = await VideoThumbnail.thumbnailData(
      video: videoUrl,
      imageFormat: ImageFormat.PNG,
      maxWidth: 128, // Specify the width of the thumbnail
      quality: 25,    // Specify the quality of the thumbnail
    );
    return uint8list;
  }

  void inviteCheck(bool value){
    isCheck=value;
    update();
  }




  void circularImages(int index){
     circularImageIndex=index;
     update();
  }


  late VideoPlayerController controller;
  late Future initializeVideoPlayerFuture;

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }
  // Track if the video is completed
  var isVideoCompleted = false.obs; // Make this an observable

  // Reactive variable to hold the slider position
  var sliderValue = 0.0.obs;

  // Initialize video player with a URL
  void videoPlayerController(String? url) {
    if (url != null) {
      controller = VideoPlayerController.network(url);

      // Initialize the video player and store the Future.
      initializeVideoPlayerFuture = controller.initialize().then((_) {
        update();  // Update once video is initialized.
      }).catchError((error) {
        print('Error initializing video player: $error');
      });

      // Add a listener to update the UI when the video position changes.
      controller.addListener(() {
        // Check if the video is completed
        if (controller.value.position >= controller.value.duration) {
          isVideoCompleted.value = true; // Update the observable
          videoPause();  // Automatically pause when video completes.
        }
        sliderValue.value = controller.value.position.inSeconds.toDouble();  // Update the slider value
        update();  // Trigger UI update on every tick.
      });
    } else {
      print('Error: URL is null');
    }
  }

  void videoPause() {
    controller.pause();
    update();
  }

  void videoPlay() {
    isVideoCompleted.value = false;  // Reset the completion status
    controller.play();
    update();
  }

  void sliderPosition(double value) {
    final newPosition = Duration(seconds: value.toInt());
    controller.seekTo(newPosition);
    sliderValue.value = value;  // Update slider position
    update();
  }

  @override
  void onClose() {
    controller.dispose();  // Dispose the video controller when not needed.
    super.onClose();
  }
}