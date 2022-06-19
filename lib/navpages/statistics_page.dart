import 'package:covid/widget/app_text.dart';
import 'package:covid/widget/detailscard.dart';
import 'package:covid/widget/line_chart.dart';
import 'package:covid/widget/weeklychart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: newAppBar(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 20, bottom: 40),
                  width: double.maxFinite,
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
                    children: const [
                      DetailsCard(
                        title: "Confirmed Cases",
                        numbers: 1062,
                        iconcolor: Color(0xffff9c00),
                        backcolor: Colors.blue,
                        chartcolor: Color(0xff0d8e53),
                      ),
                      DetailsCard(
                        title: "Total Deaths",
                        numbers: 75,
                        iconcolor: Color(0xffff2d55),
                        backcolor: Colors.red,
                        chartcolor: Colors.red,
                      ),
                      DetailsCard(
                        title: "Total Recovered",
                        numbers: 689,
                        iconcolor: Color(0xff50e3c2),
                        backcolor: Color(0xff8d12fe),
                        chartcolor: Color(0xff0d8e53),
                      ),
                      DetailsCard(
                        title: "New Cases",
                        numbers: 75,
                        iconcolor: Color(0xff5856d6),
                        backcolor: Colors.orange,
                        chartcolor: Color(0xff0d8e53),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // WeeklyChart2(),
                SizedBox(height: 20),
                WeeklyChart()
              ],
            ),
          ],
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
      ),
    );
  }
}
