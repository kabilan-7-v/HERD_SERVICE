import 'package:flutter/material.dart';

class Aboutpage extends StatelessWidget {
  const Aboutpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                "About",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
          listofprofile("Privacy and Policy", () {}),
          line(context),
          listofprofile("Terms and Condition", () {}),
          line(context),
          listofprofile("Software licence", () {}),
          line(context),
        ],
      ),
    );
  }

  Widget listofprofile(String text, ontap) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 40,
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

  Widget line(BuildContext context) {
    return Container(
      height: 0.5,
      width: MediaQuery.of(context).size.width - 60,
      color: Colors.black,
    );
  }
}
