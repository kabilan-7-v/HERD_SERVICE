import 'package:flutter/material.dart';
import 'package:herd_service/Local_data_user/doctor_details.dart';
import 'package:herd_service/models/customercard.dart';
import 'package:herd_service/models/homemodel.dart';
import 'package:herd_service/pages/ticketshow.dart';
import 'package:herd_service/server/home_api.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

class Tickethistory extends StatefulWidget {
  const Tickethistory({
    super.key,
  });

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
      backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
      body: LiquidPullToRefresh(
        onRefresh: () async {
          await doctor_details_local_data(context);
          await Appoimentresquestapi(
              context,
              Provider.of<userprofiledetails>(context, listen: false)
                  .doctor_id);
          await Future.delayed(Duration(seconds: 1));
        },
        showChildOpacityTransition: false,
        color: const Color.fromRGBO(70, 149, 184, 1),
        backgroundColor: Colors.white,
        animSpeedFactor: 10,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  BackButton(),
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
              SizedBox(
                height: 400,
              )
            ],
          ),
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
                data.iscompleted == 2 ? "Completed" : "Cancel",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 5,
              ),
              data.iscompleted == 2
                  ? Icon(
                      Icons.verified_rounded,
                      color: Colors.green,
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
