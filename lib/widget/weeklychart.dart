import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeeklyChart extends StatelessWidget {
  const WeeklyChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.4.r,
      child: BarChart(
        BarChartData(
          barGroups: getBarGroups(),
          borderData: FlBorderData(
            show: false,
            border: Border.all(),
          ),
          titlesData: FlTitlesData(
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final day = getWeek(value.toInt());
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      day,
                      style: TextStyle(
                        color: Colors.red,
                        //Color(0xFF7589A2),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

getBarGroups() {
  List<double> barChartDatas = [6, 10, 8, 7, 10, 15, 9];
  List<BarChartGroupData> barChartGroups = [];
  barChartDatas.asMap().forEach(
        (i, value) => barChartGroups.add(
          BarChartGroupData(
            x: i,
            barRods: [
              BarChartRodData(
                toY: value,
                //This is not the proper way, this is just for demo
                color: i == 6 ? Color(0xff0d8e53) : Color(0xffeaecef),
                width: 16,
              )
            ],
          ),
        ),
      );
  return barChartGroups;
}

String getWeek(value) {
  switch (value.toInt()) {
    case 0:
      return 'MON';
    case 1:
      return 'TUE';
    case 2:
      return 'WED';
    case 3:
      return 'THU';
    case 4:
      return 'FRI';
    case 5:
      return 'SAT';
    case 6:
      return 'SUN';
    default:
      return '';
  }
}

// import 'dart:async';
// import 'dart:math';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// // import 'package:example/utils/color_extensions.dart';

// class WeeklyChart extends StatefulWidget {
//   final List<Color> availableColors = const [
//     Colors.purpleAccent,
//     Colors.yellow,
//     Colors.lightBlue,
//     Colors.orange,
//     Colors.pink,
//     Colors.redAccent,
//   ];

//   const WeeklyChart({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => BarChartSample1State();
// }

// class BarChartSample1State extends State<WeeklyChart> {
//   final Color barBackgroundColor = const Color(0xff72d8bf);
//   final Duration animDuration = const Duration(milliseconds: 250);

//   int touchedIndex = -1;

//   bool isPlaying = false;

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1,
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//         color: const Color(0xff81e5cd),
//         child: Stack(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.max,
//                 children: <Widget>[
//                   const Text(
//                     'Mingguan',
//                     style: TextStyle(
//                         color: Color(0xff0f4a3c),
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   const Text(
//                     'Grafik konsumsi kalori',
//                     style: TextStyle(
//                         color: Color(0xff379982),
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(
//                     height: 38,
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: BarChart(
//                         isPlaying ? randomData() : mainBarData(),
//                         swapAnimationDuration: animDuration,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Align(
//                 alignment: Alignment.topRight,
//                 child: IconButton(
//                   icon: Icon(
//                     isPlaying ? Icons.pause : Icons.play_arrow,
//                     color: const Color(0xff0f4a3c),
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       isPlaying = !isPlaying;
//                       if (isPlaying) {
//                         refreshState();
//                       }
//                     });
//                   },
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   BarChartGroupData makeGroupData(
//     int x,
//     double y, {
//     bool isTouched = false,
//     Color barColor = Colors.white,
//     double width = 22,
//     List<int> showTooltips = const [],
//   }) {
//     return BarChartGroupData(
//       x: x,
//       barRods: [
//         BarChartRodData(
//           toY: isTouched ? y + 1 : y,
//           color: isTouched ? Colors.yellow : barColor,
//           width: width,
//           borderSide: isTouched
//               ? BorderSide(color: Colors.yellow, width: 1)
//               : const BorderSide(color: Colors.white, width: 0),
//           backDrawRodData: BackgroundBarChartRodData(
//             show: true,
//             toY: 20,
//             color: barBackgroundColor,
//           ),
//         ),
//       ],
//       showingTooltipIndicators: showTooltips,
//     );
//   }

//   List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
//         switch (i) {
//           case 0:
//             return makeGroupData(0, 5, isTouched: i == touchedIndex);
//           case 1:
//             return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
//           case 2:
//             return makeGroupData(2, 5, isTouched: i == touchedIndex);
//           case 3:
//             return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
//           case 4:
//             return makeGroupData(4, 9, isTouched: i == touchedIndex);
//           case 5:
//             return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
//           case 6:
//             return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
//           default:
//             return throw Error();
//         }
//       });

//   BarChartData mainBarData() {
//     return BarChartData(
//       barTouchData: BarTouchData(
//         touchTooltipData: BarTouchTooltipData(
//             tooltipBgColor: Colors.blueGrey,
//             getTooltipItem: (group, groupIndex, rod, rodIndex) {
//               String weekDay;
//               switch (group.x.toInt()) {
//                 case 0:
//                   weekDay = 'Monday';
//                   break;
//                 case 1:
//                   weekDay = 'Tuesday';
//                   break;
//                 case 2:
//                   weekDay = 'Wednesday';
//                   break;
//                 case 3:
//                   weekDay = 'Thursday';
//                   break;
//                 case 4:
//                   weekDay = 'Friday';
//                   break;
//                 case 5:
//                   weekDay = 'Saturday';
//                   break;
//                 case 6:
//                   weekDay = 'Sunday';
//                   break;
//                 default:
//                   throw Error();
//               }
//               return BarTooltipItem(
//                 weekDay + '\n',
//                 const TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//                 children: <TextSpan>[
//                   TextSpan(
//                     text: (rod.toY - 1).toString(),
//                     style: const TextStyle(
//                       color: Colors.yellow,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               );
//             }),
//         touchCallback: (FlTouchEvent event, barTouchResponse) {
//           setState(() {
//             if (!event.isInterestedForInteractions ||
//                 barTouchResponse == null ||
//                 barTouchResponse.spot == null) {
//               touchedIndex = -1;
//               return;
//             }
//             touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
//           });
//         },
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         rightTitles: AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         topTitles: AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             getTitlesWidget: getTitles,
//             reservedSize: 38,
//           ),
//         ),
//         leftTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: false,
//           ),
//         ),
//       ),
//       borderData: FlBorderData(
//         show: false,
//       ),
//       barGroups: showingGroups(),
//       gridData: FlGridData(show: false),
//     );
//   }

//   Widget getTitles(double value, TitleMeta meta) {
//     const style = TextStyle(
//       color: Colors.white,
//       fontWeight: FontWeight.bold,
//       fontSize: 14,
//     );
//     Widget text;
//     switch (value.toInt()) {
//       case 0:
//         text = const Text('M', style: style);
//         break;
//       case 1:
//         text = const Text('T', style: style);
//         break;
//       case 2:
//         text = const Text('W', style: style);
//         break;
//       case 3:
//         text = const Text('T', style: style);
//         break;
//       case 4:
//         text = const Text('F', style: style);
//         break;
//       case 5:
//         text = const Text('S', style: style);
//         break;
//       case 6:
//         text = const Text('S', style: style);
//         break;
//       default:
//         text = const Text('', style: style);
//         break;
//     }
//     return Padding(
//       padding: const EdgeInsets.only(top: 8.0),
//       child: text,
//     );
//   }

//   BarChartData randomData() {
//     return BarChartData(
//       barTouchData: BarTouchData(
//         enabled: false,
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             getTitlesWidget: getTitles,
//             reservedSize: 38,
//           ),
//         ),
//         leftTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: false,
//           ),
//         ),
//         topTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: false,
//           ),
//         ),
//         rightTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: false,
//           ),
//         ),
//       ),
//       borderData: FlBorderData(
//         show: false,
//       ),
//       barGroups: List.generate(7, (i) {
//         switch (i) {
//           case 0:
//             return makeGroupData(0, Random().nextInt(15).toDouble() + 6,
//                 barColor: widget.availableColors[
//                     Random().nextInt(widget.availableColors.length)]);
//           case 1:
//             return makeGroupData(1, Random().nextInt(15).toDouble() + 6,
//                 barColor: widget.availableColors[
//                     Random().nextInt(widget.availableColors.length)]);
//           case 2:
//             return makeGroupData(2, Random().nextInt(15).toDouble() + 6,
//                 barColor: widget.availableColors[
//                     Random().nextInt(widget.availableColors.length)]);
//           case 3:
//             return makeGroupData(3, Random().nextInt(15).toDouble() + 6,
//                 barColor: widget.availableColors[
//                     Random().nextInt(widget.availableColors.length)]);
//           case 4:
//             return makeGroupData(4, Random().nextInt(15).toDouble() + 6,
//                 barColor: widget.availableColors[
//                     Random().nextInt(widget.availableColors.length)]);
//           case 5:
//             return makeGroupData(5, Random().nextInt(15).toDouble() + 6,
//                 barColor: widget.availableColors[
//                     Random().nextInt(widget.availableColors.length)]);
//           case 6:
//             return makeGroupData(6, Random().nextInt(15).toDouble() + 6,
//                 barColor: widget.availableColors[
//                     Random().nextInt(widget.availableColors.length)]);
//           default:
//             return throw Error();
//         }
//       }),
//       gridData: FlGridData(show: false),
//     );
//   }

//   Future<dynamic> refreshState() async {
//     setState(() {});
//     await Future<dynamic>.delayed(
//         animDuration + const Duration(milliseconds: 50));
//     if (isPlaying) {
//       await refreshState();
//     }
//   }
// }

// class WeeklyChart2 extends StatelessWidget {
//   const WeeklyChart2({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: const [
//               Text(
//                 'Expenditures Chart',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 'Fast Analysis',
//                 style: TextStyle(color: Colors.black38),
//               ),
//             ],
//           ),
//         ),
//         Material(
//           clipBehavior: Clip.antiAlias,
//           shape: const RoundedRectangleBorder(
//             side: BorderSide(color: Colors.grey),
//             borderRadius: BorderRadius.all(Radius.circular(12)),
//           ),
//           child: PopupMenuButton(
//             itemBuilder: (context) {
//               return popupOptions
//                   .map((option) => PopupMenuItem(child: Text(option)))
//                   .toList();
//             },
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
//               child: Row(
//                 children: [
//                   Text(popupOptions[0]),
//                   const Icon(Icons.keyboard_arrow_down),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// final popupOptions = <String>[
//   'Weekly',
//   'Monthly',
//   'Yearly',
// ];



// class WeeklyChart extends StatelessWidget {
//   final List<double> covidCases;

//   const WeeklyChart({Key? key, required this.covidCases}) : super(key: key);

//   // const CovidBarChart({@required this.covidCases});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 350.0,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20.0),
//           topRight: Radius.circular(20.0),
//         ),
//       ),
//       child: Column(
//         children: <Widget>[
//           Container(
//             padding: const EdgeInsets.all(20.0),
//             alignment: Alignment.centerLeft,
//             child: Text(
//               'Daily New Cases',
//               style: const TextStyle(
//                 fontSize: 22.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Container(
//             width: MediaQuery.of(context).size.width * 0.85,
//             child: BarChart(
//               BarChartData(
//                 alignment: BarChartAlignment.spaceAround,
//                 maxY: 16.0,
//                 barTouchData: BarTouchData(enabled: false),
//                 titlesData: FlTitlesData(
//                   show: true,
//                   bottomTitles: 
//                   AxisTitles(
//                     sideTitles: SideTitles(
//                       showTitles: true,
//                       getTitlesWidget: (value, meta) {
//                         final day = getWeek(value.toInt());
//                         return Padding(
//                           padding: const EdgeInsets.only(top: 8.0),
//                           child: Text(
//                             day,
//                             style: const TextStyle(
//                               color: Color(0xFF7589A2),
//                               fontSize: 10,
//                               fontWeight: FontWeight.w200,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   // SideTitles(
//                   //   margin: 10.0,
//                   //   showTitles: true,
//                   //   textStyle: Styles.chartLabelsTextStyle,
//                   //   rotateAngle: 35.0,
//                   //   getTitles: (double value) {
//                   //     switch (value.toInt()) {
//                   //       case 0:
//                   //         return 'May 24';
//                   //       case 1:
//                   //         return 'May 25';
//                   //       case 2:
//                   //         return 'May 26';
//                   //       case 3:
//                   //         return 'May 27';
//                   //       case 4:
//                   //         return 'May 28';
//                   //       case 5:
//                   //         return 'May 29';
//                   //       case 6:
//                   //         return 'May 30';
//                   //       default:
//                   //         return '';
//                   //     }
//                   //   },
//                   // ),
//                   leftTitles:AxisTitles(
//                     sideTitles: SideTitles(
//                       showTitles: false,
//                       getTitlesWidget: (value, meta) {
//                         final days = getWeek2(value);
//                         return Padding(
//                           padding: const EdgeInsets.only(top: 8.0),
//                           child: Text(
//                             days,
//                             style: const TextStyle(
//                               color: Color(0xFF7589A2),
//                               fontSize: 10,
//                               fontWeight: FontWeight.w200,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   // SideTitles(
//                   //     margin: 10.0,
//                   //     showTitles: true,
//                   //     textStyle: Styles.chartLabelsTextStyle,
//                   //     getTitles: (value) {
//                   //       if (value == 0) {
//                   //         return '0';
//                   //       } else if (value % 3 == 0) {
//                   //         return '${value ~/ 3 * 5}K';
//                   //       }
//                   //       return '';
//                   //     },
//                   //     ),
//                 ),
//                 gridData: FlGridData(
//                   show: true,
//                   checkToShowHorizontalLine: (value) => value % 3 == 0,
//                   getDrawingHorizontalLine: (value) => FlLine(
//                     color: Colors.black12,
//                     strokeWidth: 1.0,
//                     dashArray: [5],
//                   ),
//                 ),
//                 borderData: FlBorderData(show: false),
//                 barGroups: covidCases
//                     .asMap()
//                     .map((key, value) => MapEntry(
//                         key,
//                         BarChartGroupData(
//                           x: key,
//                           barRods: [
//                             BarChartRodData(
//                               toY: value,
//                               color: Colors.red,
//                             ),
//                           ],
//                         )))
//                     .values
//                     .toList(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// String getWeek(value) {
//   switch (value.toInt()) {
//     case 0:
//       return 'May 24';
//     case 1:
//       return 'May 25';
//     case 2:
//       return 'May 26';
//     case 3:
//       return 'May 27';
//     case 4:
//       return 'May 28';
//     case 5:
//       return 'May 29';
//     case 6:
//       return 'May 30';
//     default:
//       return '';
//   }
// }

 

// String getWeek2(value) {
//   // switch (value.toInt()) {
//   if (value == 0) {
//     return '0';
//   } else if (value % 3 == 0) {
//     return '${value ~/ 3 * 5}K';
//   }
//   return '';
// }
