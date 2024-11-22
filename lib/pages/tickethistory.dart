// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:herd_service/models/customercard.dart';
import 'package:herd_service/pages/ticketshow.dart';
import 'package:provider/provider.dart';

class Tickethistory extends StatefulWidget {
  Tickethistory({super.key, required this.backbuttonverify});
  bool backbuttonverify;
  @override
  State<Tickethistory> createState() => _TickethistoryState();
}

class _TickethistoryState extends State<Tickethistory> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
        leading: widget.backbuttonverify == false ? BackButton() : SizedBox(),
        leadingWidth: widget.backbuttonverify == false ? 30 : 0,
        title: Text(
          "Ticket History",
          style: TextStyle(
              fontFamily: "Proxima Nova",
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
      ),
      backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ticketcard(tickethistory[0], context)
            Provider.of<test>(context, listen: false).tickethistory.length == 0
                ? Column(
                    children: [
                      SizedBox(
                        height: 250,
                      ),
                      Icon(
                        Icons.airplane_ticket_outlined,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      const Center(
                        child: Text(
                          "No Ticket Historys",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Proxima Nova",
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: Provider.of<test>(context, listen: false)
                        .tickethistory
                        .length,
                    itemBuilder: (context, ind) {
                      return ticketcard(
                          Provider.of<test>(context, listen: false)
                              .tickethistory[ind],
                          context,
                          ind);
                    }),
          ],
        ),
      ),
    );
  }

  ticketcard(data, BuildContext context, ind) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Ticketshow(
                      date: data.date,
                      time: data.time,
                      name: data.name,
                      vllc: data.vllc,
                      street: data.address,
                      priority: data.level,
                      comment: data.comment,
                      status: data.iscompleted,
                    )));
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    data.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Text(data.address),
                  const Spacer(),
                  Text(
                    data.iscompleted == 2 ? "Completed" : "Cancel",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  data.iscompleted == 2
                      ? SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset(
                              "assets/icons/check_circle_24dp_6BBE4F.png"),
                        )
                      // ? Image.asset("assets/icons/complete.png")
                      : custom_checker(Colors.red),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Image.asset("assets/icons/currency_rupee (1).png"),
                  Text(data.cost == "null" ? "0" : data.cost),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: List.generate(
                    150,
                    (index) => Expanded(
                          child: Container(
                            color: Colors.grey,
                            height: 1,
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }

  custom_checker(color) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        color: color,
        // border: Border.all(),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          Icons.close,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }
}
