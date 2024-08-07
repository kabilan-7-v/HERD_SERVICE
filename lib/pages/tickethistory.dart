import 'package:flutter/material.dart';
import 'package:herd_service/models/customercard.dart';
import 'package:herd_service/pages/ticketshow.dart';

class Tickethistory extends StatelessWidget {
  const Tickethistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            const Row(
              children: [
                BackButton(),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Ticket History",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )
              ],
            ),

            // ticketcard(tickethistory[0], context)
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: tickethistory.length,
                itemBuilder: (context, ind) {
                  return ticketcard(tickethistory[ind], context);
                }),
          ],
        ),
      ),
    );
  }

  ticketcard(data, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Ticketshow()));
      },
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Text(
                "[" + data.name + "],",
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
                data.iscompleted == true ? "Completed" : "Cancel",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 5,
              ),
              data.iscompleted == true
                  ? Image.asset("assets/icons/complete.png")
                  : Image.asset("assets/icons/cancel.png"),
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
              Text(data.cost),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Image.asset("assets/icons/Line 70.png"),
          // Container(
          //   height: 2,
          //   width: MediaQuery.of(context).size.width - 40,
          //   color: ,
          // )
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
