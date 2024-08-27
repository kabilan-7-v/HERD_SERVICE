import 'package:flutter/material.dart';
import 'package:herd_service/models/homemodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> doctor_details_local_data(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  context.read<userprofiledetails>().change_user_profile(
      prefs.getString("Name") ?? "null",
      prefs.getInt("type"),
      prefs.getString("email") ?? "",
      prefs.getString("phno") ?? "",
      prefs.getString("address") ?? "",
      prefs.getInt("Doctor_id") ?? 2,
      prefs.getString("password"),
      prefs.getBool("emailpromotions"),
      prefs.getBool("emailinvoice"),
      prefs.getBool("smsinvoice"),
      prefs.getBool("smspromotion"),
      prefs.getBool("WhatsApp"),
      prefs.getBool("pushnotification"),
      prefs.getBool("status"),
      prefs.getString("password"));
  context.read<service_availability>().change_toogle(prefs.getBool("status"));
}
