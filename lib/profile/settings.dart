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
      listofprofile("Manage Password", "password", "assets/icons/lock.png", () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Managepassword(
                      pass: pass,
                    )));
      }),
      line(context),
      listofprofile(
          "Preferences", "Manage Preferences", "assets/icons/person_2.png", () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Preferences()));
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
              height: 200,
              width: 450,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.close,
                          size: 18,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'You are attempting to logout',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const Text(
                    'Are you Sure?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                            prefs.setBool("isLoggedIn", true);
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
