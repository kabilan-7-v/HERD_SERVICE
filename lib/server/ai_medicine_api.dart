import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:herd_service/models/Ai_enter_details.dart';
import 'package:herd_service/models/homemodel.dart';
import 'package:herd_service/server/home_api.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

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

Future<void> Ai_enterdetails_start_api(BuildContext context, ticked_id) async {
  final String url =
      "http://103.120.176.156:8803/ticket/updateStartstatus/$ticked_id";

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"Service_Start_status": true}),
    );
    if (response.statusCode == 200) {
      print(response.body);
    }
  } catch (e) {
    debugPrint("error:" + e.toString());
  }
}

Future<void> Ai_enterdetails_end_api(BuildContext context, ticket_id) async {
  final String url =
      "http://103.120.176.156:8803/ticket/updateEndstatus/$ticket_id";

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"Service_End_status": true}),
    );
    if (response.statusCode == 200) {
      print(response.body);
      Appoimentresquestapi(context,
          Provider.of<userprofiledetails>(context, listen: false).doctor_id);
    }
  } catch (e) {
    debugPrint("error:" + e.toString());
  }
}

Future<void> Ai_enterdetails_Followup_api(
    BuildContext context, ticket_id, newdate) async {
  final String url = "http://103.120.176.156:8803/treatment/followup";

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
          {"treatmentId": int.parse(ticket_id), "nextDate": newdate}),
    );
    if (response.statusCode == 200) {
      print(response.body);
    }
  } catch (e) {
    debugPrint("error:" + e.toString());
  }
}

Future<void> Ai_enterdetails_Treamentdetails_api(BuildContext context,
    ticket_id, cow_id, former_id, doc_id, status, comment, price) async {
  final String url = "http://103.120.176.156:8803/treatment/vettreatment";

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "ticketid": ticket_id,
        "cowid": cow_id,
        "formerid": former_id,
        "docid": doc_id,
        "status": status == 0 ? false : true,
        "comment": comment,
        "price": price
      }),
    );
    print("aretcgvhbjnkm,l.xtfcghvj nkjmtrxfchgvj jkgvhbnm");
    print(response.body);

    if (response.statusCode == 200) {
      print(response.body);
      print("Treament updated");
    }
  } catch (e) {
    debugPrint("error:" + e.toString());
  }
}

Future<void> Ai_enterdetails_MedicialList_api(
    BuildContext context, ticket_id, med_list) async {
  final String url = "http://103.120.176.156:8803/med/medgiven";

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"treatmentId": ticket_id, "medList": []}),
    );
    if (response.statusCode == 200) {
      print(response.body);
      print("Medical list updated");
    }
  } catch (e) {
    debugPrint("error:" + e.toString());
  }
}
