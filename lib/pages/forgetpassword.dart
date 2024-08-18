import 'package:flutter/material.dart';
import 'package:herd_service/pages/reset_password_token.dart';
import 'package:herd_service/server/forgetpassword_api.dart';

class Forgetpasswordpage extends StatefulWidget {
  const Forgetpasswordpage({super.key});

  @override
  State<Forgetpasswordpage> createState() => _ForgetpasswordpageState();
}

class _ForgetpasswordpageState extends State<Forgetpasswordpage> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: _key,
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
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Custom_Textfield(
                  context,
                  Image.asset("assets/icons/person_2.png"),
                  "Enter Registered Mail"),
              const SizedBox(
                height: 120,
              ),
              click_button(context),
            ],
          ),
        ),
      ),
    ));
  }

  Widget Custom_Textfield(BuildContext context, icon, hinttext) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 90,
        child: Center(
          child: TextFormField(
            controller: _emailController,
            validator: (value) {
              if (value!.isEmpty) return "please enter a email";

              return null;
            },
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                hintText: "   " + hinttext,
                hintStyle: TextStyle(color: Colors.grey[600], fontSize: 18),
                prefixIcon: icon),
          ),
        ),
      ),
    );
  }

  // Widget click_text(String text) {
  //   return InkWell(
  //       onTap: () {},
  //       child: Text(
  //         text,
  //         style: const TextStyle(
  //             fontSize: 15, color: Color.fromRGBO(0, 176, 254, 1)),
  //       ));
  // }

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
        onPressed: () {
          if (!_key.currentState!.validate()) return;

          forget_password_api(context, _emailController.text);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => ResetPasswordToken()));
        },
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
