import 'package:covid/widget/app_text.dart';
import 'package:covid/widget/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsCard extends StatelessWidget {
  final String title;
  final int numbers;
  final Color iconcolor;
  final Color backcolor;
  final Color? chartcolor;
  const DetailsCard({
    Key? key,
    required this.title,
    required this.numbers,
    required this.iconcolor,
    required this.backcolor,
    this.chartcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, Constraints) {
        return Container(
          width: Constraints.maxWidth / 2 - 10.w,
          decoration: BoxDecoration(
            color: backcolor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(5, 5),
                spreadRadius: 1,
                blurRadius: 3,
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 25.h,
                      width: 18.w,
                      child: CircleAvatar(
                        backgroundColor: iconcolor.withOpacity(0.12),
                        child: SvgPicture.asset(
                          "assets/images/running.svg",
                          height: 12.h,
                          width: 12.w,
                          color: iconcolor,
                        ),
                      ),
                    ),
                    // Container(
                    //   alignment: Alignment.center,
                    //   height: 30,
                    //   width: 30,
                    //   decoration: BoxDecoration(
                    //     color: Color(0xffff9c00).withOpacity(0.12),
                    //     shape: BoxShape.circle,
                    //   ),
                    //   child: SvgPicture.asset(
                    //     "assets/images/running.svg",
                    //     height: 12,
                    //     width: 12,
                    //   ),
                    // ),
                    const SizedBox(width: 5),
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Apptext(
                          text: "$numbers",
                          size: 16,
                        ),
                        // SizedBox(height: 3),
                        Text(
                          "people",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            height: 2,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                    //     RichText(
                    //   text: TextSpan(
                    //     style: TextStyle(
                    //       color: Color(0xff1e2432),
                    //     ),
                    //     children: [
                    //       TextSpan(
                    //         text: "$numbers\n",
                    //         style: TextStyle(
                    //             fontWeight: FontWeight.bold, fontSize: 19),
                    //       ),
                    //       TextSpan(
                    //         text: "people",
                    //         style: TextStyle(
                    //           fontSize: 12,
                    //           height: 2,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ),
                  Expanded(
                    child: LineChartReport(
                      color: chartcolor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
