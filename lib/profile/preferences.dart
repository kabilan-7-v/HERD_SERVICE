// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Preferences extends StatefulWidget {
  const Preferences({super.key});

  @override
  State<Preferences> createState() => _PreferencesState();
}

bool email_prmotion = false;
bool email_invoice = false;
bool allow_sms_invoice = false;
bool allow_promotion_sms = false;
bool allow_updates_whatsapp = false;
bool allow_Pushnotifications = false;

class _PreferencesState extends State<Preferences> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                  "Preferences",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            linetext("assets/icons/mail.png", "EMAIL"),
            const SizedBox(
              height: 10,
            ),
            ////////////////////email///////
            Container(
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          email_prmotion = !email_prmotion;
                          setState(() {});
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Allow emails for Promotions and offers"),
                        ),
                      ),
                      const Spacer(),
                      email_prmotion == true
                          ? InkWell(
                              onTap: () {
                                email_prmotion = false;
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child:
                                    Image.asset("assets/icons/check_box.png"),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                email_prmotion = true;
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                    "assets/icons/check_box_outline_blank.png"),
                              ),
                            )
                    ],
                  ),
                  line(context),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          email_invoice = !email_invoice;
                          setState(() {});
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Allow emails for invoice"),
                        ),
                      ),
                      const Spacer(),
                      email_invoice == true
                          ? InkWell(
                              onTap: () {
                                email_invoice = false;
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child:
                                    Image.asset("assets/icons/check_box.png"),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                email_invoice = true;
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                    "assets/icons/check_box_outline_blank.png"),
                              ),
                            )
                    ],
                  ),
                ],
              ),
            ),
            ////////// email

            const SizedBox(
              height: 40,
            ),
            linetext("assets/icons/whatsapp.png", "SMS & WHATSAPP"),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            allow_sms_invoice = !allow_sms_invoice;
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text("Allow emails for Promotions and offers"),
                        ),
                      ),
                      const Spacer(),
                      allow_sms_invoice == true
                          ? InkWell(
                              onTap: () {
                                allow_sms_invoice = false;
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child:
                                    Image.asset("assets/icons/check_box.png"),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                allow_sms_invoice = true;
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                    "assets/icons/check_box_outline_blank.png"),
                              ),
                            )
                    ],
                  ),
                  line(context),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          allow_promotion_sms = !allow_promotion_sms;
                          setState(() {});
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text("Allow promotional SMS offers"),
                        ),
                      ),
                      const Spacer(),
                      allow_promotion_sms == true
                          ? InkWell(
                              onTap: () {
                                allow_promotion_sms = false;
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child:
                                    Image.asset("assets/icons/check_box.png"),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                allow_promotion_sms = true;
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                    "assets/icons/check_box_outline_blank.png"),
                              ),
                            )
                    ],
                  ),
                  line(context),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            allow_updates_whatsapp = !allow_updates_whatsapp;
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text("Allow updates to be sent on whatsapp"),
                        ),
                      ),
                      const Spacer(),
                      allow_updates_whatsapp == true
                          ? InkWell(
                              onTap: () {
                                allow_updates_whatsapp = false;
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child:
                                    Image.asset("assets/icons/check_box.png"),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                allow_updates_whatsapp = true;
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                    "assets/icons/check_box_outline_blank.png"),
                              ),
                            )
                    ],
                  ),
                ],
              ),
            ),
            // allow_updates_whatsapp),
            const SizedBox(
              height: 40,
            ),
            linetext("assets/icons/notifications.png", "PUSH NOTIFICATION"),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        allow_Pushnotifications = !allow_Pushnotifications;
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text("Allow emails for Promotions and offers"),
                    ),
                  ),
                  const Spacer(),
                  allow_Pushnotifications == true
                      ? InkWell(
                          onTap: () {
                            allow_Pushnotifications = false;
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset("assets/icons/check_box.png"),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            allow_Pushnotifications = true;
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                                "assets/icons/check_box_outline_blank.png"),
                          ),
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget linetext(String imageurl, String text) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(imageurl),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget line(BuildContext context) {
    return Container(
      height: 0.7,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
    );
  }
}
