import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:herd_service/models/loginmodels.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

forget_password_api(BuildContext context, String email) async {
  String url = "http://103.120.176.156:8803/doctor/forgot";
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"email": email}),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please check the id')),
      );
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: " + e.toString());
  }
}

forget_token_api(BuildContext context, String pass, String token) async {
  String url = "http://103.120.176.156:8803/doctor/reset-password";
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"newPassword": pass, "token": token}),
    );

    if (response.statusCode == 200) {
      await context.read<Login_id>().Loginupdate_id(true, false, false);

      print("password update succefully");
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: " + e.toString());
  }
}
