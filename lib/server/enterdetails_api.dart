// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'dart:io';

// Future<void> enterdetails_api(File img) async {
//   String url = "http://103.120.176.156:8803/treatment/treatment";

//   // Convert the image to Base64
//   List<int> imageBytes = await img.readAsBytes();
//   String base64Image = base64Encode(imageBytes);

//   final response = await http.post(
//     Uri.parse(url),
//     headers: {
//       'Content-Type': 'application/json',
//     },
//     body: jsonEncode({
//       "file": base64Image,
//       "ticketid": 3,
//       "cowid": 1,
//       "formerid": 1,
//       "docid": 2,
//       "status": true,
//       "comment": "",
//       "bulltype": 1,
//       "price": 1
//     }),
//   );

//   print(response.body);
// }

import 'package:http/http.dart' as http;

import 'dart:io';

Future<void> enterdetails_api(
    File img, String bulltype, String price, String strawnumber) async {
  String url = "http://103.120.176.156:8803/treatment/treatment";

  try {
    var request = http.MultipartRequest('POST', Uri.parse(url));

    // Add other form fields
    request.fields['ticketid'] = '3';
    request.fields['cowid'] = '1';
    request.fields['formerid'] = '1';
    request.fields['docid'] = '2';
    request.fields['status'] = '1';
    request.fields['comment'] = '';
    request.fields['bulltype'] = '1';
    request.fields['price'] = '1';
    // Attach the image file
    var pic = await http.MultipartFile.fromPath("image", img.path);

    request.files.add(pic);

    // Send the request
    var streamedResponse = await request.send().timeout(Duration(seconds: 60));
    print("kabilangxfchvjbnkjm,.");
    var response = await http.Response.fromStream(streamedResponse);
    print(response.body);

    if (response.statusCode == 201) {
      print("Image and details uploaded successfully");
      print(response.body);
    } else {
      print("Failed to upload: ${response.body}");
    }
  } catch (e) {
    print("Error: " + e.toString());
  }
}

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'dart:io';
// import 'package:path/path.dart';

// Future<void> enterdetails_api(File img) async {
//   String url = "http://103.120.176.156:8803/treatment/treatment";

//   try {
//     var request = http.MultipartRequest('POST', Uri.parse(url));

//     // Add other form fields
//     request.fields['ticketid'] = '3';
//     request.fields['cowid'] = '1';
//     request.fields['formerid'] = '1';
//     request.fields['docid'] = '2';
//     request.fields['status'] = 'true';
//     request.fields['comment'] = '';
//     request.fields['bulltype'] = '1';
//     request.fields['price'] = '1';

//     // Attach the image file
//     var pic = await http.MultipartFile.fromPath("image", img.path);
//     request.files.add(pic);

//     // Send the request
//     var streamedResponse = await request.send();
//     var response = await http.Response.fromStream(streamedResponse);

//     if (response.statusCode == 201) {
//       print("Image and details uploaded successfully");
//       print(response.body);
//     } else {
//       print("Failed to upload: ${response.body}");
//     }
//   } catch (e) {
//     print("Error: " + e.toString());
//   }
// }