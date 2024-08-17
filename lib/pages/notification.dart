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
        body: SingleChildScrollView(
      child: Column(children: [
        const SizedBox(
          height: 50,
        ),
        const Row(
          children: [
            BackButton(),
            SizedBox(
              width: 10,
            ),
            Text(
              "Notification",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            // itemCount: 5,
            itemCount:
                Provider.of<NotifyModel>(context).Notification_lst.length,
            itemBuilder: (context, ind) {
              var res = Provider.of<NotifyModel>(context).Notification_lst;
              return notificationcard(
                  true, res[ind].date_time, res[ind].message, res[ind].status);
            })
      ]),
    ));
  }

  Widget notificationcard(blur, String date_time, String message, int status) {
    return Column(
      children: [
        Opacity(
          opacity: blur == true ? 1 : 0.3,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Icon(Icons.notification_add_outlined),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text(message),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text(date_time),
                )
              ],
            ),
          ),
        ),
        line(context),
      ],
    );
  }

  Widget line(BuildContext context) {
    return Container(
      height: 0.5,
      width: MediaQuery.of(context).size.width - 60,
      color: Colors.black,
    );
  }
}
