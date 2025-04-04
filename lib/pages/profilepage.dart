// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herd_service/Local_data_user/doctor_details.dart';
import 'package:herd_service/models/homemodel.dart';
import 'package:herd_service/models/loginmodels.dart';
import 'package:herd_service/pages/Alertservices.dart';
import 'package:herd_service/pages/Loginpage.dart';
import 'package:herd_service/pages/tickethistory.dart';
import 'package:herd_service/profile/about.dart';
import 'package:herd_service/pages/notification.dart';
import 'package:herd_service/profile/profile.dart';
import 'package:herd_service/profile/settings.dart';
import 'package:herd_service/server/service_availability_api.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profilepage extends StatefulWidget {
  Profilepage({super.key, required this.pass});
  final String pass;

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  String finaldate = "select date";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    doctor_details_local_data(context);

    // get();
    super.initState();
  }

  // get() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('toogle_button', false);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Profile()));
                },
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 30,
                          height: 110,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(color: Colors.grey, blurRadius: 4)
                              ]),
                        ),
                        Positioned(
                          top: 16,
                          left: 135,
                          child: Text(
                            context.watch<userprofiledetails>().username,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          left: 1,
                          child: SizedBox(
                              height: 110,
                              width: 140,
                              child: Image.asset("assets/icons/profile.png")),
                        ),
                        Positioned(
                          top: 49,
                          left: 135,
                          child: Text(
                            context.watch<userprofiledetails>().email,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Positioned(
                          top: 69,
                          left: 135,
                          child: Text(
                            context.watch<userprofiledetails>().phoneno,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Positioned(
                            top: 32,
                            right: 10,
                            child: Icon(
                              Icons.keyboard_arrow_right_outlined,
                              size: 40,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Provider.of<service_availability>(context).toogle == true
                      ? SizedBox(
                          height: 32,
                          width: 32,
                          child:
                              Image.asset("assets/icons/account_circle 1.png"))
                      : SizedBox(
                          height: 32,
                          width: 32,
                          child: Image.asset(
                              "assets/icons/account_circle_off 2 (1).png")),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("Service Availability"),
                  const Spacer(),
                  CupertinoSwitch(
                    focusColor: Colors.black,
                    thumbColor: Colors.white,
                    // trackColor: Colors.black,
                    activeColor: const Color.fromRGBO(70, 149, 184, 1),
                    value: Provider.of<service_availability>(
                      context,
                    ).toogle,
                    onChanged: (value) async {
                      if (value == true) {
                        confirmation_popup(_scaffoldKey);
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Alertservices()));
                     
                      }
                    },
                  ),
                  // Image.asset("assets/icons/chevron_right.png"),
                  const SizedBox(
                    width: 30,
                  )
                ],
              ),
            ),
            line(context),
            listofprofile("Ticket History", Icons.timer_outlined,
                Icons.keyboard_arrow_right_outlined, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Tickethistory(
                            backbuttonverify: false,
                          )));
            }),
            line(context),
            listofprofile("Notification", Icons.notifications_active,
                Icons.keyboard_arrow_right_outlined, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Notificationpage(
                          doctor_id: Provider.of<userprofiledetails>(context,
                                  listen: false)
                              .doctor_id)));
            }),
            line(context),
            // listofprofile("Medicine", Icons.medical_information_outlined,
            //     Icons.keyboard_arrow_right_outlined, () {}),
            listofprofile(
                "Settings", Icons.settings, Icons.keyboard_arrow_right_outlined,
                () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Settingspage(
                            pass: widget.pass,
                          )));
            }),
            line(context),
            listofprofile("About", Icons.info_outlined,
                Icons.keyboard_arrow_right_outlined, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Aboutpage()));
            }),
            line(context),
          ],
        ),
      ),
    );
  }

  confirmation_popup(_scaffoldKey) {
    return showDialog(
        context: _scaffoldKey.currentContext,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              height: 160,
              width: 330,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "You are attempting to turn on the service",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Are you Sure?",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () async {
                      await Service_on(
                          context,
                          Provider.of<userprofiledetails>(context,
                                  listen: false)
                              .doctor_id);
                      setState(() {});
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 55,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromRGBO(70, 149, 184, 1)),
                      child: Center(
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget listofprofile(String text, IconData icon, IconData lasticon, ontap) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 20,
            ),
            Icon(
              icon,
              size: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(text),
            const Spacer(),
            Icon(lasticon),
            // Image.asset("assets/icons/chevron_right.png"),
            const SizedBox(
              width: 15,
            )
          ],
        ),
      ),
    );
  }

  Widget Logoutbutton(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 200,
                width: 450,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(
                            Icons.close,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'You are attempting to logout',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const Text(
                      'Are you Sure?',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints.tightFor(
                              height: 50, width: 200),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(218, 53, 53, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () async {
                              await context
                                  .read<Login_id>()
                                  .Loginupdate_id(false, false, false);
                              ////////////////////////////////////// shared preferenec userdata set///////////////////////////////
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setBool("isLoggedIn", false);
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Loginpage()),
                                (Route<dynamic> route) => false,
                              );

                              // Navigator.popUntil(
                              //     context, ModalRoute.withName('/Login'));
                              // Navigator.pushNamed(context, "/Login");
                            },
                            child: const Text(
                              'Log Out',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: InkWell(
        child: Container(
          width: 180,
          height: 50,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.black,
              )),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.logout),
              SizedBox(
                width: 3,
              ),
              Text("LogOut")
            ],
          ),
        ),
      ),
    );
  }

  Widget line(BuildContext context) {
    return Container(
      height: 0.5,
      width: MediaQuery.of(context).size.width - 45,
      color: Colors.black,
    );
  }
}
