import 'package:covid/feed/api_network.dart';
import 'package:covid/models/level_models.dart';
import 'package:covid/widget/app_text.dart';
import 'package:covid/widget/detailscard.dart';
import 'package:covid/widget/line_chart.dart';
import 'package:covid/widget/weeklychart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'feeds/api_network.dart';
import 'models/level_models.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  late Future<Welcometext> data;
  void initState() {
    // data = getapi();
    Network network = Network();
    data = network.getapi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: newAppBar(context),
      body: FutureBuilder(
        future: data,
        // ignore: non_constant_identifier_names
        builder: (Context, AsyncSnapshot<Welcometext> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: 1, //snapshot.data!.nyash.length,
              itemBuilder: (context, index) {
                var getdata = snapshot.data!.nyash[index];
                return SingleChildScrollView(
                  //scrollDirection: Axis.vertical,
                  child: SafeArea(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 20),
                              width: double.maxFinite.w,
                              decoration: BoxDecoration(
                                color: const Color(0xff0d8e53).withOpacity(0.3),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                ),
                              ),
                              child: Wrap(
                                runSpacing: 20,
                                spacing: 20,
                                children: [
                                  DetailsCard(
                                    title: "Confirmed Cases",
                                    numbers: getdata.cases.toInt(),
                                    iconcolor: Color(0xffff9c00),
                                    backcolor: Colors.blue,
                                    chartcolor: Color(0xff0d8e53),
                                  ),
                                  DetailsCard(
                                    title: "Total Deaths",
                                    numbers: getdata.deaths.toInt(),
                                    iconcolor: Color(0xffff2d55),
                                    backcolor: Colors.red,
                                    chartcolor: Colors.red,
                                  ),
                                  DetailsCard(
                                    title: "Total Recovered",
                                    numbers: getdata.recovered!.toInt(),
                                    iconcolor: Color(0xff50e3c2),
                                    backcolor: Color(0xff8d12fe),
                                    chartcolor: Color(0xff0d8e53),
                                  ),
                                  DetailsCard(
                                    title: "New Cases",
                                    numbers: getdata.todayCases.toInt(),
                                    iconcolor: Color(0xff5856d6),
                                    backcolor: Colors.orange,
                                    chartcolor: Color(0xff0d8e53),
                                  ),
                                  DetailsCard(
                                    title: "Critical",
                                    numbers: getdata.critical.toInt(),
                                    iconcolor: Colors.redAccent,
                                    backcolor: Colors.orangeAccent,
                                    chartcolor: Color(0xff0d8e53),
                                  ),
                                  DetailsCard(
                                    title: "Today Deaths",
                                    numbers: getdata.todayDeaths.toInt(),
                                    iconcolor: Colors.redAccent,
                                    backcolor: Colors.orangeAccent,
                                    chartcolor: Color(0xff0d8e53),
                                  )
                                ],
                              ),
                            ),
                            //const SizedBox(height: 40),
                            // const Padding(
                            //   padding: EdgeInsets.only(left: 10, right: 10),
                            //   child: WeeklyChart2(),
                            // ),
                            const SizedBox(height: 40),
                            // const Padding(
                            //   padding: EdgeInsets.only(left: 10, right: 10),
                            //   child: WeeklyChart(),
                            // ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 25),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 21),
                                      blurRadius: 53,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ]),
                              child: WeeklyChart(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // children: [
                  //   Column(
                  //     children: [
                  //       Container(
                  //         padding:
                  //             const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
                  //         width: double.maxFinite,
                  //         decoration: BoxDecoration(
                  //           color: const Color(0xff0d8e53).withOpacity(0.3),
                  //           borderRadius: const BorderRadius.only(
                  //             bottomLeft: Radius.circular(50),
                  //             bottomRight: Radius.circular(50),
                  //           ),
                  //         ),
                  //         child: Wrap(
                  //           runSpacing: 20,
                  //           spacing: 20,
                  //           children: const [
                  //             DetailsCard(
                  //               title: "Confirmed Cases",
                  //               numbers: 1062,
                  //               iconcolor: Color(0xffff9c00),
                  //               backcolor: Colors.blue,
                  //               chartcolor: Color(0xff0d8e53),
                  //             ),
                  //             DetailsCard(
                  //               title: "Total Deaths",
                  //               numbers: 75,
                  //               iconcolor: Color(0xffff2d55),
                  //               backcolor: Colors.red,
                  //               chartcolor: Colors.red,
                  //             ),
                  //             DetailsCard(
                  //               title: "Total Recovered",
                  //               numbers: 689,
                  //               iconcolor: Color(0xff50e3c2),
                  //               backcolor: Color(0xff8d12fe),
                  //               chartcolor: Color(0xff0d8e53),
                  //             ),
                  //             DetailsCard(
                  //               title: "New Cases",
                  //               numbers: 75,
                  //               iconcolor: Color(0xff5856d6),
                  //               backcolor: Colors.orange,
                  //               chartcolor: Color(0xff0d8e53),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       SizedBox(height: 20),
                  //       WeeklyChart2(),
                  //       SizedBox(height: 20),
                  //       WeeklyChart(),
                  //     ],
                  //   ),
                  // ],
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.black,
              color: Colors.red,
              strokeWidth: 2.0,
            ),
          );
        },
      ),
    );
  }
}
