import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:herd_service/customer_utility/customercontainer.dart';
import 'package:herd_service/models/customercard.dart';
import 'package:herd_service/models/homemodel.dart';
import 'package:herd_service/profile/notification.dart';
import 'package:herd_service/server/home_api.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool accept = true;
  int counter = 1;

  DateTime? selectedDate;
  final ScrollController _controller = ScrollController();

  String finaldata = DateFormat('MMMM d, yyyy').format(DateTime.now());
  String Date = "25 Jun 2024, 8am";

  void initState() {
    // TODO: implement initState
    // change_current_to_assign(context, 5);
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
                            builder: (context) => Notificationpage()));
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
              accept
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
              accept
                  ? ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: Provider.of<test>(context)
                          .current_request_list
                          .length,
                      itemBuilder: (context, ind) {
                        var res = Provider.of<test>(context)
                            .current_request_list[ind];
                        return appoinment_Request(Date, res.priroity, res.name,
                            res.vllc, res.street, res.state, ind);
                      })
                  : const SizedBox(),
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
                        child: width > 400 ? calendar1() : calendar(),
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
              Center(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: Provider.of<test>(context).customercard.length,
                    itemBuilder: (context, index) {
                      return Customercontainer(
                          card: Provider.of<test>(context).customercard[index]);
                    }),
              )
            ]),
      ),
    );
  }

  Widget appoinment_Request(
      date, priority, String name, vllc, street, state, int index) {
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
                priority == true
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
                          priority == true ? "Mid" : "Low",
                          style: TextStyle(
                              color: Color.fromRGBO(242, 160, 36, 1),
                              fontWeight: FontWeight.bold),
                        )),
                      )
                    : Container(
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
                          priority == true ? "Mid" : "Low",
                          style: TextStyle(
                              color: Color.fromRGBO(0, 105, 61, 1),
                              fontWeight: FontWeight.bold),
                        )),
                      ),
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
                          Provider.of<test>(context)
                              .current_request_list
                              .removeAt(index);
                          setState(() {
                            accept = false;
                          });
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
                          change_current_to_assign(
                              context,
                              Provider.of<test>(context, listen: false)
                                  .current_request_list[index]
                                  .ticketid);

                          // var res = Provider.of<test>(context)
                          //     .current_request_list
                          //     .removeAt(index);
                          // customercard.insert(
                          //     0,
                          //     Customercard(res.name, res.vllc, "089786w445",
                          //         date, res.priroity, 3));
                          // if (Provider.of<test>(context)
                          //     .current_request_list
                          //     .isEmpty) {
                          //   accept = false;
                          // }
                          // setState(() {});
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

  calendar() {
    return HorizontalCalendar(
      date: DateTime.now(),

      initialDate: DateTime.parse("2024-07-23"),
      textColor: Colors.black,
      backgroundColor: Colors.white,
      selectedColor: const Color.fromRGBO(70, 149, 184, 1),
      // showMonth: true,
      locale: Localizations.localeOf(context),
      onDateSelected: (date) {
        // _pickDate(date.toString());
        // custom_sorting(date.toString());
        // setState(() {});
      },
    );
  }

  calendar1() {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width - 50, height: 70),
      child: HorizontalCalendar(
        date: DateTime.now(),
        initialDate: DateTime.now(),
        textColor: Colors.black,
        backgroundColor: Colors.white,
        selectedColor: const Color.fromRGBO(70, 149, 184, 1),
        // showMonth: true,
        locale: Localizations.localeOf(context),
        onDateSelected: (date) {
          _pickDate(date.toString());
          setState(() {});
        },
      ),
    );
  }

  custom_sorting(String calcendardate) {
    List<Customercard> lst = [];
    List temp = [];
    List customercard = Provider.of<test>(context).customercard;
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

    setState(() {
      customercard = lst;
    });
  }

  DateTime parseCustomDate(String dateString) {
    // Define the format pattern matching your input string
    final DateFormat formatter = DateFormat('MMMM dd,yyyy/h.mm a');
    return formatter.parse(dateString);
  }
}
