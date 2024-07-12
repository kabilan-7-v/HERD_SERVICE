import 'package:flutter/material.dart';
import 'package:herd_service/profile/managepassword.dart';
import 'package:herd_service/profile/preferences.dart';

class Settingspage extends StatelessWidget {
  const Settingspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      SizedBox(
        height: 50,
      ),
      Row(
        children: [
          BackButton(),
          SizedBox(
            width: 10,
          ),
          Text(
            "Settings",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
      SizedBox(
        height: 10,
      ),
      listofprofile("Manage Password", "", "assets/icons/lock.png", () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Managepassword()));
      }),
      line(context),
      listofprofile(
          "Preferences", "Manage Preferences", "assets/icons/person_2.png", () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Preferences()));
      }),
      line(context),
      listofprofile("Logout", "", "assets/icons/logout.png", () {}),
      line(context),
    ]));
  }

  Widget listofprofile(String text, String subtext, String imageurl, ontap) {
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  subtext,
                  style: TextStyle(height: 0),
                ),
              ],
            ),
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

  Widget line(BuildContext context) {
    return Container(
      height: 0.5,
      width: MediaQuery.of(context).size.width - 60,
      color: Colors.black,
    );
  }
}
