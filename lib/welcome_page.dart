import 'package:covid/navpages/bottom_nav_page.dart';
import 'package:covid/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/cover2.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 40.h,
                    ),
                    width: double.maxFinite,
                    child: Column(
                      children: const [
                        Center(
                          child: Text(
                            "The Covid-19",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "App 😷",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 500,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).pushReplacement(
                        //   MaterialPageRoute(
                        //     builder: (_) => BottomNavPage(),
                        //   ),
                        // );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const BottomNavPage(),
                          ),
                        );
                      },
                      child: Center(
                        child: Apptext(
                          text: "Learn Awaareness",
                          size: 17.sp,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        maximumSize: Size(230.w, 44.3.h),
                      ),
                      // Container(
                      //   margin: const EdgeInsets.only(left: 70, right: 70),
                      //   height: 50,
                      //   width: double.maxFinite,
                      //   decoration: BoxDecoration(
                      //     color: Colors.grey.withOpacity(0.5),
                      //     borderRadius: BorderRadius.circular(20),
                      //   ),
                      //   child: Center(
                      //     child: Apptext(
                      //       text: "Learn Awaareness",
                      //       size: 20,
                      //     ),
                      //   ),
                      // ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
