import 'dart:async';
import 'package:flutter/material.dart';
import 'package:herd_service/Local_data_user/doctor_details.dart';
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
  String Date = "un 2024, 8am";
  bool isloading = false;
  Timer? timer;

  void initState() {
    // change_current_to_assign(context, 4);
    initializeData();

    super.initState();
  }

  Future<void> initializeData() async {
    await doctor_details_local_data(context);
    await Appoimentresquestapi(context,
        Provider.of<userprofiledetails>(context, listen: false).doctor_id);

    setState(() {});
    timer = Timer.periodic(
      Duration(seconds: 2),
      (timer) async {
        if (!mounted) return await doctor_details_local_data(context);
        await Appoimentresquestapi(context,
            Provider.of<userprofiledetails>(context, listen: false).doctor_id);

        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    List<Customercard> customerCard = Provider.of<test>(context).customercard;
    // Future.delayed(Duration(seconds: 2));
    // Timer.periodic(Duration(seconds: 2), (Timer timer) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: SizedBox(),
        leadingWidth: 1,
        title: Text(
          context.watch<userprofiledetails>().username,
          style: TextStyle(
              fontFamily: "Proxima Nova",
              fontWeight: FontWeight.bold,
              fontSize: 28),
        ),
        backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
        actions: <Widget>[
          // Using Stack to show Notification Badge
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
                            doctor_id: Provider.of<userprofiledetails>(context,
                                    listen: false)
                                .doctor_id)));
              }),
        ],
      ),
      backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
            mainAxisSize: MainAxisSize.max,
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
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Provider.of<test>(context, listen: false)
                          .current_request_list
                          .length !=
                      0
                  ? Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Current Request",
                          style: TextStyle(
                              fontFamily: "Proxima Nova",
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  : SizedBox(),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: Provider.of<test>(context, listen: false)
                      .current_request_list
                      .length,
                  itemBuilder: (context, ind) {
                    var res = Provider.of<test>(context, listen: false)
                        .current_request_list[ind];
                    return appoinment_Request(
                        changedateformat(res.date),
                        res.priroity,
                        res.name,
                        res.vllc,
                        res.street,
                        res.state,
                        ind,
                        res.level.toLowerCase());
                  }),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      "Assigned",
                      style: TextStyle(
                          fontFamily: "Proxima Nova",
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
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
                            width: 120,
                          ),
                          Center(
                            child: Text(
                              finaldata,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
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
              isloading == true
                  ? CircularProgressIndicator()
                  : Provider.of<test>(context, listen: false)
                              .customercard
                              .length ==
                          0
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
                              itemCount: customerCard.length,
                              itemBuilder: (context, index) {
                                return Customercontainer(
                                    card: customerCard[index]);
                              }),
                        ),
            ]),
      ),
    );
  }

  changedateformat(date) {
    // Example date: 25 Jun 2024, 8:00am
    DateTime dateTime = DateTime.parse(date);

    // Format the date into "25 Jun 2024, 8am" format
    String formattedDate = DateFormat('d MMM yyyy, ha').format(dateTime);

    return formattedDate;
  }

  Widget appoinment_Request(date, priority, String name, vllc, street, state,
      int index, String level) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 25,
            height: 210,
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
                  height: 50,

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
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
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
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                  width: 60,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 99,
                    ),
                    Text(
                      name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2.5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 99,
                    ),
                    Text(
                      vllc,
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 99,
                    ),
                    Text(
                      street,
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 99,
                    ),
                    Text(state),
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
                              change_current_to_assign(
                                  context,
                                  Provider.of<test>(context, listen: false)
                                      .current_request_list[index]
                                      .ticketid);
                              setState(() {});
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
                            onPressed: () async {
                              await change_current_to_assign(
                                  context,
                                  Provider.of<test>(context, listen: false)
                                      .current_request_list[index]
                                      .ticketid);
                              setState(() {});
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
          level == "mid"
              ? Positioned(
                  left: 33,
                  top: 80,
                  child: Container(
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
                  ),
                )
              : level == "low"
                  ? Positioned(
                      left: 33,
                      top: 80,
                      child: Container(
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
                      ),
                    )
                  : level == "high"
                      ? Positioned(
                          left: 33,
                          top: 80,
                          child: Container(
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
                          ),
                        )
                      : SizedBox(),
        ],
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
      date: DateTime.now(),
      // showMonth: true,
      lastDate: DateTime.parse("2050-07-23"),
      initialDate: DateTime.now(),
      textColor: Colors.black,
      backgroundColor: Colors.white,
      selectedColor: const Color.fromRGBO(70, 149, 184, 1),
      // showMonth: true,
      locale: Localizations.localeOf(context),
      onDateSelected: (date) {
        isloading = true;

        _pickDate(date.toString());
        context.read<test>().custom_sorting(date.toString(), context, doc);
        isloading = false;
        setState(() {});
      },
    );
  }

  calendar1(doc) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width - 60, height: 70),
      child: HorizontalCalendar(
        date: DateTime.now(),
        initialDate: DateTime.parse("2024-06-23"),
        lastDate: DateTime.parse("2050-07-23"),

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
