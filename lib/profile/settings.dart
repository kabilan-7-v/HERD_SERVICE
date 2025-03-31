import 'package:flutter/material.dart';
import 'package:herd_service/models/loginmodels.dart';
import 'package:herd_service/pages/Loginpage.dart';
import 'package:herd_service/profile/managepassword.dart';
import 'package:herd_service/profile/preferences.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settingspage extends StatelessWidget {
  const Settingspage({super.key, required this.pass});
  final String pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 40,
          backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
          scrolledUnderElevation: 0,
          title: Text(
            "Settings",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
        body: Column(children: [
          listofprofile("Manage Password", "password", "assets/icons/lock.png",
              () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Managepassword(
                          pass: pass,
                        )));
          }),
          line(context),
          listofprofile(
              "Preferences", "Manage Preferences", "assets/icons/person_2.png",
              () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Preferences()));
          }),
          line(context),
          listofprofile("Logout", "", "assets/icons/logout.png", () {
            showlogout(context);
          }),
          line(context),
        ]));
  }

  showlogout(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              height: 180,
              width: 450,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'You are attempting to logout',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Are you Sure?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                            ////////////////////////////////////// shared preferenec userdata set///////////////////////////////
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setBool("isLoggedIn", false);
                            await context
                                .read<Login_id>()
                                .Loginupdate_id(false, false, false);
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
        });
  }

  Widget listofprofile(String text, String subtext, String imageurl, ontap) {
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
            Image.asset(imageurl),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                text == "Logout"
                    ? SizedBox()
                    : Text(
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
      width: MediaQuery.of(context).size.width - 30,
      color: Colors.black,
    );
  }
}
