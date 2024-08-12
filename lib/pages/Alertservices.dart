import 'package:flutter/material.dart';
// import 'package:herd_service/models/customercard.dart';nn
import 'package:intl/intl.dart';

class Alertservices extends StatefulWidget {
  const Alertservices({super.key});

  @override
  State<Alertservices> createState() => _AlertservicesState();
}

class _AlertservicesState extends State<Alertservices> {
  String finaldate = "select date";
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
            ),
            AlertDialog(
              insetPadding: EdgeInsets.only(left: 7, right: 7),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: Builder(builder: (context) {
                return Form(
                  key: _key,
                  child: Container(
                    height: 400,
                    width: 750,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                          )
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Reason",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 7,
                                width: MediaQuery.of(context).size.width / 1.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5)),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty)
                                      return "Please type the Reason";
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 45.0, horizontal: 10.0),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    labelText: 'Reason',
                                    hintText: "Type a Reason",
                                    hintStyle: TextStyle(
                                        color: Colors.grey[600], fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Avaiable Back On",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _selectDate(context);
                                });
                              },
                              child: Container(
                                height: 60,
                                width: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Color.fromRGBO(70, 149, 184, 1)),
                                ),
                                child: Row(children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(finaldate),
                                  Spacer(),
                                  Icon(Icons.calendar_month_outlined),
                                  SizedBox(
                                    width: 5,
                                  )
                                ]),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context, true);
                              },
                              child: Container(
                                height: 45,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 2,
                                        color: const Color.fromRGBO(
                                            70, 149, 184, 1))),
                                child: Center(
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromRGBO(
                                            70, 149, 184, 1)),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (!_key.currentState!.validate()) return;

                                Navigator.pop(context, false);
                              },
                              child: Container(
                                height: 45,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color:
                                        const Color.fromRGBO(70, 149, 184, 1)),
                                child: Center(
                                  child: Text(
                                    "Confirm",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 35,
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        finaldate = DateFormat(
          "yyyy,MM,dd",
        ).format(picked);
        // });
      });
    }
  }
}
