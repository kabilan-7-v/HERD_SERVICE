import 'package:flutter/material.dart';
import 'package:herd_service/customer_utility/customercard.dart';
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
          child: Container(
              width: MediaQuery.of(context).size.width - 25,
              height: 140,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  // ignore: prefer_const_literals_to_create_immutables
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(color: Colors.grey, blurRadius: 3),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      (widget.card.priority) == true
                          ? Container(
                              width: 43,
                              height: 22,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  border: Border.all(
                                    width: 2,
                                    color:
                                        const Color.fromRGBO(242, 160, 36, 1),
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
                            )
                          : Container(
                              width: 43,
                              height: 22,
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
                      const SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 80,
                      ),
                      Text(
                        widget.card.name,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Image.asset("assets/icons/schedule (1).png"),
                          ),
                          const Text(
                            "Just Now",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(widget.card.address),
                                Spacer(),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Appoinmentrequest()));
                                    },
                                    child: const Icon(Icons.more_horiz)),
                                SizedBox(
                                  width: 20,
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                Text(widget.card.date),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
