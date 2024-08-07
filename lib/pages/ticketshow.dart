// import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
// import 'package:herd_service/pages/enterdetails.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Ticketshow extends StatelessWidget {
  const Ticketshow({super.key});

  @override
  Widget build(BuildContext context) {
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
                  top: 60,
                  left: 60,
                  child: Text(
                    "Ticket",
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
    } on Exception {
      print("object");
    }
  }
}
