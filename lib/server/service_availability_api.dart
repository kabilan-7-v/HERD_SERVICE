import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

Service_on(BuildContext context, int doctor_id) async {
  final String url = "http://103.120.176.156:8803/doctor/status/$doctor_id";
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"status": true}),
    );

    if (response.statusCode == 200) {
      print("service Successfully updated");
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: " + e.toString());
  }
}

Service_off(BuildContext context, int doctor_id, String reason,
    String availableon) async {
  final String url = "http://103.120.176.156:8803/doctor/status/$doctor_id";
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
          {"status": true, "reason": reason, "availableon": availableon}),
    );

    if (response.statusCode == 200) {
      print(response.body);
      print("service Successfully updated warestrdyfugihojpkwearstdyfughi");
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: " + e.toString());
  }
}
