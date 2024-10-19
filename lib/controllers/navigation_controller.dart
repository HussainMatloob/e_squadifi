import 'package:e_squadifi/views/screens/community_screen.dart';
import 'package:e_squadifi/views/screens/home_screen.dart';
import 'package:e_squadifi/views/screens/profile_screen.dart';
import 'package:e_squadifi/views/screens/squad_pod_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavController extends GetxController{

 int selectedNavIndex=0;
 bool groupExist=false;
  void navIndex(index){
    selectedNavIndex=index;
    update();
  }

  void groupCreate(bool value){
    groupExist=value;
    update();
  }

 final List<Widget> pages = [
   HomeScreen(),
   SquadPodScreen(),
   CommunityScreen(),
   ProfileScreen(),
 ];

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