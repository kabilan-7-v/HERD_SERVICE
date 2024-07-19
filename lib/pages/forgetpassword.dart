import 'package:flutter/material.dart';

class Forgetpasswordpage extends StatelessWidget {
  const Forgetpasswordpage({super.key});

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
            const SizedBox(
              height: 43,
            ),
            Stack(
              children: [
                Image.asset("assets/img/background_doctor_blue.png"),
                Positioned(
                    top: 10,
                    left: 80,
                    child: Image.asset("assets/img/doctor.png")),
                const Positioned(
                  bottom: 40,
                  left: 80,
                  child: Text(
                    "FORGET PASSWORD",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Custom_Textfield(context, Image.asset("assets/icons/person_2.png"),
                "Enter Registered Mail"),
            const SizedBox(
              height: 120,
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
        margin: const EdgeInsets.all(9),
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

  Widget click_text(String text) {
    return InkWell(
        onTap: () {},
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 15, color: Color.fromRGBO(0, 176, 254, 1)),
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
            fixedSize: const Size(520, 34),
            backgroundColor: const Color.fromRGBO(70, 149, 184, 1)),
        onPressed: () {},
        child: const Center(
            child: Text(
          "Send",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        )),
      ),
    );
  }
}
