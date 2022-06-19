import 'package:covid/home_page.dart';
import 'package:covid/navpages/about_page.dart';
import 'package:covid/navpages/event_page.dart';
import 'package:covid/navpages/statistics_page.dart';
import 'package:flutter/material.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({Key? key}) : super(key: key);

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  List pages = [
    const HomePage(),
    const StatisticsPage(),
    const EventPage(),
    const AboutPage(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: pages.length,
      child: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 0,
          selectedFontSize: 0,
          onTap: onTap,
          currentIndex: currentIndex,
          iconSize: 25,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          selectedItemColor: Colors.black,
          // selectedIconTheme: IconThemeData(
          // color: Colors.blue,
          // ),
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
              // Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Statistics",
              icon: Icon(Icons.insert_chart),
            ),
            BottomNavigationBarItem(
              label: "Event",
              icon: Icon(Icons.event_note),
            ),
            BottomNavigationBarItem(
              label: "Info",
              icon: Icon(Icons.info),
            ),
          ],
        ),
      ),
    );
  }
}
