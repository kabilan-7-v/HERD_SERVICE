import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Customercard {
  final String name;
  final String address;
  final String phonenumber;
  final String date;
  final int date_sort;
  final priority;
  String comment;
  String time;
  String vllc;
  String level;

  Customercard(
      this.name,
      this.address,
      this.phonenumber,
      this.date,
      this.priority,
      this.date_sort,
      this.comment,
      this.time,
      this.vllc,
      this.level);
}

class Ticket_history {
  String name;
  String address;
  String cost;
  int iscompleted;
  Ticket_history(
      {this.name = "",
      this.address = "",
      this.cost = "",
      this.iscompleted = 0});
}

class current_request {
  String name;
  String vllc;
  String street;
  bool priroity;

  String state;

  int ticketid;
  String date;
  String level;

  current_request(this.name, this.priroity, this.vllc, this.street, this.state,
      this.ticketid, this.date, this.level);
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
    // Customercard("KRISHNA KUMAR(102MRC)", "POLLACHI,CBE", "9876543210",
    //     "JUNE 24,2024/7.00 AM", true, 20240724),
    // Customercard("Kabilan (102MRC)", "MANAMADURAI,SIVAGANGA", "9876543210",
    //     "JUNE 24,2024/7.00 AM", false, 20240723),
    // Customercard("Akash(102MRC)", "POLLACHI,KARUR", "9876543210",
    //     "JUNE 24,2024/7.00 AM", true, 20240725),
    // Customercard("Surya(102MRC)", "POLLACHI,KARUR", "9876543210",
    //     "JUNE 24,2024/7.00 AM", false, 20240726),
    // Customercard("Damin Rido(102MRC)", "KARUNGAL,KANYAKUMARI", "9876543210",
    //     "JUNE 24,2024/7.00 AM", false, 20240727),
    // Customercard("Damin risho(102MRC)", "KARUNGAL,KANYAKUMARI", "9876543210",
    //     "JUNE 24,2024/7.00 AM", false, 20240728),
    // Customercard("Sachita(102MRC)", "ARAPALAYAM,MADURAI", "9876543210",
    //     "JUNE 24,2024/7.00 AM", false, 20240729),
    // Customercard("Priya(102MRC)", "THUDIYALLUR,CBE", "9876543210",
    //     "JUNE 24,2024/7.00 AM", false, 20240730),
    // Customercard("Praveena(102MRC)", "GANAPATHY,CBE", "9876543210",
    //     "JUNE 24,2024/7.00 AM", false, 20240731),
  ];

  List<Ticket_history> tickethistory = [
    // Ticket_history("AJAY KUMAR", "POLLACHI", "800", true),
    // Ticket_history("Kabilan", "POLLACHI", "800", false),
    // Ticket_history("AJAY KUMAR", "POLLACHI", "800", true),
    // Ticket_history("AJAY KUMAR", "POLLACHI", "800", false),
    // Ticket_history("AJAY KUMAR", "POLLACHI", "800", true),
    // Ticket_history("AJAY KUMAR", "POLLACHI", "800", false),
    // Ticket_history("AJAY KUMAR", "POLLACHI", "800", true),
    // Ticket_history("AJAY KUMAR", "POLLACHI", "800", false),
    // Ticket_history("AJAY KUMAR", "POLLACHI", "800", true),
    // Ticket_history("AJAY KUMAR", "POLLACHI", "800", false),
    // Ticket_history("AJAY KUMAR", "POLLACHI", "800", true),
    // Ticket_history("AJAY KUMAR", "POLLACHI", "800", false),
    // Ticket_history("AJAY KUMAR", "POLLACHI", "800", true),
    // Ticket_history("AJAY KUMAR", "POLLACHI", "800", false),
    // Ticket_history("AJAY KUMAR", "POLLACHI", "800", true),
    // Ticket_history("AJAY KUMAR", "POLLACHI", "800", false),
  ];
  addvalue_to_ticket_history(val) {
    tickethistory = [];
    val.forEach((key, value) {
      for (var i in value) {
        tickethistory.add(Ticket_history(
            name: i["Name"],
            address: i["VLCC"],
            cost: "800",
            iscompleted: i["SP_Approval_status"]));
      }
      notifyListeners();
    });
  }

  addvalue_to_current_request(val) {
    current_request_list = [];
    val.forEach((key, value) {
      for (var i in value) {
        if (i["SP_Approval_status"] == 0) {
          current_request_list.add(current_request(
              i["Name"],
              true,
              i["VLCC"],
              i["Address"],
              "Tamil Nadu,TN-630 000,",
              i["Ticket_id"],
              i["Ticket_Raised_date"],
              i["Level"]));
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
          customercard.add(Customercard(
              i["Name"],
              i["Address"],
              i["Mobile1"].toString(),
              custom_date_formmat(i["Ticket_Raised_date"]),
              true,
              int.parse(custom_slice_for_sort(i["Ticket_Raised_date"])),
              i["Comments"],
              custom_time_formmat(i["Ticket_Raised_date"]),
              i["VLCC"],
              i["Level"]));
        }
      }
      notifyListeners();
    });
  }

  custom_date_formmat(String val) {
    String timestamp = val;
    DateTime dateTime = DateTime.parse(timestamp);

    // Format the date
    String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);

    return formattedDate; // Output: 12 AUG 2024
  }

  custom_time_formmat(String val) {
    String timestamp = val;
    DateTime dateTime = DateTime.parse(timestamp);

    // Format the time with AM/PM
    String formattedTime = DateFormat('hh:mm:ss a').format(dateTime);

    return formattedTime; // Output: 12 AUG 2024
  }

  custom_slice_for_sort(String val) {
    return val.substring(0, 4) + val.substring(5, 7) + val.substring(8, 10);
  }

  removevalue_to_current_request() {}
}
