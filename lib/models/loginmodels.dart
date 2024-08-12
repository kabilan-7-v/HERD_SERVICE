import 'package:flutter/material.dart';

class Login_email extends ChangeNotifier {
  bool Validate = false;
  Login_email({this.Validate = false});
  Loginupdate_email(Val) {
    Validate = Val;
    notifyListeners();
  }
}

class Login_id extends ChangeNotifier {
  bool Validate = false;
  Login_id({this.Validate = false});
  Loginupdate_id(Val) {
    Validate = Val;
    notifyListeners();
  }
}
