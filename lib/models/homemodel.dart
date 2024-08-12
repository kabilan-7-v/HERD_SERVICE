import 'package:flutter/material.dart';

class userprofiledetails extends ChangeNotifier {
  final String username;
  final String type_of_user;
  final String email;
  final String phoneno;
  final String address;

  userprofiledetails(
      {this.type_of_user = ".",
      this.email = "",
      this.phoneno = "",
      this.address = "",
      this.username = "Dr.k.Ram kumar MD.MS"});
}
