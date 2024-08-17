import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:herd_service/models/customercard.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Appoimentresquestapi(BuildContext context, doctor_id) async {
  final String url =
      "http://103.120.176.156:8803/ticket/ticketBySpid/$doctor_id";
  try {
    final response = await http.get(Uri.parse(url));
    print(response.body);
    var val = jsonDecode(response.body);
    await context.read<test>().addvalue_to_current_request(val);
    await context.read<test>().addvalue_to_assignment_request(val);
    await context.read<test>().addvalue_to_ticket_history(val);
  } catch (e) {
    print("Error: " + e.toString());
  }
}

change_current_to_assign(BuildContext context, ticket_id) async {
  final String url =
      "http://103.120.176.156:8803/ticket/updateApprovalStatus/$ticket_id";

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"SP_Approval_status": false}),
    );
    print(response.body);
    Appoimentresquestapi(context, 2);
  } catch (e) {
    print(e);
  }
}
