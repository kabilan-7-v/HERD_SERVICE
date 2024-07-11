import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      const SizedBox(
        height: 50,
      ),
      const Row(
        children: [
          BackButton(),
          SizedBox(
            width: 10,
          ),
          Text(
            "Profile",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      const Text(
        "25DCOMI",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      const Text(
        "Dr.k.Ram Kumar",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      listofprofile("Name", "k.Ram Kumar", "assets/icons/person_2.png", () {}),
      line(context),
      listofprofile(
          "Phone Number", "96334567802", "assets/icons/call.png", () {}),
      line(context),
      listofprofile(
          "Mail ID", "abcdoctor@gmail.com", "assets/icons/mail.png", () {}),
      line(context),
      listofprofile(
          "Member Since", "Octomber 2023", "assets/icons/trophy.png", () {}),
      line(context),
      listofprofile("Request Change", "Request Change",
          "assets/icons/published_with_changes.png", () {}),
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
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  subtext,
                  style: const TextStyle(height: 0),
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
