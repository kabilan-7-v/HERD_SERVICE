import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:herd_service/models/homemodel.dart';
import 'package:herd_service/server/home_api.dart';
import 'package:provider/provider.dart';

class Otppage extends StatefulWidget {
  const Otppage({super.key});

  @override
  State<Otppage> createState() => _OtppageState();
}

class _OtppageState extends State<Otppage> {
  bool isbutton = false;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    "Close Ticket",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(child: Text("Enter OTP to close the Ticket")),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: OtpTextField(
                  borderWidth: 3,
                  borderColor: Colors.black,
                  numberOfFields: 5,
                  fieldWidth: 60,
                  fieldHeight: 50,
                  enabledBorderColor: Colors.black,
                  disabledBorderColor: Colors.black,
                  focusedBorderColor: Colors.black,
                  keyboardType: TextInputType.number,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onSubmit: (value) {
                    isbutton = true;
                    setState(() {});
                  },

                  //runs when every textfield is filled
                  // end onSubmit
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                child: Text(
                  "Instructions:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                child: Text(
                    "1. The OTP feature prevents some forms of identity theft by making sure that a captured "),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                child: Text(
                    "2. username/password pair cannot be used a second time. "),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                child: Text(
                    "3. Typically the user's login name stays the same, and the one-time password changes with each login."),
              ),
              const SizedBox(
                height: 140,
              ),
              SizedBox(
                height: 100,
              ),
              isbutton == true ? click_button(context) : const SizedBox()
            ]),
          )),
    );
  }

  Widget click_button(
    BuildContext context,
  ) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
            width: MediaQuery.of(context).size.width - 50, height: 50),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(520, 34),
              backgroundColor: const Color.fromRGBO(70, 149, 184, 1)),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
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
                              child: Icon(
                                Icons.close,
                                size: 18,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'You are attempting to Close ticket',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const Text(
                          'Are you Sure?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
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
                                  // Add your upload logic here

                                  succes();
                                  // await Future.delayed(Duration(seconds: 2));
                                  // int count = 0;
                                  // Navigator.popUntil(
                                  //     context, (route) => count++ == 5);
                                  /////// go to stack first index /////
                                  // Navigator.popUntil(
                                  //   context, (route) => route.isFirst);
                                },
                                child: const Text(
                                  'Close Ticket',
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
              },
            );
          },
          child: const Center(
              child: Text(
            "Proceed",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          )),
        ),
      ),
    );
  }

  succes() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: 250,
            width: 450,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          Appoimentresquestapi(
                              context,
                              Provider.of<userprofiledetails>(context,
                                      listen: false)
                                  .doctor_id);
                          setState(() {});
                          Navigator.popUntil(context, (route) => count++ == 5);
                        },
                        icon: Icon(Icons.close)),
                  ],
                ),
                SizedBox(
                    width: 70,
                    height: 60,
                    child: Image.asset("assets/img/succes.gif")),
                SizedBox(
                  height: 5,
                ),
                const Text(
                  'Your Ticket has been',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Successfully Closed',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
