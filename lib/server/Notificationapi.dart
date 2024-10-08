import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:herd_service/models/Notification_models.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Notification_api(BuildContext context, doctor_id) async {
  String url = "http://103.120.176.156:8803/doctor/notifications/$doctor_id";
  try {
    final response = await http.get(Uri.parse(url));
    var val = jsonDecode(response.body);

    await context.read<NotifyModel>().Notification_request(val);
  } catch (e) {
    print("Error: " + e.toString());
  }
}
