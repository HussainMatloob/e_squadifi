import 'package:e_squadifi/services/firebase_services.dart';
import 'package:e_squadifi/views/screens/community_groups_screen.dart';
import 'package:e_squadifi/views/screens/community_screen.dart';
import 'package:e_squadifi/views/screens/home_screen.dart';
import 'package:e_squadifi/views/screens/profile_screen.dart';
import 'package:e_squadifi/views/screens/squad_pod_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavController extends GetxController{
  bool isCommunityCreated=false;
 int selectedNavIndex=0;
 String communityName="";

  void navIndex(index){
    selectedNavIndex=index;
    update();
  }

Future<void> getCommunityName() async{
    communityName=await FirebaseServices.getCommunity();
    update();
}

  Future<void> communityMethod() async{
    isCommunityCreated=await FirebaseServices.communityExists();
    update();
  }


  // Getter for the pages list that dynamically checks `isCommunityCreated`
  List<Widget> get pages {
    return [
      HomeScreen(),
      SquadPodScreen(),
      isCommunityCreated ? CommunityGroupsScreen() : CommunityScreen(),
      ProfileScreen(),
    ];
  }

 bool isBottomSheetVisible = false;

 void toggleBottomSheet() {
     isBottomSheetVisible = !isBottomSheetVisible;
     update();
 }

 void setBottomSheetFalse(){
   isBottomSheetVisible=false;
   update();
 }
}