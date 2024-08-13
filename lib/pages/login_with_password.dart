// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

import 'package:herd_service/models/loginmodels.dart';
import 'package:herd_service/pages/Homepage.dart';

import 'package:herd_service/pages/Loginpage.dart';
import 'package:herd_service/pages/forgetpassword.dart';
import 'package:herd_service/server/api.dart';
import 'package:provider/provider.dart';

class LoginWithPassword extends StatefulWidget {
  const LoginWithPassword({super.key});

  @override
  State<LoginWithPassword> createState() => _LoginWithPasswordState();
}

class _LoginWithPasswordState extends State<LoginWithPassword> {
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ScrollController _scrollcontroller = ScrollController();
  bool isloading = false;
  bool phonecheck = false;

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
              Custom_Textfield(
                  context,
                  Image.asset("assets/icons/person_2.png"),
                  "Enter Email/Phone Number",
                  "Please enter email/phonenumber",
                  _emailController),
              SizedBox(
                height: 20,
              ),
              Custom_Textfield(
                  context,
                  Image.asset("assets/icons/lock.png"),
                  "Enter Password",
                  "Please enter Password",
                  _passwordController),
              SizedBox(
                height: 10,
              ),
              click_text("Sign in using user ID", () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Loginpage()));
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
              SizedBox(
                height: 40,
              ),
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

  Widget click_button(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width - 50, height: 50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(520, 34),
            backgroundColor: Color.fromRGBO(70, 149, 184, 1)),
        onPressed: () async {
          if (!_key.currentState!.validate()) return;

          print("awerzextrfycgvhkbj lk;lqwrzextrcfgvjhjwzrdxfghg jnsdf");

          // Use `listen: false` here to avoid the error
          setState(() {
            isloading = true;
          });
          if (!custom_phoneno_checker(_emailController.text)) {
            await Login_with_email_or_phone(
                context, _emailController.text, _passwordController.text);
            final validate =
                await Provider.of<Login_email>(context, listen: false).Validate;
            if (validate) {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Homepage()));
            } else {
              if (Provider.of<Login_email>(context, listen: false)
                  .emailchecker) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                          'Please enter the correct Email or Phonenumber')),
                );
              } else if (Provider.of<Login_email>(context, listen: false)
                  .passwordchecker) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please enter correct password')),
                );
              }
            }
          } else {
            await Login_with_phone(
                context, _emailController.text, _passwordController.text);
            final validate =
                await Provider.of<Login_phone>(context, listen: false).Validate;
            if (validate) {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Homepage()));
            } else {
              if (Provider.of<Login_phone>(context, listen: false)
                  .phonechecker) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please check the phonenumber')),
                );
              } else if (Provider.of<Login_phone>(context, listen: false)
                  .passwordchecker) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please enter correct password')),
                );
              }
            }
          }
          setState(() {
            isloading = false;
          });
        },
        child: Center(
            child: isloading == false
                ? Text(
                    "SIGN IN",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                : CircularProgressIndicator()),
      ),
    );
  }

  custom_phoneno_checker(String text) {
    String seen = "1234567890";
    if (text.length < 10 || text.length > 10) {
      return false;
    }
    for (int i = 0; i < text.length; i++) {
      if (!seen.contains(text[i])) {
        return false;
      }
    }
    return true;
  }
}
