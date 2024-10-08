import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:herd_service/models/customercard.dart';
import 'package:herd_service/models/homemodel.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Appoimentresquestapi(BuildContext context, doctor_id) async {
  final String url =
      "http://103.120.176.156:8803/ticket/ticketBySpid/$doctor_id";

  try {
    final response = await http.get(Uri.parse(url));
    var val = jsonDecode(response.body);

    Provider.of<test>(context, listen: false).addvalue_to_current_request(val);
    Provider.of<test>(context, listen: false)
        .addvalue_to_assignment_request(val);

    Provider.of<test>(context, listen: false).addvalue_to_ticket_history(val);
  } catch (e) {
    print("Error: " + e.toString());
  }
}

change_current_to_assign(BuildContext context, ticket_id) async {
  final String url =
      "http://103.120.176.156:8803/ticket/updateApprovalStatus/$ticket_id";

  try {
    await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"SP_Approval_status": true}),
    );

    Appoimentresquestapi(context,
        Provider.of<userprofiledetails>(context, listen: false).doctor_id);
  } catch (e) {
    print(e);
  }
}

change_current_to_decline(BuildContext context, ticket_id) async {
  final String url =
      "http://103.120.176.156:8803/ticket/updateApprovalStatus/$ticket_id";

  try {
    await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"SP_Approval_status": false}),
    );
    Appoimentresquestapi(context,
        Provider.of<userprofiledetails>(context, listen: false).doctor_id);
  } catch (e) {
    print(e);
  }
}
