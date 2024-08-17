// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:herd_service/pages/homepage.dart';

import 'package:herd_service/pages/profilepage.dart';
import 'package:herd_service/pages/tickethistory.dart';
import 'package:herd_service/server/Notificationapi.dart';
import 'package:herd_service/server/home_api.dart';
import 'package:intl/intl.dart';

import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

class Commonpage extends StatefulWidget {
  const Commonpage({super.key});

  @override
  State<Commonpage> createState() => _HomepageState();
}

class _HomepageState extends State<Commonpage>
    with SingleTickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;
  bool accept = true;
  int counter = 0;

  DateTime? selectedDate;

  String finaldata = DateFormat('MMMM d, yyyy').format(DateTime.now());
  @override
  void initState() {
    super.initState();
    Appoimentresquestapi(context, 2);
    Notification_api(context, 2);

    _motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MotionTabBar(
        controller:
            _motionTabBarController, // ADD THIS if you need to change your tab programmatically
        initialSelectedTab: "Home",

        labels: const ["Home", "Ticket History", "Profile"],
        icons: const [
          Icons.home,
          Icons.payments_outlined,
          Icons.person,
        ],

        // optional badges, length must be same with labels

        tabSize: 50,
        tabBarHeight: 70,
        textStyle: const TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        tabIconColor: Colors.white,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: Colors.white,
        tabIconSelectedColor: const Color.fromRGBO(70, 149, 184, 1),
        tabBarColor: const Color.fromRGBO(70, 149, 184, 1),
        onTabItemSelected: (int value) {
          setState(() {
            // _tabController!.index = value;
            _motionTabBarController!.index = value;
          });
        },
      ),
      body: TabBarView(
        physics:
            const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
        // controller: _tabController,
        controller: _motionTabBarController,
        children: <Widget>[
          const Homepage(),
          const Tickethistory(),
          const Profilepage()
        ],
      ),
    );
  }
}
