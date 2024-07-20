import 'package:herd_service/pages/appoinmentrequest.dart';

class Customercard {
  final String name;
  final String address;
  final String phonenumber;
  final String date;
  final priority;
  Customercard(
      this.name, this.address, this.phonenumber, this.date, this.priority);
}

List<Customercard> customercard = [
  Customercard("KRISHNA KUMAR(102MRC)", "POLLACHI,CBE", "9876543210",
      "JUNE 24,2024/7.00 AM", true),
  Customercard("KRISHNA KUMAR(102MRC)", "POLLACHI,CBE", "9876543210",
      "JUNE 24,2024/7.00 AM", false),
  Customercard("KRISHNA KUMAR(102MRC)", "POLLACHI,CBE", "9876543210",
      "JUNE 24,2024/7.00 AM", true),
  Customercard("KRISHNA KUMAR(102MRC)", "POLLACHI,CBE", "9876543210",
      "JUNE 24,2024/7.00 AM", false),
];

class Ticket_history {
  final String name;
  final String address;
  final String cost;
  final bool iscompleted;
  Ticket_history(this.name, this.address, this.cost, this.iscompleted);
}

List<Ticket_history> tickethistory = [
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
  Ticket_history("AJAY KUMAR", "POLLACHI", "800", true),
  Ticket_history("AJAY KUMAR", "POLLACHI", "800", false),
];

class current_request {
  final String name;
  final String vllc;
  final String street;
  final bool priroity;
  final String state;
  current_request(this.name, this.priroity, this.vllc, this.street, this.state);
}

List<current_request> current_request_list = [
  current_request("AJAY KUMAR (608MRC)", true, "POLLACHI",
      ":04,ABC Street,Pollachi,CBE", "Tamil Nadu,TN-630 000,"),
  current_request("AJAY KUMAR (608MRC)", false, "POLLACHI",
      ":04,ABC Street,Pollachi,CBE", "Tamil Nadu,TN-630 000,"),
  // current_request("AJAY KUMAR", "POLLACHI", "800", false),
  // current_request("AJAY KUMAR", "POLLACHI", "800", true),
];
