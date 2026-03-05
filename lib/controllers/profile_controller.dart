import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  List<int> gameIndexes = [];
  int selectedIndex = 0;
  int selectedProfileTileIndex = 0;
  List<int> preferredGameModeIndexes = [];

  void selectPreferredGameMode(int index) {
    if ((preferredGameModeIndexes ?? []).contains(index)) {
      preferredGameModeIndexes.remove(index);
      update();
    } else {
      preferredGameModeIndexes.add(index);
      update();
    }
  }

  void selectGames(int index) {
    if ((gameIndexes ?? []).contains(index)) {
      gameIndexes.remove(index);
      update();
    } else {
      gameIndexes.add(index);
      update();
    }
  }

  void clearGameIndexes() {
    gameIndexes.clear();
    update();
  }

  void changeProfile(index) {
    selectedIndex = index;
    update();
  }

  void changeTileSelection(value) {
    selectedProfileTileIndex = value;
    update();
  }

  bool isLoading = true;
  // Wait 2 seconds before rendering UI
  void waiting(BuildContext context) async {
    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) {
        isLoading = false;
        update();
      }
    });
  }

  void setLoadingTrue() {
    isLoading = true;
    update();
  }
}
