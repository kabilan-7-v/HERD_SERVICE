// ignore_for_file: non_constant_identifier_names, sort_child_properties_last, deprecated_member_use

import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:herd_service/models/customercard.dart';
import 'package:herd_service/models/homemodel.dart';
import 'package:herd_service/pages/adddetails.dart';

import 'package:herd_service/pages/enterdetails.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Appoinmentrequest extends StatefulWidget {
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
    required this.card,
  });
  final Customercard card;
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
  State<Appoinmentrequest> createState() => _AppoinmentrequestState();
}

class _AppoinmentrequestState extends State<Appoinmentrequest> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        leadingWidth: 40,
        title: Text(
          "Appoinment Request",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(70, 149, 184, 1),
      ),
      backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SafeArea(
            right: true,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                      width: MediaQuery.of(context).size.width - 25,
                      height: 150,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          // ignore: prefer_const_literals_to_create_immutables
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, blurRadius: 3),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 2),
                            child: Text(
                              widget.card.name,
                              style: const TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              widget.card.vllc,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 13,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.card.address,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset("assets/icons/call.png"),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          widget.card.phonenumber,
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                            width: 15,
                                            child: Image.asset(
                                                "assets/icons/calendar_month.png")),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          widget.card.date +
                                              "  " +
                                              widget.card.time,
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                ),
                (widget.card.level) == "mid"
                    ? Positioned(
                        right: 40,
                        top: 40,
                        child: Container(
                          width: 45,
                          height: 25,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                width: 2,
                                color: const Color.fromRGBO(242, 160, 36, 1),
                                style: BorderStyle.solid,
                              ),
                              color: Colors.white),
                          child: const Center(
                              child: Text(
                            "Mid",
                            style: TextStyle(
                                fontSize: 11,
                                color: Color.fromRGBO(242, 160, 36, 1),
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      )
                    : widget.card.level == "low"
                        ? Positioned(
                            right: 40,
                            top: 40,
                            child: Container(
                              width: 65,
                              height: 45,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  border: Border.all(
                                    width: 3,
                                    color: const Color.fromRGBO(0, 105, 61, 1),
                                    style: BorderStyle.solid,
                                  ),
                                  color: Colors.white),
                              child: const Center(
                                  child: Text(
                                "Low",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromRGBO(0, 105, 61, 1),
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          )
                        : widget.card.level == "high"
                            ? Positioned(
                                right: 40,
                                top: 40,
                                child: Container(
                                  width: 45,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.red,
                                        style: BorderStyle.solid,
                                      ),
                                      color: Colors.white),
                                  child: const Center(
                                      child: Text(
                                    "High",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              )
                            : SizedBox(),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 25,
            height: 150,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                // ignore: prefer_const_literals_to_create_immutables
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(color: Colors.grey, blurRadius: 3),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Text(
                    "Comments:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text(
                    widget.comment,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: List.generate(
                150,
                (index) => Expanded(
                      child: Container(
                        color:
                            index % 2 == 0 ? Colors.transparent : Colors.grey,
                        height: 2,
                      ),
                    )),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              socialMedia(Bootstrap.whatsapp, () {
                whatsapp(widget.phonenumber);
              }),
              socialMedia(Bootstrap.send, () async {}),
              socialMedia(Bootstrap.telephone, () async {
                await _callNumber(widget.phonenumber);
              }),
            ],
          ),
          Spacer(),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: BlinkText('Slide to Complete',
                style: TextStyle(fontSize: 14.0, color: Colors.black),
                endColor: Colors.grey,
                duration: Duration(seconds: 1)),
          ),
          GestureDetector(
            onPanUpdate: (details) {
              // Swiping in left direction.
              if (details.delta.dx > 6) {
                if (Provider.of<userprofiledetails>(context, listen: false)
                        .type_of_user ==
                    1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Adddetails(
                                ticketid: widget.ticket_id,
                                cowid: widget.Straw_no.toString(),
                                farmerid: widget.bull_type.toString(),
                                docid: Provider.of<userprofiledetails>(context,
                                        listen: false)
                                    .doctor_id
                                    .toString(),
                              )));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Enterdetails(
                                Straw_no: widget.Straw_no,
                                bull_type: widget.bull_type,
                                ticket_id: widget.ticket_id,
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
