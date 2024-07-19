// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:herd_service/pages/Homepage.dart';
import 'package:herd_service/pages/forgetpassword.dart';
import 'package:herd_service/pages/login_with_password.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            SizedBox(
              height: 43,
            ),
            Stack(
              children: [
                Image.asset("assets/img/background_doctor_blue.png"),
                Positioned(
                    top: 10,
                    left: 80,
                    child: Image.asset("assets/img/doctor.png")),
                Positioned(
                  bottom: 65,
                  left: 150,
                  child: Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Custom_Textfield(context, Image.asset("assets/icons/person_2.png"),
                "Enter User ID"),
            Custom_Textfield(context, Image.asset("assets/icons/lock.png"),
                "Enter Password"),
            SizedBox(
              height: 10,
            ),
            click_text("Instead sign in using email/Phone Number", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginWithPassword()));
            }),
            SizedBox(
              height: 10,
            ),
            Center(
                child: click_text("Forget Password", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Forgetpasswordpage()));
            })),
            SizedBox(
              height: 50,
            ),
            click_button(context),
          ],
        ),
      ),
    ));
  }

  Widget Custom_Textfield(BuildContext context, icon, hinttext) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(9),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8)),
        width: MediaQuery.of(context).size.width - 40,
        height: 60,
        child: Center(
          child: TextField(
            onTapOutside: (event) {},
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "   " + hinttext,
                hintStyle: TextStyle(color: Colors.grey[600], fontSize: 18),
                prefixIcon: icon),
          ),
        ),
      ),
    );
  }

  Widget click_text(String text, ontap) {
    return InkWell(
        onTap: ontap,
        child: Text(
          text,
          style: TextStyle(fontSize: 15, color: Color.fromRGBO(0, 176, 254, 1)),
        ));
  }

  Widget click_button(
    BuildContext context,
  ) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width - 50, height: 50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(520, 34),
            backgroundColor: Color.fromRGBO(70, 149, 184, 1)),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Homepage()));
        },
        child: Center(
            child: Text(
          "SIGN IN",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        )),
      ),
    );
  }
}
