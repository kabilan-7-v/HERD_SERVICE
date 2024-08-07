// ignore_for_file: avoid_print, prefer_const_declarations

import 'dart:convert';

import 'package:herd_service/models/blogdetails.dart';
import 'package:http/http.dart' as http;

class UserRespository {
  getuser() async {
    final String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    final String adminSecret =
        '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });

      if (response.statusCode == 200) {
        final List res = await jsonDecode(response.body)["blogs"];
        // print(res);
        // print(res.map(((e) => UserModel.fromJson(e))).toList());
        return res.map(((e) => UserModel.fromJson(e))).toList();
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      // Handle any errors that occurred during the request
      print('Error: $e');
    }
  }
}

// import 'dart:convert';

// import 'package:blog_explorer/models/blogdetails.dart';
// import 'package:http/http.dart' as http;

// class UserRespository {
//   String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
//   final String adminSecret =
//       '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';
//   getuser() async {
//     final response = await http.get(Uri.parse(url), headers: {
//       'x-hasura-admin-secret': adminSecret,
//     });
//     if (response.statusCode == 200) {
//       final List res = jsonDecode(response.body)["blogs"];
//       print(res);
//       print(res.map(((e) => UserModel.fromJson(e))).toList());
//       return res.map(((e) => UserModel.fromJson(e))).toList();
//     } else {
//       throw Exception(response.reasonPhrase);
//     }
//   }
// }
