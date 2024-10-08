import 'package:flutter/material.dart';

class NotificationModels {
  String date_time;
  String message;
  int status;

  NotificationModels({this.date_time = "", this.message = "", this.status = 0});
}

class NotifyModel extends ChangeNotifier {
  List<NotificationModels> Notification_lst = [];
  Notification_request(val) {
    Notification_lst = [];

    for (var i in val) {
      Notification_lst.add(NotificationModels(
          date_time: i["date_time"],
          message: i["message"],
          status: i["status"]));
    }

    notifyListeners();
  }
}
