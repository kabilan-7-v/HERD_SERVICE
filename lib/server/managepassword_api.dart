import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Managepassword_api(BuildContext context, String pass, String doctor_id) async {
  final String url =
      "http://103.120.176.156:8803/doctor/updatePassword/$doctor_id";
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"password": pass}),
    );

    if (response.statusCode == 200) {
      print("password changed succesfully");
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: " + e.toString());
  }
}
