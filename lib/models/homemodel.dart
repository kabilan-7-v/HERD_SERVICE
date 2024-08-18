import 'package:flutter/material.dart';

class userprofiledetails extends ChangeNotifier {
  String username;
  String type_of_user;
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

  userprofiledetails(
      {this.type_of_user = ".",
      this.email = "",
      this.phoneno = "",
      this.address = "",
      this.username = "Dr.k.Ram kumar MD.MS",
      this.doctor_id = 2,
      this.Password = "",
      this.emailpromotion = false,
      this.emailinvoice = false,
      this.smsinvoice = false,
      this.smspromotion = false,
      this.whatsapp = false,
      this.pushnotification = false});

  change_user_profile(name, usertype, useremail, phno, useraddress, id, pass,
      emailpromo, emailinvoic, smsin, smspromo, whatsap, pushnot) {
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
