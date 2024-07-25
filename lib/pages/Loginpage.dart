// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:herd_service/pages/Homepage.dart';
import 'package:herd_service/pages/forgetpassword.dart';
import 'package:herd_service/pages/login_with_password.dart';
import 'package:herd_service/server/test.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ScrollController _scrollcontroller = ScrollController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      controller: _scrollcontroller,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: _key,
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
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Custom_Textfield(context, Icon(Icons.person_2_outlined),
                  "Enter User ID", "Please Enter User ID", _emailController),
              SizedBox(
                height: 20,
              ),
              Custom_Textfield(context, Icon(Icons.lock), "Enter Password",
                  "Please Enter Password", _passwordController),
              SizedBox(
                height: 10,
              ),
              click_text("Instead sign in using email/Phone Number", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginWithPassword()));
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
      ),
    ));
  }

  Widget Custom_Textfield(
      BuildContext context, icon, hinttext, String errormessage, _controller) {
    return Center(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width - 35,
        child: TextFormField(
          controller: _controller,
          validator: (value) {
            if (value!.isEmpty) return errormessage;
            return null;
          },
          onTap: () async {
            await Future.delayed(Duration(milliseconds: 300));

            _scrollcontroller.animateTo(400,
                duration: Duration(milliseconds: 100), curve: Curves.linear);
          },
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              hintText: "   " + hinttext,
              hintStyle: TextStyle(color: Colors.grey[600], fontSize: 18),
              prefixIcon: icon),
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
        onPressed: () async {
          // print(await postdata());
          // await fetchdata(_emailController.text);
          if (!_key.currentState!.validate()) return;
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Homepage()));

          if (await fetchdata(_emailController.text)) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Homepage()));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Invalid Email or Password"),
            ));
          }
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
