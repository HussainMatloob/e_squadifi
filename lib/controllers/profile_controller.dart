import 'package:get/get.dart';

class ProfileController extends GetxController{
  int selectedIndex=0;
  int selectedProfileTileIndex=0;


void changeProfile(index){
  selectedIndex=index;
  update();
}

void changeTileSelection(value){
  selectedProfileTileIndex=value;
  update();
}

}