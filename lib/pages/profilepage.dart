// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:herd_service/profile/about.dart';
import 'package:herd_service/profile/notification.dart';
import 'package:herd_service/profile/profile.dart';
import 'package:herd_service/profile/settings.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 160,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, blurRadius: 4)
                      ]),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dr.k.Ram Kumar MD.MS",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text("DOCOO54"),
                      Text("Pollachi")
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            listofprofile("Ticket History", "assets/icons/history.png", () {}),
            line(context),
            listofprofile("Notification", "assets/icons/notifications.png", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Notificationpage()));
            }),
            line(context),
            listofprofile("Settings", "assets/icons/settings.png", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Settingspage()));
            }),
            line(context),
            listofprofile("About", "assets/icons/report.png", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Aboutpage()));
            }),
            const SizedBox(
              height: 30,
            ),
            Logoutbutton()
          ],
        ),
      ),
    );
  }

  Widget listofprofile(String text, String imageurl, ontap) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 20,
            ),
            Image.asset(imageurl),
            const SizedBox(
              width: 10,
            ),
            Text(text),
            const Spacer(),
            Image.asset("assets/icons/chevron_right.png"),
            const SizedBox(
              width: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget Logoutbutton() {
    return InkWell(
      onTap: () {},
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
    );
  }

  Widget line(BuildContext context) {
    return Container(
      height: 0.5,
      width: MediaQuery.of(context).size.width - 60,
      color: Colors.black,
    );
  }
}
