// ignore_for_file: avoid_print, prefer_const_declarations

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herd_service/models/blogdetails.dart';
import 'package:herd_service/models/homemodel.dart';
import 'package:herd_service/models/loginmodels.dart';
import 'package:http/http.dart' as http;

class UserRespository {
  getuser() async {
    final String url = 'http://103.120.176.156:8803/feed/getProducts';

    try {
      final response = await http.get(Uri.parse(url));

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

Login_with_email_or_phone(
    BuildContext context, String email, String pass) async {
  final String url = "http://103.120.176.156:8803/doctor/loginemail";
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"email": email, "password": pass}),
    );
    if (response.statusCode == 200) {
      await context.read<Login_email>().Loginupdate_email(true, false, false);
    } else if (response.statusCode == 404) {
      await context.read<Login_email>().Loginupdate_email(false, true, false);
      print("Email not Match");
    } else if (response.statusCode == 401) {
      await context.read<Login_email>().Loginupdate_email(false, false, true);
      print("Password not Match");
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: " + e.toString());
  }
}

Login_with_Uid(BuildContext context, String id, String pass) async {
  final String url = "http://103.120.176.156:8803/doctor/loginid";
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"id": id, "password": pass}),
    );

    if (response.statusCode == 200) {
      await context.read<Login_id>().Loginupdate_id(true, false, false);
      var res = jsonDecode(response.body);
      await context.read<userprofiledetails>().change_user_profile(
          res["Name"].toString(),
          res["phno"].toString(),
          res["email"].toString(),
          res["phno"].toString(),
          res["Location"].toString());
    } else if (response.statusCode == 404) {
      await context.read<Login_id>().Loginupdate_id(false, true, false);
      print(response.body);
      print("uid not Match");
    } else if (response.statusCode == 401) {
      await context.read<Login_id>().Loginupdate_id(false, false, true);
      print("Password not Match");
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: " + e.toString());
  }
}

Login_with_phone(BuildContext context, String phone, String pass) async {
  final String url = "http://103.120.176.156:8803/doctor/loginphno";
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"phno": phone, "password": pass}),
    );
    // print(response.body);
    if (response.statusCode == 200) {
      await context.read<Login_phone>().Loginupdate_phone(true, false, false);
      var res = jsonDecode(response.body);
      await context.read<userprofiledetails>().change_user_profile(
          res["Name"].toString(),
          res["phno"].toString(),
          res["email"].toString(),
          res["phno"].toString(),
          res["Location"].toString());
    } else if (response.statusCode == 404) {
      await context.read<Login_phone>().Loginupdate_phone(false, true, false);
      print(response.body);
      print("Phone number not match");
    } else if (response.statusCode == 401) {
      await context.read<Login_phone>().Loginupdate_phone(false, false, true);
      print("Password not Match");
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: " + e.toString());
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
