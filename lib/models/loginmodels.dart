import 'package:flutter/material.dart';

class Login_email extends ChangeNotifier {
  bool Validate = false;
  bool emailchecker = false;
  bool passwordchecker = false;
  Login_email(
      {this.Validate = false,
      this.emailchecker = false,
      this.passwordchecker = false});
  Loginupdate_email(Val, email, pass) {
    Validate = Val;

    emailchecker = email;
    passwordchecker = pass;

    notifyListeners();
  }
}

class Login_id extends ChangeNotifier {
  bool Validate = false;
  bool emailchecker = false;
  bool passwordchecker = false;
  Login_id(
      {this.Validate = false,
      this.emailchecker = false,
      this.passwordchecker = false});
  Loginupdate_id(Val, email, pass) {
    Validate = Val;
    emailchecker = email;
    passwordchecker = pass;
    notifyListeners();
  }
}
