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
  int ticket_id;
  int status;
  String ticket_type;
  int straw_no;
  int bulltype;

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
      this.level,
      this.ticket_id,
      this.status,
      this.ticket_type,
      this.straw_no,
      this.bulltype);
}

class Ticket_history {
  String name;
  String address;
  String cost;
  int iscompleted;
  String date;
  String time;
  String level;
  String comment;
  String vllc;

  Ticket_history(
      {this.name = "",
      this.address = "",
      this.cost = "",
      this.iscompleted = 0,
      this.date = "",
      this.time = "",
      this.level = "",
      this.comment = "",
      this.vllc = ""});
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
  String doc_type;
  int Status;

  current_request(this.name, this.priroity, this.vllc, this.street, this.state,
      this.ticketid, this.date, this.level, this.doc_type, this.Status);
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
        if (i["Status"] == 2 || i["Status"] == 3) {
          tickethistory.add(Ticket_history(
            name: i["Name"],
            address: i["Address"],
            cost: i["price"],
            iscompleted: i["Status"],
            date: custom_date_formmat(i["Service_End_date"]),
            time: custom_time_formmat(i["Service_End_date"]),
            level: i["Level"],
            comment: i["Comments"],
            vllc: i["VLCC"],
          ));
        }
      }
      notifyListeners();
    });
  }

  addvalue_to_current_request(val) {
    customercard = [];
    val.forEach((key, value) {
      for (var i in value) {
        if (i["Status"] == 0) {
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
            i["Level"],
            i["Ticket_id"],
            i["Status"],
            i["Type"],
            i["cow_id"],
            i["Former_id"],
          ));
        }
      }
      notifyListeners();
    });
  }

  addvalue_to_assignment_request(val) {
    current_request_list = [];
    val.forEach((key, value) {
      for (var i in value) {
        if (i["Status"] == 1) {
          current_request_list.add(current_request(
            i["Name"],
            true,
            i["VLCC"],
            i["Address"],
            "Tamil Nadu,TN-630 000,",
            i["Ticket_id"],
            i["Ticket_Raised_date"],
            i["Level"],
            i["Type"],
            i["Status"],
          ));
        }
      }
      notifyListeners();
    });
  }

  custom_sorting(String calcendardate) {
    List<Customercard> lst = [];
    List temp = [];

    // print(calcendardate.substring(5, 7));
    int whole_date = int.parse(calcendardate.substring(0, 4) +
        calcendardate.substring(5, 6) +
        (int.parse(calcendardate.substring(6, 7))).toString() +
        calcendardate.substring(8, 10));
    print(whole_date);
    for (var i in customercard) {
      if (i.date_sort <= whole_date) {
        temp.add(i.date_sort);
      }
    }
    temp.sort((a, b) => -a.compareTo(b));
    Set seen = {};

    for (var i in temp) {
      for (var j in customercard) {
        if (i == j.date_sort && !seen.contains(j)) {
          lst.add(j);
          seen.add(j);
        }
      }
    }
    customercard = lst;
    notifyListeners();
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
