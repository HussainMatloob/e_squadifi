import 'package:get/get.dart';

class CommunityController extends GetxController{
  String? communityNameValidate(value) {
    if (value == null || value.trim().isEmpty) {
      return "Please must enter community name";
    }
    return null; // Valid input
  }
}