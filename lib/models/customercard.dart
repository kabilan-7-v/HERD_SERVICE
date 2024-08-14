import 'package:flutter/material.dart';

class Customercard {
  final String name;
  final String address;
  final String phonenumber;
  final String date;
  final int date_sort;
  final priority;

  Customercard(this.name, this.address, this.phonenumber, this.date,
      this.priority, this.date_sort);
}

class Ticket_history {
  final String name;
  final String address;
  final String cost;
  final bool iscompleted;
  Ticket_history(this.name, this.address, this.cost, this.iscompleted);
}

List<Ticket_history> tickethistory = [
  Ticket_history("AJAY KUMAR", "POLLACHI", "800", true),
  Ticket_history("Kabilan", "POLLACHI", "800", false),
  Ticket_history("AJAY KUMAR", "POLLACHI", "800", true),
  Ticket_history("AJAY KUMAR", "POLLACHI", "800", false),
  Ticket_history("AJAY KUMAR", "POLLACHI", "800", true),
  Ticket_history("AJAY KUMAR", "POLLACHI", "800", false),
  Ticket_history("AJAY KUMAR", "POLLACHI", "800", true),
  Ticket_history("AJAY KUMAR", "POLLACHI", "800", false),
  Ticket_history("AJAY KUMAR", "POLLACHI", "800", true),
  Ticket_history("AJAY KUMAR", "POLLACHI", "800", false),
  Ticket_history("AJAY KUMAR", "POLLACHI", "800", true),
  Ticket_history("AJAY KUMAR", "POLLACHI", "800", false),
  Ticket_history("AJAY KUMAR", "POLLACHI", "800", true),
  Ticket_history("AJAY KUMAR", "POLLACHI", "800", false),
  Ticket_history("AJAY KUMAR", "POLLACHI", "800", true),
  Ticket_history("AJAY KUMAR", "POLLACHI", "800", false),
];

class current_request {
  String name;
  String vllc;
  String street;
  bool priroity;
  String state;
  int ticketid;
  current_request(this.name, this.priroity, this.vllc, this.street, this.state,
      this.ticketid);
}

class test extends ChangeNotifier {
  List<current_request> current_request_list = [
    // current_request("AJAY KUMAR (608MRC)", true, "POLLACHI",
    //     ":04,ABC Street,Pollachi,CBE", "Tamil Nadu,TN-630 000,"),
    // current_request("AJAY KUMAR (608MR)", false, "POLLACHI",
    //     ":04,ABC Street,Pollachi,CBE", "Tamil Nadu,TN-630 000,"),
    // current_request("AJAY KUMAR", "POLLACHI", "800", false),
    // current_request("AJAY KUMAR", "POLLACHI", "800", true),
  ];
  List<Customercard> customercard = [
    Customercard("KRISHNA KUMAR(102MRC)", "POLLACHI,CBE", "9876543210",
        "JUNE 24,2024/7.00 AM", true, 20240724),
    Customercard("Kabilan (102MRC)", "MANAMADURAI,SIVAGANGA", "9876543210",
        "JUNE 24,2024/7.00 AM", false, 20240723),
    Customercard("Akash(102MRC)", "POLLACHI,KARUR", "9876543210",
        "JUNE 24,2024/7.00 AM", true, 20240725),
    Customercard("Surya(102MRC)", "POLLACHI,KARUR", "9876543210",
        "JUNE 24,2024/7.00 AM", false, 20240726),
    Customercard("Damin Rido(102MRC)", "KARUNGAL,KANYAKUMARI", "9876543210",
        "JUNE 24,2024/7.00 AM", false, 20240727),
    Customercard("Damin risho(102MRC)", "KARUNGAL,KANYAKUMARI", "9876543210",
        "JUNE 24,2024/7.00 AM", false, 20240728),
    Customercard("Sachita(102MRC)", "ARAPALAYAM,MADURAI", "9876543210",
        "JUNE 24,2024/7.00 AM", false, 20240729),
    Customercard("Priya(102MRC)", "THUDIYALLUR,CBE", "9876543210",
        "JUNE 24,2024/7.00 AM", false, 20240730),
    Customercard("Praveena(102MRC)", "GANAPATHY,CBE", "9876543210",
        "JUNE 24,2024/7.00 AM", false, 20240731),
  ];

  addvalue_to_current_request(val) {
    current_request_list = [];
    val.forEach((key, value) {
      for (var i in value) {
        if (i["SP_Approval_status"] == 0) {
          current_request_list.add(current_request(i["Name"], true, i["VLCC"],
              i["Address"], "Tamil Nadu,TN-630 000,", i["Ticket_id"]));
        }
      }
      notifyListeners();
    });
  }

  addvalue_to_assignment_request(val) {
    customercard = [];
    val.forEach((key, value) {
      for (var i in value) {
        if (i["SP_Approval_status"] == 1) {
          customercard.add(Customercard(i["Name"], i["Address"],
              i["Mobile1"].toString(), i["Ticket_Raised_date"], true, 67698));
        }
      }
      notifyListeners();
    });
  }

  removevalue_to_current_request() {}
}
