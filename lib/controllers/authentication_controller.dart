import 'package:get/get.dart';

class AuthenticationController extends GetxController{
bool isPhone=false;
bool isEmail=true;
String? gender;
List<String> selectedGoals=[];
List<String> selectedTreats=[];
void signInWithPhone(){
  isPhone=true;
  isEmail=false;
  update();
}
void signInWithEmail(){
  isPhone=false;
  isEmail=true;
  update();
}

void selectGender(String value){
  gender=value;
  update();
}

void selectOrRemoveGoal(String value){
  if((selectedGoals??[]).contains(value)){
    selectedGoals.remove(value);
    update();
  }else{
    selectedGoals.add(value);
    update();
  }
}
void selectOrRemoveTraits(String value){
  if((selectedTreats??[]).contains(value)){
    selectedTreats.remove(value);
    update();
  }else{
    selectedTreats.add(value);
    update();
  }
}
}