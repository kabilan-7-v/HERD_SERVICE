import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Preferences_api(BuildContext context, int doctor_id, emailpro, emailinvoice,
    smsinvoice, smspro, whatsapp, pushnotification) async {
  final String url =
      "http://103.120.176.156:8803/doctor/updateDoctorPreferences";
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "Doctor_id": 2,
        "emailpromotions": emailpro,
        "emailinvoice": emailinvoice,
        "smsinvoice": smsinvoice,
        "smspromotion": smspro,
        "WhatsApp": whatsapp,
        "pushnotification": pushnotification
      }),
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: " + e.toString());
  }
}
