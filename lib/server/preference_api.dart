import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:herd_service/models/homemodel.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

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
        "Doctor_id": doctor_id,
        "emailpromotions": emailpro,
        "emailinvoice": emailinvoice,
        "smsinvoice": smsinvoice,
        "smspromotion": smspro,
        "WhatsApp": whatsapp,
        "pushnotification": pushnotification
      }),
    );

    if (response.statusCode == 200) {
      Provider.of<userprofiledetails>(context, listen: false)
          .change_user_profile(
              Provider.of<userprofiledetails>(context, listen: false).username,
              Provider.of<userprofiledetails>(context, listen: false)
                  .type_of_user,
              Provider.of<userprofiledetails>(context, listen: false).email,
              Provider.of<userprofiledetails>(context, listen: false).phoneno,
              Provider.of<userprofiledetails>(context, listen: false).address,
              Provider.of<userprofiledetails>(context, listen: false).doctor_id,
              Provider.of<userprofiledetails>(context, listen: false).Password,
              emailpro,
              emailinvoice,
              smsinvoice,
              smspro,
              whatsapp,
              pushnotification,
              Provider.of<userprofiledetails>(context, listen: false).status,
              Provider.of<userprofiledetails>(context, listen: false).pass);
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: " + e.toString());
  }
}
