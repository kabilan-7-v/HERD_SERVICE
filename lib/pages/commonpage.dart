// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:herd_service/Local_data_user/doctor_details.dart';
import 'package:herd_service/models/homemodel.dart';

import 'package:herd_service/pages/homepage.dart';

import 'package:herd_service/pages/profilepage.dart';
import 'package:herd_service/pages/tickethistory.dart';
import 'package:herd_service/server/home_api.dart';
import 'package:intl/intl.dart';

import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:provider/provider.dart';

class Commonpage extends StatefulWidget {
  Commonpage({
    super.key,
  });

  @override
  State<Commonpage> createState() => _HomepageState();
}

class _HomepageState extends State<Commonpage>
    with SingleTickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;
  bool accept = true;
  int counter = 0;
  int? doctor_id;
  String pass = "";
  int page = 0;
  static final List pages = [];

  DateTime? selectedDate;

  String finaldata = DateFormat('MMMM d, yyyy').format(DateTime.now());
  @override
  void initState() {
    super.initState();

    _motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  Future<void> initializeData() async {
    await doctor_details_local_data(context);
    Appoimentresquestapi(context,
        Provider.of<userprofiledetails>(context, listen: false).doctor_id);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    pages.addAll([
      Homepage(
        docto_id: Provider.of<userprofiledetails>(
          context,
        ).doctor_id,
      ),
      Tickethistory(
        backbuttonverify: true,
      ),
      Profilepage(
        pass: Provider.of<userprofiledetails>(context, listen: false).Password,
      )
    ]);
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: const Color.fromARGB(255, 223, 226, 228),
              spreadRadius: 2,
              blurRadius: 1)
        ]),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                page = 0;
                setState(() {});
              },
              child: SizedBox(
                width: width / 3,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        height: 30,
                        width: 30,
                        child: page == 0
                            ? Image.asset("assets/icons/home1.png")
                            : Image.asset("assets/icons/home.png")),
                    Text(
                      "Home",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight:
                              page == 0 ? FontWeight.bold : FontWeight.normal,
                          color: page == 0
                              ? Color.fromRGBO(70, 149, 184, 1)
                              : Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                page = 1;
                setState(() {});
              },
              child: SizedBox(
                width: width / 3,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        height: 30,
                        width: 30,
                        child: page == 1
                            ? Image.asset("assets/icons/tickethistory.png")
                            : Image.asset(
                                "assets/icons/payments_24dp_999999_FILL0_wght400_GRAD0_opsz24.png")),
                    Text(
                      "Ticket History",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight:
                              page == 1 ? FontWeight.bold : FontWeight.normal,
                          color: page == 1
                              ? Color.fromRGBO(70, 149, 184, 1)
                              : Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                page = 2;
                setState(() {});
              },
              child: SizedBox(
                width: width / 3,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        height: 30,
                        width: 30,
                        child: page == 2
                            ? Image.asset("assets/icons/person1.png")
                            : Image.asset("assets/icons/person.png")),
                    Text(
                      "Profile",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight:
                              page == 2 ? FontWeight.bold : FontWeight.normal,
                          color: page == 2
                              ? Color.fromRGBO(70, 149, 184, 1)
                              : Colors.grey),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: pages[page],
      // bottomNavigationBar: MotionTabBar(
      //   controller:
      //       _motionTabBarController, // ADD THIS if you need to change your tab programmatically
      //   initialSelectedTab: "Home",

      //   labels: const ["Home", "Ticket History", "Profile"],
      //   icons: const [
      //     Icons.home,
      //     Icons.payments_outlined,
      //     Icons.person,
      //   ],

      //   // optional badges, length must be same with labels

      //   tabSize: 50,
      //   tabBarHeight: 70,
      //   textStyle: const TextStyle(
      //     fontSize: 15,
      //     color: Colors.white,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   tabIconColor: Colors.white,
      //   tabIconSize: 28.0,
      //   tabIconSelectedSize: 26.0,
      //   tabSelectedColor: Colors.white,
      //   tabIconSelectedColor: const Color.fromRGBO(70, 149, 184, 1),
      //   tabBarColor: const Color.fromRGBO(70, 149, 184, 1),
      //   onTabItemSelected: (int value) {
      //     setState(() {
      //       // _tabController!.index = value;
      //       _motionTabBarController!.index = value;
      //     });
      //   },
      // ),

      // body: TabBarView(
      //   physics:
      //       const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
      //   // controller: _tabController,
      //   controller: _motionTabBarController,
      //   children: <Widget>[
      //     Homepage(
      //       docto_id: Provider.of<userprofiledetails>(
      //         context,
      //       ).doctor_id,
      //     ),
      //     Tickethistory(
      //       backbuttonverify: true,
      //     ),
      //     Profilepage(
      //       pass: Provider.of<userprofiledetails>(context, listen: false)
      //           .Password,
      //     )
      //   ],
      // ),
    );
  }
}
