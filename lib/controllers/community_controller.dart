import 'package:get/get.dart';

class CommunityController extends GetxController{
  String? communityNameValidate(value) {
    if (value == null || value.trim().isEmpty) {
      return "Please must enter community name";
    }
    return null; // Valid input
  }

  List<String> selectedUsers=[];
  void inviteUserCheck(String index){
    if((selectedUsers??[]).contains(index)){
      selectedUsers.remove(index);
      update();
    }else{
      selectedUsers.add(index);
      update();
    }
  }

  bool showEmoji = false;

  emoji(bool value) {
    showEmoji = value;
    update();
  }
}