import 'package:flutter/material.dart';

class Notificationpage extends StatelessWidget {
  const Notificationpage({super.key});

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
        notificationcard(true),
        line(context),
        notificationcard(true),
        line(context),
        notificationcard(false),
        line(context),
        notificationcard(false),
        line(context),
      ]),
    ));
  }

  Widget notificationcard(blur) {
    return Opacity(
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
                Image.asset("assets/icons/notifications_unread.png"),
                const SizedBox(
                  width: 9,
                ),
                const Text("Dear "),
                const Text("[Patient's Name]")
              ],
            ),
            const Row(
              children: [
                SizedBox(
                  width: 46,
                ),
                Text(
                    "Your appointment with Dr. [Doctor's Name] on \n [Date] at [Time] has been cancelled. If you need \n to reschedule, please contact us at [Phone\n Number] or visit [App/Website Link].\n We apologize for any inconvenience this may\n cause.\n 2 Hours Ago"),
              ],
            )
          ],
        ),
      ),
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
