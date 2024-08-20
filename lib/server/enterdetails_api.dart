import 'package:http/http.dart' as http;

import 'dart:io';

Future<void> enterdetails_api(File img, String bulltype, String price,
    String strawnumber, ticket_id, doctor_id) async {
  String url = "http://103.120.176.156:8803/treatment/treatment";

  try {
    var request = http.MultipartRequest('POST', Uri.parse(url));

    // Add other form fields
    request.fields['ticketid'] = ticket_id;
    request.fields['cowid'] = strawnumber;
    request.fields['formerid'] = '1';
    request.fields['docid'] = doctor_id.toString();
    request.fields['status'] = '2';
    request.fields['comment'] = '';
    request.fields['bulltype'] = bulltype;
    request.fields['price'] = price;
    // Attach the image file
    var pic = await http.MultipartFile.fromPath("image", img.path);

    request.files.add(pic);

    // Send the request
    var streamedResponse = await request.send().timeout(Duration(seconds: 60));

    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 201) {
      print("Image and details uploaded successfully");
    } else {
      print("Failed to upload: ${response.body}");
    }
  } catch (e) {
    print("Error: " + e.toString());
  }
}
