// ignore_for_file: non_constant_identifier_names, sort_child_properties_last, deprecated_member_use

import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:herd_service/models/homemodel.dart';
import 'package:herd_service/pages/adddetails.dart';

import 'package:herd_service/pages/enterdetails.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Appoinmentrequest extends StatelessWidget {
  const Appoinmentrequest({
    super.key,
    required this.date,
    required this.name,
    required this.priority,
    required this.vllc,
    required this.street,
    required this.comment,
    required this.time,
    required this.phonenumber,
    required this.ticket_id,
    required this.doc_type,
    required this.Straw_no,
    required this.bull_type,
  });
  final String date;
  final String time;
  final String name;
  final bool priority;
  final String vllc;
  final String street;
  final String comment;
  final String phonenumber;
  final String ticket_id;
  final String doc_type;
  final int Straw_no;
  final int bull_type;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    print(height);
    print("object");
    return Scaffold(
      body: height <= 500
          ? custom_size_change(context, height)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          "assets/img/bluebackground.png",
                          fit: BoxFit.cover,
                        )),
                    const Positioned(
                      left: 10,
                      top: 50,
                      child: BackButton(
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 60,
                      child: Text(
                        "Appointment Request",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                    Positioned(
                      bottom: 120,
                      left: 100,
                      child: Text(
                        date,
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      bottom: 90,
                      left: 100,
                      child: Text(
                        time,
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                priority == true
                    ? const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child: Text(
                          "Mid Priority",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color.fromRGBO(176, 107, 5, 1)),
                        ),
                      )
                    : const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child: Text(
                          "Low Priority",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color.fromRGBO(5, 176, 39, 1)),
                        ),
                      ),
                custom_container(context),
                comment_container(context),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    socialMedia(Bootstrap.whatsapp, () {
                      whatsapp(phonenumber);
                    }),
                    socialMedia(Bootstrap.send, () async {}),
                    socialMedia(Bootstrap.telephone, () async {
                      await _callNumber(phonenumber);
                    }),
                  ],
                ),
                Spacer(),
                const Center(
                  child: BlinkText('Slide to Complete',
                      style: TextStyle(fontSize: 14.0, color: Colors.black),
                      endColor: Colors.grey,
                      duration: Duration(seconds: 2)),
                ),
                Spacer(),
                GestureDetector(
                  onPanUpdate: (details) {
                    // Swiping in left direction.
                    if (details.delta.dx > 0) {
                      print(Provider.of<userprofiledetails>(context,
                              listen: false)
                          .type_of_user);
                      if (Provider.of<userprofiledetails>(context,
                                  listen: false)
                              .type_of_user ==
                          1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Adddetails()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Enterdetails(
                                      Straw_no: Straw_no,
                                      bull_type: bull_type,
                                      ticket_id: ticket_id,
                                    )));
                      }
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "SERVICE COMPLETED",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Image.asset("assets/img/swipe_up.png")
                        ],
                      ),
                    )),
                    color: const Color.fromRGBO(70, 149, 184, 1),
                  ),
                ),
              ],
            ),
    );
  }

  custom_size_change(BuildContext context, height) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Stack(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/img/bluebackground.png",
                    fit: BoxFit.cover,
                  )),
              const Positioned(
                left: 10,
                top: 50,
                child: BackButton(
                  color: Colors.white,
                ),
              ),
              Positioned(
                top: 60,
                left: 60,
                child: Text(
                  "Appointment Request",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Positioned(
                bottom: 120,
                left: 100,
                child: Text(
                  date,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                bottom: 90,
                left: 100,
                child: Text(
                  time,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          priority == true
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Text(
                    "Mid Priority",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Color.fromRGBO(176, 107, 5, 1)),
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Text(
                    "Low Priority",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Color.fromRGBO(176, 107, 5, 1)),
                  ),
                ),
          custom_container(context),
          comment_container(context),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              socialMedia(Bootstrap.whatsapp, () {
                whatsapp(phonenumber);
              }),
              socialMedia(Bootstrap.send, () async {}),
              socialMedia(Bootstrap.telephone, () async {
                await _callNumber(phonenumber);
              }),
            ],
          ),
          SizedBox(
            height: (height / 14),
          ),
          const Center(
            child: BlinkText('Slide to Complete',
                style: TextStyle(fontSize: 14.0, color: Colors.black),
                endColor: Colors.grey,
                duration: Duration(seconds: 2)),
          ),
          GestureDetector(
            onPanUpdate: (details) {
              // Swiping in left direction.
              if (details.delta.dx > 0) {
                print(Provider.of<userprofiledetails>(
                  context,
                ).type_of_user);
                if (Provider.of<userprofiledetails>(
                      context,
                    ).type_of_user ==
                    2) {}
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Adddetails()));

                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => Enterdetails(
                //               Straw_no: Straw_no,
                //               bull_type: bull_type,
                //               ticket_id: ticket_id,
                //             )));
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "SERVICE COMPLETED",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Image.asset("assets/img/swipe_up.png")
                  ],
                ),
              )),
              color: const Color.fromRGBO(70, 149, 184, 1),
            ),
          ),
        ],
      ),
    );
  }

  custom_container(BuildContext context) {
    return Container(
      height: 110,
      width: MediaQuery.of(context).size.width - 30,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          // ignore: prefer_const_literals_to_create_immutables
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 3),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(1.0),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  TextSpan(text: "(608MRC)")
                ])),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(1.0),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text("VLCC: $vllc"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(1.0),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(street),
              ],
            ),
          ),
        ],
      ),
    );
  }

  comment_container(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width - 30,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          // ignore: prefer_const_literals_to_create_immutables
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 3),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(1.0),
            child: const Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "Comment",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ])),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(comment),
          ),
        ],
      ),
    );
  }

  socialMedia(BootstrapIconData icon, ontap) {
    return InkWell(
      onTap: ontap,
      child: Stack(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              // border: Border.all(),
              boxShadow: [
                BoxShadow(
                  blurRadius: 0.5,
                  color: Colors.black.withOpacity(0.2),
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Positioned(
            top: 5,
            left: 5,
            child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  // border: Border.all(),
                  color: Color.fromRGBO(70, 149, 184, 1),
                  borderRadius: BorderRadius.circular(45),
                )),
          ),
          Positioned(
            top: 17,
            left: 18,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  custom_time_formmat(String val) {
    String timestamp = val;
    DateTime dateTime = DateTime.parse(timestamp);

    // Format the time with AM/PM
    String formattedTime = DateFormat('hh:mm:ss a').format(dateTime);

    return formattedTime; // Output: 12 AUG 2024
  }

  _callNumber(String phoneNumber) async {
    String number = phoneNumber;
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  whatsapp(val) async {
    var contact = val;
    var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
    // var iosUrl =
    //     "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

    try {
      await launchUrl(Uri.parse(androidUrl));
    } on Exception {
      print("object");
    }
  }
}
