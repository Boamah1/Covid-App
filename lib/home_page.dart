import 'package:covid/widget/app_large_text.dart';
import 'package:covid/widget/app_text.dart';
import 'package:covid/widget/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return
        // MaterialApp(
        //   home: Scaffold(
        //     appBar: PreferredSize(
        //       preferredSize: Size.fromHeight(200.0),
        //       child: AppBar(
        //         title: Text("data"),
        //       ),
        //     ),
        //   ),
        // );
        Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff473f97),
        elevation: 0.0,
        leading: IconButton(
          iconSize: 28,
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            iconSize: 28,
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        //physics: const ClampingScrollPhysics(),
        // physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    // margin: const EdgeInsets.only(top: 50),
                    height: 250.h,
                    width: 380.w,
                    decoration: const BoxDecoration(
                      color: Color(0xff473f97),
                      // image: DecorationImage(
                      //   image: AssetImage("assets/images/nur3.png"),
                      // ),
                      // gradient: LinearGradient(
                      //   begin: Alignment.bottomLeft,
                      //   end: Alignment.bottomRight,
                      //   colors: [
                      //     Color(0xff3383CD),
                      //     Color(0xFF11249F),
                      //     Colors.black38.withOpacity(0.9)
                      //   ],
                      // ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Image.asset("assets/images/nur3.png"),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 5),
                              child: AppLargeText(
                                text: "Covid_19",
                                color: Colors.white,
                                size: 22.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, top: 20),
                              child: Apptext(
                                text: "Coronavirus disease (COVID-19)",
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, top: 5),
                              child: Apptext(
                                text: "is an infectious disease caused",
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, top: 5),
                              child: Apptext(
                                text: "by the SARS-CoV-2 virus.",
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, top: 5),
                              child: Apptext(
                                text: "COVID-19 affects different ",
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, top: 5),
                              child: Apptext(
                                text: "people in different ways.",
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, top: 5),
                              child: Apptext(
                                text: "The official names COVID-19",
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, top: 5),
                              child: Apptext(
                                text: "and SARS-CoV-2 were issued by",
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, top: 5),
                              child: Apptext(
                                text: "the WHO on 11 February 2020.",
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 20),
                child: AppLargeText(
                  text: "Symptoms of Covid_19",
                  size: 23,
                ),
              ),
              const SizedBox(height: 10),
              symptomsMethod(),
              // SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: AppLargeText(
                  text: "Prevention Tips",
                  size: 23,
                ),
              ),
              const SizedBox(height: 5),

              preventionMethod(),
              // Container(
              //   margin: const EdgeInsets.only(left: 30, right: 30),
              //   height: 150,
              //   width: double.maxFinite,
              //   child: Stack(
              //     children: [
              //       Container(
              //         height: 130,
              //         width: double.maxFinite,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(20),
              //           color: const Color(0xff473f97),
              //         ),
              //         child:
              //             // The text and the image need to be in the Row
              //             // 👎🏿
              //             Row(
              //           // mainAxisAlignment: MainAxisAlignment.spaceAround,
              //           children: [
              //             Image.asset("assets/images/nur4.png"),
              //             Column(
              //               // mainAxisAlignment: MainAxisAlignment.center,
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Padding(
              //                   padding:
              //                       const EdgeInsets.only(top: 20, left: 50),
              //                   child: AppLargeText(
              //                     text: "Do your own test",
              //                     size: 18,
              //                     color: Colors.white,
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsets.only(left: 50),
              //                   child: Apptext(text: "text"),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                height: 124.5.h,
                width: double.maxFinite.w,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      height: 108.h,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xff473f97),
                      ),
                    ),
                    // The text and the image need to be in the Row
                    // 👎🏿
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/nur4.png",
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40, left: 50),
                              child: AppLargeText(
                                text: "Do your own test!",
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Apptext(
                                text: "Follow the instructions",
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Apptext(
                                text: "to do your own text",
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        overlayColor: Colors.black,
        children: [
          SpeedDialChild(
            child: const Icon(
              Icons.call,
              color: Colors.white,
            ),
            backgroundColor: Colors.green,
            label: "Call Now",
            onTap: () {
              // actionButtons(sms: "tell:0555384748");
              makePhoneCall("0555384748");
            },
          ),
          SpeedDialChild(
            child: const Icon(
              Icons.message,
              color: Colors.white,
            ),
            backgroundColor: Colors.yellow.withOpacity(0.5),
            label: "Chat",
            onTap: () {
              actionButtons(sms: "sms:0555384748");
            },
          ),
        ],
      ),
    );
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  actionButtons({required String sms}) {
    launchURL() async => await canLaunch(sms)
        ? await launch(sms)
        : throw 'Could not launch $sms';
    return launchURL();
  }
}
