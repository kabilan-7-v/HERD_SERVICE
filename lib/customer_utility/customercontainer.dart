import 'package:flutter/material.dart';
import 'package:herd_service/models/customercard.dart';
import 'package:herd_service/pages/appoinmentrequest.dart';

class Customercontainer extends StatefulWidget {
  final Customercard card;
  const Customercontainer({super.key, required this.card});

  @override
  State<Customercontainer> createState() => _CustomercontainerState();
}

class _CustomercontainerState extends State<Customercontainer> {
  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          right: true,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Appoinmentrequest(
                            card: widget.card,
                            phonenumber: widget.card.phonenumber,
                            date: widget.card.date,
                            time: widget.card.time,
                            name: widget.card.name,
                            priority: widget.card.priority,
                            vllc: widget.card.vllc,
                            street: widget.card.address,
                            comment: widget.card.comment,
                            ticket_id: widget.card.ticket_id.toString(),
                            doc_type: widget.card.ticket_type,
                            Straw_no: widget.card.straw_no,
                            bull_type: widget.card.bulltype,
                          )));
            },
            child: Stack(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width - 25,
                    height: 115,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        // ignore: prefer_const_literals_to_create_immutables
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(color: Colors.grey, blurRadius: 3),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 2.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 2),
                          child: Text(
                            widget.card.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            widget.card.vllc,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 13,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(widget.card.address),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset("assets/icons/call.png"),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(widget.card.phonenumber),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                          width: 15,
                                          child: Image.asset(
                                              "assets/icons/calendar_month.png")),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(widget.card.date +
                                          "  " +
                                          widget.card.time),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    )),
                (widget.card.level) == "mid"
                    ? Positioned(
                        right: 40,
                        top: 40,
                        child: Container(
                          width: 45,
                          height: 25,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                width: 2,
                                color: const Color.fromRGBO(242, 160, 36, 1),
                                style: BorderStyle.solid,
                              ),
                              color: Colors.white),
                          child: const Center(
                              child: Text(
                            "Mid",
                            style: TextStyle(
                                fontSize: 11,
                                color: Color.fromRGBO(242, 160, 36, 1),
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      )
                    : widget.card.level == "low"
                        ? Positioned(
                            right: 40,
                            top: 40,
                            child: Container(
                              width: 45,
                              height: 25,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  border: Border.all(
                                    width: 2,
                                    color: const Color.fromRGBO(0, 105, 61, 1),
                                    style: BorderStyle.solid,
                                  ),
                                  color: Colors.white),
                              child: const Center(
                                  child: Text(
                                "Low",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Color.fromRGBO(0, 105, 61, 1),
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          )
                        : widget.card.level == "high"
                            ? Positioned(
                                right: 40,
                                top: 40,
                                child: Container(
                                  width: 45,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.red,
                                        style: BorderStyle.solid,
                                      ),
                                      color: Colors.white),
                                  child: const Center(
                                      child: Text(
                                    "High",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              )
                            : SizedBox(),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
