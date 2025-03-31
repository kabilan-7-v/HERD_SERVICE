import 'package:flutter/material.dart';
import 'package:herd_service/models/homemodel.dart';
import 'package:herd_service/server/service_availability_api.dart';
// import 'package:herd_service/models/customercard.dart';nn
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Alertservices extends StatefulWidget {
  const Alertservices({super.key});

  @override
  State<Alertservices> createState() => _AlertservicesState();
}

class _AlertservicesState extends State<Alertservices> {
  final TextEditingController _reason = TextEditingController();

  String finaldate = "select date";
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
      appBar: AppBar(
        leadingWidth: 40,
        backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
        scrolledUnderElevation: 0,
        title: Text(
          "Service Unavailability",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _key,
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
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 6.7,
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: TextFormField(
                        controller: _reason,
                        validator: (value) {
                          if (value!.isEmpty) return "Please type the Reason";
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 45.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          labelText: 'Reason',
                          hintText: "Type a Reason",
                          hintStyle:
                              TextStyle(color: Colors.grey[600], fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Avaiable Back On",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectDate(context);
                        });
                      },
                      child: Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Color.fromRGBO(70, 149, 184, 1)),
                        ),
                        child: Row(children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            finaldate,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.calendar_month_outlined),
                          SizedBox(
                            width: 15,
                          )
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: InkWell(
                      onTap: () async {
                        if (!_key.currentState!.validate()) return;
                        if (finaldate == "select date") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Please enter Avaiable Back On')),
                          );
                          return;
                        }
                        await Service_off(
                            context,
                            Provider.of<userprofiledetails>(context,
                                    listen: false)
                                .doctor_id,
                            _reason.text,
                            finaldate);
                        setState(() {});
                        Navigator.pop(context, false);
                      },
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromRGBO(70, 149, 184, 1)),
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 2,
                                color: const Color.fromRGBO(70, 149, 184, 1))),
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(70, 149, 184, 1)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 35,
                  )
                ],
              ),
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
