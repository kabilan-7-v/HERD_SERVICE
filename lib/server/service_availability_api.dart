import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herd_service/models/homemodel.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('toogle_button', true);
      await context.read<service_availability>().change_toogle(true);

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
          {"status": false, "reason": reason, "availableon": availableon}),
    );

    if (response.statusCode == 200) {
      print(response.body);
      await context.read<service_availability>().change_toogle(false);
      print("service Successfully updated warestrdyfugihojpkwearstdyfughi");
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: " + e.toString());
  }
}