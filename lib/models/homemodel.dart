import 'package:flutter/material.dart';

class userprofiledetails extends ChangeNotifier {
  String username;
  String type_of_user;
  String email;
  String phoneno;
  String address;
  int doctor_id;
  String Password;

  userprofiledetails(
      {this.type_of_user = ".",
      this.email = "",
      this.phoneno = "",
      this.address = "",
      this.username = "Dr.k.Ram kumar MD.MS",
      this.doctor_id = 2,
      this.Password = ""});

  change_user_profile(name, usertype, useremail, phno, useraddress, id, pass) {
    username = name;
    type_of_user = usertype;
    email = useremail;
    phoneno = phno;
    address = useraddress;
    doctor_id = id;
    Password = pass;

    notifyListeners();
  }
}
