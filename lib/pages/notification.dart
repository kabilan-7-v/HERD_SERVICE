import 'package:flutter/material.dart';
import 'package:herd_service/models/Notification_models.dart';

import 'package:herd_service/server/Notificationapi.dart';
import 'package:provider/provider.dart';

class Notificationpage extends StatefulWidget {
  const Notificationpage({super.key, required this.doctor_id});
  final int doctor_id;

  @override
  State<Notificationpage> createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> {
  @override
  void initState() {
    // TODO: implement initState
    Notification_api(context, widget.doctor_id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
          elevation: 0,
          scrolledUnderElevation: 0,
          shadowColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          leading: BackButton(),
          title: Text(
            "Notification",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Provider.of<NotifyModel>(context).Notification_lst.length == 0
                ? Column(
                    children: [
                      SizedBox(
                        height: 250,
                      ),
                      SizedBox(
                          height: 22,
                          width: 22,
                          child: Image.asset(
                              "assets/icons/notification_unread.png")),
                      SizedBox(
                        height: 20,
                      ),
                      const Center(
                        child: Text(
                          "No Notifications",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    // itemCount: 5,
                    itemCount: Provider.of<NotifyModel>(context)
                        .Notification_lst
                        .length,
                    itemBuilder: (context, ind) {
                      var res =
                          Provider.of<NotifyModel>(context).Notification_lst;
                      return notificationcard(true, res[ind].date_time,
                          res[ind].message, res[ind].status);
                    })
          ]),
        ));
  }

  Widget notificationcard(blur, String date_time, String message, int status) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                      height: 22,
                      width: 22,
                      child:
                          Image.asset("assets/icons/notification_unread.png")),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      customname(message),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(message),
              ),
            ],
          ),
        ),
        line(context),
      ],
    );
  }

  customname(msg) {
    List lst = msg.split("on")[0].split(" ");
    return lst.getRange(3, lst.length).join(" ");
  }

  Widget line(BuildContext context) {
    return Container(
      height: 0.5,
      width: MediaQuery.of(context).size.width - 30,
      color: Colors.black,
    );
  }
}
