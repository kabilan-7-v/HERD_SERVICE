import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:herd_service/models/Ai_enter_details.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AiMedicine_Api extends ChangeNotifier {}

Future<void> Ai_enterdetails_api(BuildContext context) async {
  final String url = "http://103.120.176.156:8803/med/med";

  try {
    final request = await http.get(Uri.parse(url));
    if (request.statusCode == 200) {
      print(request.body);
      var res = jsonDecode(request.body);
      await context.read<Med_list>().Change_medlist(res);
    }
  } catch (e) {
    debugPrint("error:" + e.toString());
  }
}
