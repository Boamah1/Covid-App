import 'package:covid/home_page.dart';
import 'package:covid/navpages/bottom_nav_page.dart';
import 'package:covid/navpages/event_page.dart';
import 'package:covid/navpages/statistics_page.dart';
import 'package:covid/welcome_page.dart';
import 'package:covid/widget/weeklychart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  //    SystemChrome.setPreferredOrientations(
  // //how to prevent the phone from rotating👇🏿
  // [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: const WelcomePage(),
    );
    // MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Covid_19 App',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const WelcomePage(),
    // );
  }
}
