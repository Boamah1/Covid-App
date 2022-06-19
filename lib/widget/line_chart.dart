import 'package:covid/home_page.dart';
import 'package:covid/navpages/bottom_nav_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LineChartReport extends StatelessWidget {
  final Color? color;
  const LineChartReport({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.2,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: getSpots(),
              isCurved: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
              color: color,
              barWidth: 4,
            ),
          ],
        ),
      ),
    );
  }
}

List<FlSpot> getSpots() {
  return const [
    FlSpot(0, .5),
    FlSpot(1, 1.5),
    FlSpot(2, .5),
    FlSpot(3, .7),
    FlSpot(4, .2),
    FlSpot(5, 2),
    FlSpot(6, 1.5),
    FlSpot(7, 1.7),
    FlSpot(8, 1),
    FlSpot(9, 2.8),
    FlSpot(10, 2.5),
    FlSpot(11, 2.65),
  ];
}

AppBar newAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Color(0xff0d8e53).withOpacity(0.3),
    elevation: 0.0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Color(0xff0d8e53),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const BottomNavPage(),
          ),
        );
      },
    ),
    actions: [
      IconButton(
        icon: SvgPicture.asset("assets/images/search.svg"),
        onPressed: () {},
      ),
    ],
  );
}
