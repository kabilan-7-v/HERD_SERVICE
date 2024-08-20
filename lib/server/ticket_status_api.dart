import 'dart:convert';

import 'package:http/http.dart' as http;

ticket_update_start_api(ticket_id) async {
  String url =
      "http://103.120.176.156:8803/ticket/updateStartstatus/$ticket_id";

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
      print("successfully update");
    } else {
      print("something wrong");
    }
  } catch (e) {
    print("Error:$e");
  }
}

ticket_update_end_api(ticket_id) async {
  String url = "http://103.120.176.156:8803/ticket/updateEndstatus/$ticket_id";
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"Service_End_status": true}),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print("successfully update end");
    }
  } catch (e) {
    print("Error:$e");
  }
}
