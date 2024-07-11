// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class Managepassword extends StatelessWidget {
  const Managepassword({super.key});

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
            "Manage Password",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      Custom_Textfield(
          context, const Icon(Icons.lock_outlined), "Enter Current Password"),
      Custom_Textfield(
          context, const Icon(Icons.lock_outlined), "New Password"),
      Custom_Textfield(
          context, const Icon(Icons.lock_outlined), "confirm Password"),
      const SizedBox(
        height: 55,
      ),
      click_button(
        context,
      ),
    ]));
  }

  Widget click_button(
    BuildContext context,
  ) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width - 50, height: 50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(520, 34),
            backgroundColor: const Color.fromRGBO(70, 149, 184, 1)),
        onPressed: () {},
        child: const Center(
            child: Text(
          "Change Password",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        )),
      ),
    );
  }

  Widget Custom_Textfield(BuildContext context, icon, hinttext) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(9),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8)),
        width: MediaQuery.of(context).size.width - 40,
        height: 60,
        child: Center(
          child: TextField(
            onTapOutside: (event) {},
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "   " + hinttext,
                hintStyle: const TextStyle(color: Colors.black54, fontSize: 16),
                prefixIcon: icon),
          ),
        ),
      ),
    );
  }
}
