import 'package:flutter/material.dart';
import 'package:herd_service/customer_utility/customercard.dart';

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
        Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 140,
            margin: EdgeInsets.symmetric(horizontal: 10),
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
                        ? Image.asset("assets/icons/midbox.png")
                        : Image.asset("assets/icons/Lowbox.png"),
                    const SizedBox(
                      width: 5,
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 80,
                    ),
                    Text(
                      widget.card.name,
                      style: TextStyle(fontWeight: FontWeight.w500),
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
                        Text(
                          "Just Now",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(widget.card.address),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.8,
                            ),
                            Icon(Icons.more_horiz)
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icons/call.png"),
                            SizedBox(
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
                            SizedBox(
                              width: 3,
                            ),
                            Text(widget.card.date),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            )),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
