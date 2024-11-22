// import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
// import 'package:herd_service/pages/enterdetails.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Ticketshow extends StatefulWidget {
  Ticketshow(
      {super.key,
      required this.date,
      required this.time,
      required this.name,
      required this.priority,
      required this.vllc,
      required this.street,
      required this.comment,
      required this.status});
  final String date;
  final String time;
  final String name;
  final String priority;
  final String vllc;
  final String street;
  final String comment;
  final int status;

  @override
  State<Ticketshow> createState() => _TicketshowState();
}

class _TicketshowState extends State<Ticketshow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
          ),
          leadingWidth: 40,
          title: Text(
            "Show Ticket",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: const Color.fromRGBO(70, 149, 184, 1),
        ),
        backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              Stack(
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
                                widget.name,
                                style: const TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                widget.vllc,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.street,
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
                                            widget.name,
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
                                            widget.date + "  " + widget.time,
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
                  (widget.priority) == "mid"
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
                      : widget.priority == "low"
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
                                      color:
                                          const Color.fromRGBO(0, 105, 61, 1),
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
                          : widget.priority == "high"
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
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width - 30,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    // ignore: prefer_const_literals_to_create_immutables
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(color: Colors.grey, blurRadius: 3),
                    ]),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            "Date:",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            widget.date,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            "Time:",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            widget.time,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        child: Text(
                          "Comments:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
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
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: List.generate(
                    150,
                    (index) => Expanded(
                          child: Container(
                            color: index % 2 == 0
                                ? Colors.transparent
                                : Colors.grey,
                            height: 2,
                          ),
                        )),
              ),
            ])));
  }

  custom_container(BuildContext context) {
    return Container(
      height: 130,
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
                      text: widget.name,
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
                Text("VLCC:" + widget.vllc),
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
                Text(widget.street),
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
            child: Text(widget.comment),
          )
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

  _callNumber(String phoneNumber) async {
    String number = phoneNumber;
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  whatsapp() async {
    var contact = "+91 9976082664";
    var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
    // var iosUrl =
    //     "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

    try {
      await launchUrl(Uri.parse(androidUrl));
    } on Exception {}
  }
}
