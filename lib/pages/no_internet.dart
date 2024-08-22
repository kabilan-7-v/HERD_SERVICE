import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class NoInternetchecker extends StatefulWidget {
  const NoInternetchecker({super.key});

  @override
  State<NoInternetchecker> createState() => _NoInternetcheckerState();
}

class _NoInternetcheckerState extends State<NoInternetchecker> {
  @override
  Widget build(BuildContext context) {
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
                          onPressed: () {},
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
