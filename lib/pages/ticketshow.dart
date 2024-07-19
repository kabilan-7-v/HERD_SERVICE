import 'package:flutter/material.dart';

class Ticketshow extends StatelessWidget {
  const Ticketshow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 50,
        ),
        Row(
          children: [
            BackButton(),
            SizedBox(
              width: 10,
            ),
            Text(
              "Ticket #55BOC678",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Text(
            "AJAY KUMAR",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              "VLCC:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text("Pollachi"),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Text("NO:04, ABC Street, Pollachi, CBE"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Text("Tamil Nadu, TN-636 000."),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Text("Ticket Completed on 27th June, 5.30 PM"),
        ),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Text(
            "Ticket Completion details",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        )
      ]),
    );
  }
}
