import 'package:flutter/material.dart';
import 'package:herd_service/customer_utility/customercontainer.dart';
import 'package:herd_service/models/customercard.dart';
import 'package:herd_service/models/homemodel.dart';
import 'package:herd_service/pages/notification.dart';
import 'package:herd_service/server/home_api.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required this.docto_id});
  final int docto_id;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int counter = 1;

  DateTime? selectedDate;
  final ScrollController _controller = ScrollController();

  String finaldata = DateFormat('MMMM d, yyyy').format(DateTime.now());
  String Date = "25 Jun 2024, 8am";

  void initState() {
    // TODO: implement initState
    // change_current_to_assign(context, 4);
    Appoimentresquestapi(context, widget.docto_id.toString());
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome Back!",
          style:
              TextStyle(color: Color.fromRGBO(132, 146, 190, 1), fontSize: 16),
        ),
        backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
        actions: <Widget>[
          // Using Stack to show Notification Badge
          new Stack(
            children: <Widget>[
              const SizedBox(
                width: 20,
              ),
              new IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Notificationpage(
                                doctor_id: Provider.of<userprofiledetails>(
                                        context,
                                        listen: false)
                                    .doctor_id)));
                  }),
              counter != 0
                  ? new Positioned(
                      right: 11,
                      top: 11,
                      child: new Container(
                        padding: EdgeInsets.all(2),
                        decoration: new BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
                        child: Text(
                          '$counter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : new Container()
            ],
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    context.watch<userprofiledetails>().username,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Provider.of<test>(context).current_request_list.length != 0
                  ? Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          "Current Request",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ],
                    )
                  : SizedBox(),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      Provider.of<test>(context).current_request_list.length,
                  itemBuilder: (context, ind) {
                    var res =
                        Provider.of<test>(context).current_request_list[ind];
                    return appoinment_Request(
                        Date,
                        res.priroity,
                        res.name,
                        res.vllc,
                        res.street,
                        res.state,
                        ind,
                        res.level.toLowerCase());
                  }),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Assignment",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 3),
                      ]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 80,
                          ),
                          Center(
                            child: Text(
                              finaldata,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.calendar_month_outlined),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Center(
                        child: width > 400
                            ? calendar1(Provider.of<userprofiledetails>(context)
                                .doctor_id)
                            : calendar(Provider.of<userprofiledetails>(context)
                                .doctor_id),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Provider.of<test>(context).customercard.length == 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Center(
                            child: Text(
                          "No Ticket found",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                      ],
                    )
                  : Center(
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              Provider.of<test>(context).customercard.length,
                          itemBuilder: (context, index) {
                            return Customercontainer(
                                card: Provider.of<test>(context)
                                    .customercard[index]);
                          }),
                    )
            ]),
      ),
    );
  }

  Widget appoinment_Request(date, priority, String name, vllc, street, state,
      int index, String level) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 30,
        height: 240,
        // color: Colors.black,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [const BoxShadow(color: Colors.grey, blurRadius: 3)],
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 20,
              height: 60,

              decoration: const BoxDecoration(
                  color: Color.fromRGBO(70, 149, 184, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(9),
                      topRight: Radius.circular(9))),
              // color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Appointment Request",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Image.asset("assets/icons/schedule.png"),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(
                          date,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.more_horiz_outlined,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 12,
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
              width: 60,
            ),
            Row(
              children: [
                SizedBox(
                  width: 99,
                ),
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                level == "mid"
                    ? Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              width: 3,
                              color: const Color.fromRGBO(242, 160, 36, 1),
                              style: BorderStyle.solid,
                            ),
                            color: Colors.white),
                        child: Center(
                            child: Text(
                          "Mid",
                          style: TextStyle(
                              color: Color.fromRGBO(242, 160, 36, 1),
                              fontWeight: FontWeight.bold),
                        )),
                      )
                    : level == "low"
                        ? Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  width: 3,
                                  color: const Color.fromRGBO(0, 105, 61, 1),
                                  style: BorderStyle.solid,
                                ),
                                color: Colors.white),
                            child: Center(
                                child: Text(
                              "Low",
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 105, 61, 1),
                                  fontWeight: FontWeight.bold),
                            )),
                          )
                        : level == "high"
                            ? Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.red,
                                      style: BorderStyle.solid,
                                    ),
                                    color: Colors.white),
                                child: Center(
                                    child: Text(
                                  "High",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                )),
                              )
                            : SizedBox(),
                // Image.asset("assets/icons/mid.png"),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 7,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "VLLC:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.black),
                          children: [
                            TextSpan(
                              text: vllc,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            )
                          ]),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "NO:",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.black),
                          children: [
                            TextSpan(
                              text: street,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            )
                          ]),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(state)
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(height: 40),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(150, 34),
                            backgroundColor:
                                const Color.fromRGBO(235, 239, 250, 1)),
                        onPressed: () {
                          print(Provider.of<test>(context, listen: false)
                              .current_request_list[index]
                              .ticketid);
                          change_current_to_assign(
                              context,
                              Provider.of<test>(context, listen: false)
                                  .current_request_list[index]
                                  .ticketid);
                        },
                        child: const Text(
                          "DECLINE",
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(height: 40),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(150, 34),
                            backgroundColor:
                                const Color.fromRGBO(70, 149, 184, 1)),
                        onPressed: () {
                          print(Provider.of<test>(context, listen: false)
                              .current_request_list[index]
                              .ticketid);

                          change_current_to_assign(
                              context,
                              Provider.of<test>(context, listen: false)
                                  .current_request_list[index]
                                  .ticketid);
                        },
                        child: const Text(
                          "ACCEPT",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _pickDate(String data) async {
    DateTime date = DateTime.parse(data);
    String formattedDate =
        (DateFormat('MMMM  dd, yyyy').format(date)).toUpperCase();

    finaldata = formattedDate;
  }

  calendar(doc) {
    return HorizontalCalendar(
      date: DateTime.parse("2024-06-23"),
      lastDate: DateTime.parse("2050-07-23"),
      initialDate: DateTime.parse("2024-06-23"),
      textColor: Colors.black,
      backgroundColor: Colors.white,
      selectedColor: const Color.fromRGBO(70, 149, 184, 1),
      // showMonth: true,
      locale: Localizations.localeOf(context),
      onDateSelected: (date) {
        _pickDate(date.toString());
        context.read<test>().custom_sorting(date.toString(), context, doc);
        setState(() {});
      },
    );
  }

  calendar1(doc) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width - 50, height: 70),
      child: HorizontalCalendar(
        date: DateTime.parse("2024-06-23"),
        initialDate: DateTime.parse("2024-06-23"),
        textColor: Colors.black,
        backgroundColor: Colors.white,
        selectedColor: const Color.fromRGBO(70, 149, 184, 1),
        // showMonth: true,
        locale: Localizations.localeOf(context),
        onDateSelected: (date) {
          _pickDate(date.toString());
          context.read<test>().custom_sorting(date.toString(), context, doc);

          setState(() {});
        },
      ),
    );
  }

  DateTime parseCustomDate(String dateString) {
    // Define the format pattern matching your input string
    final DateFormat formatter = DateFormat('MMMM dd,yyyy/h.mm a');
    return formatter.parse(dateString);
  }
}
