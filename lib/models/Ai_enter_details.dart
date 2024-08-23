import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Med extends ChangeNotifier {
  int medid;
  String medname;
  int availqty;
  String price;
  int qty;
  num tot_price;
  Med(
      {this.availqty = 0,
      this.medid = 0,
      this.medname = "",
      this.price = "",
      this.qty = 1,
      this.tot_price = 0});
  List Add_med = [];
  Add_med_func(med_id, med_name, avai, pri) {
    for (int i = 0; i < Add_med.length; i++) {
      if (Add_med[i].medid == med_id) {
        return;
      }
    }
    Add_med.insert(
        0,
        Med(
            medid: med_id,
            medname: med_name,
            availqty: avai,
            price: pri,
            qty: 1));
    notifyListeners();
  }

  change_Addqty(id) {
    for (int i = 0; i < Add_med.length; i++) {
      if (Add_med[i].medid == id) {
        Add_med[i].qty = Add_med[i].qty + 1;
      }
    }
    notifyListeners();
  }

  change_Subqty(id) {
    for (int i = 0; i < Add_med.length; i++) {
      if (Add_med[i].medid == id && Add_med[i].qty > 0) {
        Add_med[i].qty = Add_med[i].qty - 1;
      }
    }
    notifyListeners();
  }

  change_totprice() {
    num temp = 0;
    for (int i = 0; i < Add_med.length; i++) {
      print(Add_med[i].price);
      print("objectwreztxryctugvhbkjlnkmljhchvmnm,bjhxzgfcjhbjkbj");
      temp += (Add_med[i].qty * int.parse(Add_med[i].price));
    }
    tot_price = temp;
    notifyListeners();
  }

  close() {
    tot_price = 0;
    Add_med.clear();
    ChangeNotifier();
  }
}

class Med_list extends ChangeNotifier {
  Future<void> Ai_enterdetails_api(BuildContext context) async {
    final String url = "http://103.120.176.156:8803/med/med";

    try {
      final request = await http.get(Uri.parse(url));
      if (request.statusCode == 200) {
        print(request.body);
        var res = jsonDecode(request.body);
        context.read<Med_list>().Change_medlist(res);
      }
    } catch (e) {
      debugPrint("error:" + e.toString());
    }
  }

  List medlist = [];
  Change_medlist(res) {
    print(res);
    print("kabilan kabilan kailan");
    medlist = res;
    print(medlist);
    ChangeNotifier();
  }

  sorting_med(String enteredkeyboard, BuildContext context) {
    Ai_enterdetails_api(context);
    List result = [];
    if (enteredkeyboard.isEmpty) {
      result = medlist;
    } else {
      result = medlist
          .where((element) => element["medname"]
              .toLowerCase()
              .startsWith(enteredkeyboard.toLowerCase()))
          .toList();
    }
    medlist = result;

    notifyListeners();
  }
}
