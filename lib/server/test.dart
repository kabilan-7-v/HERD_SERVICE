import 'dart:convert';

import 'package:http/http.dart' as http;

Future<bool> fetchdata(email) async {
  var res = await http.get(Uri.parse('https://reqres.in/api/unknown'));
  if (res.statusCode == 200) {
    var data = jsonDecode(res.body);
    print(data);

    for (var i in data["data"]) {
      if (email == i["id"].toString()) {
        return true;
      }
    }
    return false;
  }

  return true;
}

Future postdata() async {
  final url = Uri.parse("https://reqres.in/api/users");
  final data = {"name": "morpheus", "job": "leader", "email": "kabilan"};

  final res = http.post(
    url,
    body: data,
  );
  print(jsonDecode((await http.get(url)).body));

  return true;
}
