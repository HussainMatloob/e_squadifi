import 'package:e_squadifi/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';


late Size mq;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Hide status bar and navigation bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

 // Set the status bar style (optional, if you want to control transparency)
 //  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
 //    statusBarColor: Colors.transparent, // Makes status bar transparent
 //    statusBarIconBrightness: Brightness.light, // Changes icon brightness
 //  ));

  // runApp(
  //     DevicePreview(
  //         builder:(context)=>
  //         const MyApp())
  // );

  // if (Platform.isAndroid) {
  //   WebView.platform = SurfaceAndroidWebView();
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        // Check if the orientation is landscape or portrait
        var isLandscape = orientation == Orientation.landscape;
        return ScreenUtilInit(
          // Set the designSize based on the screen orientation
          designSize: isLandscape ? Size(932, 430) : Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'eSquadifi',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
                scaffoldBackgroundColor: Colors.transparent,
              ),
              home: SplashScreen(),
              builder: EasyLoading.init(),
            );
          },
        );
      },
    );
  }
}
