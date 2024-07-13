// ignore_for_file: non_constant_identifier_names, sort_child_properties_last

import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';

import 'package:herd_service/pages/enterdetails.dart';

class Appoinmentrequest extends StatelessWidget {
  const Appoinmentrequest({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
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
                const Positioned(
                  top: 65,
                  left: 60,
                  child: Text(
                    "Appointment Request",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Positioned(
                  bottom: 120,
                  left: 100,
                  child: Text(
                    "25 JUN 20024,",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Positioned(
                  bottom: 90,
                  left: 100,
                  child: Text(
                    "8am-10am",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Text(
                "Mid Priority",
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
                Image.asset("assets/img/whataappshare.png"),
                Image.asset("assets/img/sent.png"),
                Image.asset("assets/img/call1.png"),
              ],
            ),
            SizedBox(
              height: (height / 18),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Enterdetails()));
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
      ),
    );
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
      child: const Column(
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
                      text: "AJAY KUMAR",
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
                Text("VLCC: Pollachi"),
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
                Text("NO:04, ABC Street, Pollachi, CBE "),
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
                Text("Tamil Nadu, TN-636 000."),
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
      child: const Column(
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
            padding: EdgeInsets.all(1.0),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text("Hello, Dr. Ram,"),
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
                Text("Ajay Kumar’s cow was sick"),
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
                Text("So, Kindly Pick up the problem & gave "),
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
                Text("Immediate treatment to that Cow."),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
