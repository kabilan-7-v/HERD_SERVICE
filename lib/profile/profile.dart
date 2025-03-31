import 'package:flutter/material.dart';

import 'package:herd_service/models/homemodel.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 40,
          backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
          scrolledUnderElevation: 0,
          title: Text(
            "Profile",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
        body: Column(children: [
          listofprofile("Name", context.watch<userprofiledetails>().username,
              Icons.person_2_outlined, () {}),
          line(context),
          listofprofile(
              "Phone Number",
              Provider.of<userprofiledetails>(context, listen: false).phoneno,
              Icons.phone,
              () {}),
          line(context),
          listofprofile("Mail ID", context.watch<userprofiledetails>().email,
              Icons.mail, () {}),
          line(context),
          listofprofile(
              "Member Since", "Octomber 2023", Bootstrap.trophy, () {}),
          line(context),
          listofprofile1(
              "Request Change", "Request Change", Bootstrap.activity, () {}),
          line(context),
        ]));
  }

  Widget listofprofile(String text, String subtext, IconData icon, ontap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 20,
          ),
          Icon(icon),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                subtext,
                style: const TextStyle(height: 0),
              ),
            ],
          ),
          const Spacer(),
          const SizedBox(
            width: 30,
          )
        ],
      ),
    );
  }

  Widget listofprofile1(String text, String subtext, IconData icon, ontap) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 20,
            ),
            Icon(icon),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
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
      width: MediaQuery.of(context).size.width - 30,
      color: Colors.black,
    );
  }
}
