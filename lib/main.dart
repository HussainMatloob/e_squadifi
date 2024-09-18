import 'package:e_squadifi/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Hide status bar and navigation bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // Set the status bar style (optional, if you want to control transparency)
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Makes status bar transparent
    statusBarIconBrightness: Brightness.light, // Changes icon brightness
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
    designSize: Size(375,812),
    minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'eSquadifi',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          //scaffoldBackgroundColor: Color(0xFF1A003D),
          scaffoldBackgroundColor: Colors.transparent
        ),
         home: SplashScreen());
      }
    );
  }
}

