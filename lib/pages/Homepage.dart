// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:herd_service/customer_utility/customercard.dart';
import 'package:herd_service/customer_utility/customercontainer.dart';
import 'package:herd_service/pages/profilepage.dart';
import 'package:herd_service/pages/tickethistory.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:intl/intl.dart';

import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;
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

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }

  String Date = "25 Jun 20024, 8am";

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
          homepage(Date, finaldata),
          const Tickethistory(),
          const Profilepage()
        ],
      ),
    );
  }

  Widget homepage(date, finaldata) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                        color: Color.fromRGBO(132, 146, 190, 1), fontSize: 16),
                  ),
                ],
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Dr.k.Ram Kumar",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Current Request",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              appoinment_Request(Date),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Assignment",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Stack(children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 30,
                    height: 200,
                    // margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          const BoxShadow(color: Colors.grey, blurRadius: 3)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  Positioned(
                      top: 27,
                      left: 100,
                      child: Text(
                        finaldata,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),

                  calendar(),
                  // Positioned(
                  //     top: 37,
                  //     left: 270,
                  //     child: InkWell(
                  //         onTap: () async {
                  //           final DateTime? picked = await showDatePicker(
                  //               context: context,
                  //               initialDate: DateTime.now(),
                  //               firstDate: DateTime(2020),
                  //               lastDate: DateTime(2030),
                  //               helpText: 'Select a date',
                  //               cancelText: 'CANCEL',
                  //               confirmText: 'OK',
                  //               initialEntryMode: DatePickerEntryMode.calendar,
                  //               builder: (context, child) {
                  //                 return Theme(
                  //                   data: ThemeData(
                  //                       colorScheme: ColorScheme.fromSeed(
                  //                     surfaceBright: Colors.white,
                  //                     secondary: Colors.white,
                  //                     brightness: Brightness.light,
                  //                     tertiary: Colors.white,
                  //                     surfaceTint: Colors.white,
                  //                     surfaceContainer: Colors.white,
                  //                     primaryContainer: Colors.white,
                  //                     seedColor: Colors.white,
                  //                     primary: Colors.black,
                  //                   )),
                  //                   child: child!,
                  //                 );
                  //               });
                  //           if (picked != null)
                  //             setState(() {
                  //               finaldata = picked;
                  //             });
                  //         },
                  //         child:
                  //             Image.asset("assets/icons/calendar_month.png"))),
                ]),
              ),
              Center(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: customercard.length,
                    itemBuilder: (context, index) {
                      return Customercontainer(card: customercard[index]);
                    }),
              )
            ]),
      ),
    );
  }

  Widget appoinment_Request(date) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 30,
        height: 240,
        // color: Colors.black,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [const BoxShadow(color: Colors.grey, blurRadius: 3)],
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 20,
              height: 60,

              decoration: const BoxDecoration(
                  color: Color.fromRGBO(70, 149, 184, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(9),
                      topRight: Radius.circular(9))),
              // color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Appointment Request",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Image.asset("assets/icons/schedule.png"),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(
                          date,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.more_horiz_outlined,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 12,
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
              width: 50,
            ),
            const Text(
              "AJAY KUMAR (608MRC)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Image.asset("assets/icons/mid.png"),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 7,
                    ),
                    RichText(
                      text: const TextSpan(
                          text: "VLLC:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.black),
                          children: [
                            TextSpan(
                              text: "Pollachi",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            )
                          ]),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    RichText(
                      text: const TextSpan(
                          text: "NO:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.black),
                          children: [
                            TextSpan(
                              text: "04,ABC Street,Pollachi,CBE",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            )
                          ]),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text("Tamil Nadu,TN-636 000,")
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(height: 40),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(150, 34),
                            backgroundColor:
                                const Color.fromRGBO(235, 239, 250, 1)),
                        onPressed: () {},
                        child: const Text(
                          "DECLINE",
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(height: 40),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(150, 34),
                            backgroundColor:
                                const Color.fromRGBO(70, 149, 184, 1)),
                        onPressed: () {},
                        child: const Text(
                          "ACCEPT",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _pickDate(String data) async {
    DateTime date = DateTime.parse(data);
    String formattedDate =
        (DateFormat('MMMM  dd, yyyy').format(date)).toUpperCase();

    finaldata = formattedDate;
  }

  calendar() {
    return Positioned(
      bottom: 40,
      left: 20,
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
            width: MediaQuery.of(context).size.width - 50),
        child: HorizontalCalendar(
          date: DateTime.now(),
          initialDate: DateTime.now(),
          textColor: Colors.black,
          backgroundColor: Colors.white,
          selectedColor: const Color.fromRGBO(70, 149, 184, 1),
          // showMonth: true,
          locale: Localizations.localeOf(context),
          onDateSelected: (date) {
            _pickDate(date.toString());
            setState(() {});
          },
        ),
      ),
    );
  }
}
