import 'package:get/get.dart';
class ProfileController extends GetxController{
  List<int> gameIndexes=[];
  int selectedIndex=0;
  int selectedProfileTileIndex=0;
  List<int> preferredGameModeIndexes=[];

  void selectPreferredGameMode(int index){
    if((preferredGameModeIndexes??[]).contains(index)){
      preferredGameModeIndexes.remove(index);
      update();
    }else{
      preferredGameModeIndexes.add(index);
      update();
    }
  }

  void selectGames(int index){
    if((gameIndexes??[]).contains(index)){
      gameIndexes.remove(index);
      update();
    }else{
      gameIndexes.add(index);
      update();
    }
  }

  void clearGameIndexes(){
    gameIndexes.clear();
    update();
  }




void changeProfile(index){
  selectedIndex=index;
  update();
}

void changeTileSelection(value){
  selectedProfileTileIndex=value;
  update();
}

}