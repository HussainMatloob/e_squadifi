import 'package:get/get.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'dart:typed_data';
class SquadPodController extends GetxController{
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

}