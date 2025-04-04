// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herd_service/blocs/app_bloc.dart';
import 'package:herd_service/blocs/app_events.dart';
import 'package:herd_service/models/loginmodels.dart';
import 'package:herd_service/pages/commonpage.dart';
import 'package:herd_service/pages/forgetpassword.dart';
import 'package:herd_service/pages/login_with_password.dart';
import 'package:herd_service/server/Login_api.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController _id = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ScrollController _scrollcontroller = ScrollController();
  bool isloading = false;
  bool? connect_internet;
  @override
  void initState() {
    // TODO: implement initState
    // change_current_to_assign(context, 4);

    get_internet();
    super.initState();
  }

  get_internet() async {
    bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      setState(() {
        connect_internet = isConnected;
      });
      print('Device is connected to the internet');
    } else {
      setState(() {
        connect_internet = isConnected;
      });
      print('Device is not connected to the internet');
    }
  }

  @override
  void dispose() {
    _id.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return connect_internet == false
        ? NoInternet_checker()
        : BlocProvider(
            create: (context) =>
                UserBloc(RepositoryProvider.of<UserRespository>(context))
                  ..add(LoadUserEvent()),
            child: Scaffold(
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
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Custom_Textfield(context, Icon(Icons.person_2_outlined),
                          "Enter User ID", "Please Enter User ID", _id),
                      SizedBox(
                        height: 20,
                      ),
                      Custom_Textfield(
                          context,
                          Icon(Icons.lock),
                          "Enter Password",
                          "Please Enter Password",
                          _passwordController),
                      SizedBox(
                        height: 10,
                      ),
                      click_text("Instead sign in using Email/Phone Number",
                          () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginWithPassword()));
                      }),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: click_text("Forget Password", () {
                        Navigator.pushReplacement(
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
            )),
          );
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
              hintText: hinttext,
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
          if (!_key.currentState!.validate()) return;
          setState(() {
            isloading = true;
          });
          // Call the login method and wait for it to complete
          await Login_with_Uid(context, _id.text, _passwordController.text);
          setState(() {
            isloading = false;
          });

          // Fetch the updated validation state
          final validate =
              Provider.of<Login_id>(context, listen: false).Validate;

          // Now check the validation and navigate accordingly
          if (validate) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Commonpage())); // Navigator.pushReplacementNamed(context, "/common");
          } else {
            if (Provider.of<Login_id>(context, listen: false).emailchecker) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Please check the id')),
              );
            } else if (Provider.of<Login_id>(context, listen: false)
                .passwordchecker) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Please enter correct password')),
              );
            }
          }
          // Handle validation failure (e.g., show a message)
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

  Widget NoInternet_checker() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 53,
              ),
              Stack(
                children: [
                  SizedBox(
                      height: 900,
                      width: 500,
                      child: Image.asset(
                        "assets/img/background_doctor_blue.png",
                        fit: BoxFit.cover,
                      )),
                  Positioned(
                      top: 60,
                      left: 120,
                      child: SizedBox(
                          child: Image.asset("assets/img/doctor.png"))),
                  Positioned(
                    bottom: 405,
                    left: 50,
                    child: Text(
                      "Please check your internet connectivity",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                      bottom: 370, left: 189, child: Icon(Bootstrap.wifi_off)),
                  Positioned(
                      bottom: 205,
                      left: 160,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(100, 34),
                              backgroundColor: Color.fromRGBO(18, 87, 39, 1)),
                          onPressed: () {
                            get_internet();
                          },
                          child: Text(
                            "Retry",
                            style: TextStyle(color: Colors.white),
                          ))),
                ],
              ),
            ]),
      ),
    );
  }
}
