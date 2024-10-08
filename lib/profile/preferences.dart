// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:herd_service/models/homemodel.dart';
import 'package:herd_service/server/preference_api.dart';
import 'package:provider/provider.dart';

class Preferences extends StatefulWidget {
  const Preferences({super.key});

  @override
  State<Preferences> createState() => _PreferencesState();
}

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
                          Preferences_api(
                            context,
                            Provider.of<userprofiledetails>(context,
                                    listen: false)
                                .doctor_id,
                            !Provider.of<userprofiledetails>(context,
                                    listen: false)
                                .emailpromotion,
                            Provider.of<userprofiledetails>(context,
                                    listen: false)
                                .emailinvoice,
                            Provider.of<userprofiledetails>(context,
                                    listen: false)
                                .smsinvoice,
                            Provider.of<userprofiledetails>(context,
                                    listen: false)
                                .smspromotion,
                            Provider.of<userprofiledetails>(context,
                                    listen: false)
                                .whatsapp,
                            Provider.of<userprofiledetails>(context,
                                    listen: false)
                                .pushnotification,
                          );
                          // email_prmotion = !email_prmotion;
                          // setState(() {});
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Allow emails for Promotions and offers"),
                        ),
                      ),
                      const Spacer(),
                      Provider.of<userprofiledetails>(context, listen: false)
                                  .emailpromotion ==
                              true
                          ? InkWell(
                              onTap: () {
                                Preferences_api(
                                    context,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .doctor_id,
                                    !Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .emailpromotion,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .emailinvoice,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .smsinvoice,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .smspromotion,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .whatsapp,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .pushnotification);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child:
                                    Image.asset("assets/icons/check_box.png"),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                Preferences_api(
                                    context,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .doctor_id,
                                    !Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .emailpromotion,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .emailinvoice,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .smsinvoice,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .smspromotion,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .whatsapp,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .pushnotification);
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
                          Preferences_api(
                              context,
                              Provider.of<userprofiledetails>(context,
                                      listen: false)
                                  .doctor_id,
                              Provider.of<userprofiledetails>(context,
                                      listen: false)
                                  .emailpromotion,
                              !Provider.of<userprofiledetails>(context,
                                      listen: false)
                                  .emailinvoice,
                              Provider.of<userprofiledetails>(context,
                                      listen: false)
                                  .smsinvoice,
                              Provider.of<userprofiledetails>(context,
                                      listen: false)
                                  .smspromotion,
                              Provider.of<userprofiledetails>(context,
                                      listen: false)
                                  .whatsapp,
                              Provider.of<userprofiledetails>(context,
                                      listen: false)
                                  .pushnotification);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Allow emails for invoice"),
                        ),
                      ),
                      const Spacer(),
                      Provider.of<userprofiledetails>(context, listen: false)
                                  .emailinvoice ==
                              true
                          ? InkWell(
                              onTap: () {
                                Preferences_api(
                                    context,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .doctor_id,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .emailpromotion,
                                    !Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .emailinvoice,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .smsinvoice,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .smspromotion,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .whatsapp,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .pushnotification);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child:
                                    Image.asset("assets/icons/check_box.png"),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                Preferences_api(
                                    context,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .doctor_id,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .emailpromotion,
                                    !Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .emailinvoice,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .smsinvoice,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .smspromotion,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .whatsapp,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .pushnotification);
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
                            Preferences_api(
                                context,
                                Provider.of<userprofiledetails>(context,
                                        listen: false)
                                    .doctor_id,
                                Provider.of<userprofiledetails>(context,
                                        listen: false)
                                    .emailpromotion,
                                Provider.of<userprofiledetails>(context,
                                        listen: false)
                                    .emailinvoice,
                                !Provider.of<userprofiledetails>(context,
                                        listen: false)
                                    .smsinvoice,
                                Provider.of<userprofiledetails>(context,
                                        listen: false)
                                    .smspromotion,
                                Provider.of<userprofiledetails>(context,
                                        listen: false)
                                    .whatsapp,
                                Provider.of<userprofiledetails>(context,
                                        listen: false)
                                    .pushnotification);
                            ;
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text("Allow emails for Promotions and offers"),
                        ),
                      ),
                      const Spacer(),
                      context.watch<userprofiledetails>().smsinvoice == true
                          ? InkWell(
                              onTap: () {
                                Preferences_api(
                                    context,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .doctor_id,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .emailpromotion,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .emailinvoice,
                                    !Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .smsinvoice,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .smspromotion,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .whatsapp,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .pushnotification);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child:
                                    Image.asset("assets/icons/check_box.png"),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                Preferences_api(
                                    context,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .doctor_id,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .emailpromotion,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .emailinvoice,
                                    !Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .smsinvoice,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .smspromotion,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .whatsapp,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .pushnotification);
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
                          Preferences_api(
                              context,
                              Provider.of<userprofiledetails>(context,
                                      listen: false)
                                  .doctor_id,
                              Provider.of<userprofiledetails>(context,
                                      listen: false)
                                  .emailpromotion,
                              Provider.of<userprofiledetails>(context,
                                      listen: false)
                                  .emailinvoice,
                              Provider.of<userprofiledetails>(context,
                                      listen: false)
                                  .smsinvoice,
                              !Provider.of<userprofiledetails>(context,
                                      listen: false)
                                  .smspromotion,
                              Provider.of<userprofiledetails>(context,
                                      listen: false)
                                  .whatsapp,
                              Provider.of<userprofiledetails>(context,
                                      listen: false)
                                  .pushnotification);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text("Allow promotional SMS offers"),
                        ),
                      ),
                      const Spacer(),
                      context.watch<userprofiledetails>().smspromotion == true
                          ? InkWell(
                              onTap: () {
                                Preferences_api(
                                    context,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .doctor_id,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .emailpromotion,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .emailinvoice,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .smsinvoice,
                                    !Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .smspromotion,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .whatsapp,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .pushnotification);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child:
                                    Image.asset("assets/icons/check_box.png"),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                Preferences_api(
                                    context,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .doctor_id,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .emailpromotion,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .emailinvoice,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .smsinvoice,
                                    !Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .smspromotion,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .whatsapp,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .pushnotification);
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
                          Preferences_api(
                              context,
                              Provider.of<userprofiledetails>(context,
                                      listen: false)
                                  .doctor_id,
                              Provider.of<userprofiledetails>(context,
                                      listen: false)
                                  .emailpromotion,
                              Provider.of<userprofiledetails>(context,
                                      listen: false)
                                  .emailinvoice,
                              Provider.of<userprofiledetails>(context,
                                      listen: false)
                                  .smsinvoice,
                              Provider.of<userprofiledetails>(context,
                                      listen: false)
                                  .smspromotion,
                              !Provider.of<userprofiledetails>(context,
                                      listen: false)
                                  .whatsapp,
                              Provider.of<userprofiledetails>(context,
                                      listen: false)
                                  .pushnotification);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text("Allow updates to be sent on whatsapp"),
                        ),
                      ),
                      const Spacer(),
                      context.watch<userprofiledetails>().whatsapp == true
                          ? InkWell(
                              onTap: () {
                                Preferences_api(
                                    context,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .doctor_id,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .emailpromotion,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .emailinvoice,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .smsinvoice,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .smspromotion,
                                    !Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .whatsapp,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .pushnotification);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child:
                                    Image.asset("assets/icons/check_box.png"),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                Preferences_api(
                                    context,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .doctor_id,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .emailpromotion,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .emailinvoice,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .smsinvoice,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .smspromotion,
                                    !Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .whatsapp,
                                    Provider.of<userprofiledetails>(context,
                                            listen: false)
                                        .pushnotification);
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
                      Preferences_api(
                          context,
                          Provider.of<userprofiledetails>(context,
                                  listen: false)
                              .doctor_id,
                          Provider.of<userprofiledetails>(context,
                                  listen: false)
                              .emailpromotion,
                          Provider.of<userprofiledetails>(context,
                                  listen: false)
                              .emailinvoice,
                          Provider.of<userprofiledetails>(context,
                                  listen: false)
                              .smsinvoice,
                          Provider.of<userprofiledetails>(context,
                                  listen: false)
                              .smspromotion,
                          Provider.of<userprofiledetails>(context,
                                  listen: false)
                              .whatsapp,
                          !Provider.of<userprofiledetails>(context,
                                  listen: false)
                              .pushnotification);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text("Allow emails for Promotions and offers"),
                    ),
                  ),
                  const Spacer(),
                  context.watch<userprofiledetails>().pushnotification == true
                      ? InkWell(
                          onTap: () {
                            Preferences_api(
                                context,
                                Provider.of<userprofiledetails>(context,
                                        listen: false)
                                    .doctor_id,
                                Provider.of<userprofiledetails>(context,
                                        listen: false)
                                    .emailpromotion,
                                Provider.of<userprofiledetails>(context,
                                        listen: false)
                                    .emailinvoice,
                                Provider.of<userprofiledetails>(context,
                                        listen: false)
                                    .smsinvoice,
                                Provider.of<userprofiledetails>(context,
                                        listen: false)
                                    .smspromotion,
                                Provider.of<userprofiledetails>(context,
                                        listen: false)
                                    .whatsapp,
                                !Provider.of<userprofiledetails>(context,
                                        listen: false)
                                    .pushnotification);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset("assets/icons/check_box.png"),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            Preferences_api(
                                context,
                                Provider.of<userprofiledetails>(context,
                                        listen: false)
                                    .doctor_id,
                                Provider.of<userprofiledetails>(context,
                                        listen: false)
                                    .emailpromotion,
                                Provider.of<userprofiledetails>(context,
                                        listen: false)
                                    .emailinvoice,
                                Provider.of<userprofiledetails>(context,
                                        listen: false)
                                    .smsinvoice,
                                Provider.of<userprofiledetails>(context,
                                        listen: false)
                                    .smspromotion,
                                Provider.of<userprofiledetails>(context,
                                        listen: false)
                                    .whatsapp,
                                !Provider.of<userprofiledetails>(context,
                                        listen: false)
                                    .pushnotification);
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
