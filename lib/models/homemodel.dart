import 'package:flutter/material.dart';

class userprofiledetails extends ChangeNotifier {
  String username;

  String email;
  String phoneno;
  String address;
  int doctor_id;
  String Password;
  bool emailpromotion;
  bool emailinvoice;
  bool smsinvoice;
  bool smspromotion;
  bool whatsapp;
  bool pushnotification;
  int type_of_user;

  userprofiledetails(
      {this.type_of_user = 0,
      this.email = "",
      this.phoneno = "",
      this.address = "",
      this.username = "Dr.k.Ram kumar MD.MS",
      this.doctor_id = 4,
      this.Password = "",
      this.emailpromotion = false,
      this.emailinvoice = false,
      this.smsinvoice = false,
      this.smspromotion = false,
      this.whatsapp = false,
      this.pushnotification = false});

  change_user_profile(
    String name,
    usertype,
    String useremail,
    String phno,
    String useraddress,
    int id,
    pass,
    emailpromo,
    emailinvoic,
    smsin,
    smspromo,
    whatsap,
    pushnot,
  ) {
    username = name;
    type_of_user = usertype;
    email = useremail;
    phoneno = phno;
    address = useraddress;
    doctor_id = id;
    Password = pass;
    emailpromotion = emailpromo;
    emailinvoice = emailinvoic;
    smsinvoice = smsin;
    smspromotion = smspromo;
    whatsapp = whatsap;
    pushnotification = pushnot;

    notifyListeners();
  }
}
