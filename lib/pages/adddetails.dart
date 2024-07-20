import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Adddetails extends StatefulWidget {
  const Adddetails({super.key});

  @override
  State<Adddetails> createState() => _AdddetailsState();
}

class _AdddetailsState extends State<Adddetails> {
  String selectdate = "Select date";
  int Metro = 1;
  int carp = 1;

  var items = [
    '1',
  ];
  final TextEditingController price = TextEditingController();
  final TextEditingController medicine = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    "Enter Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.5,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(196, 196, 196, 1)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                                "assets/icons/medical_services.png"),
                          ),
                          const SizedBox(
                            height: 50,
                            width: 150,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search Medicine",
                                  hintStyle: TextStyle(
                                      fontSize: 13,
                                      color: Color.fromRGBO(196, 196, 196, 1))),
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.search),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  content: SizedBox(
                                    height: 300,
                                    width:
                                        MediaQuery.of(context).size.width - 40,
                                    child: Column(
                                      children: [
                                        Text(
                                          "Add New Medicine",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        buildTextField(
                                          label: 'Medicine',
                                          hintText: 'Type medicine name',
                                          controller: medicine,
                                          icon: Icons.add,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: 50,
                                          width: 120,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      70, 149, 184, 1)),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Quantity",
                                              ),
                                              DropdownButton(
                                                  items:
                                                      items.map((String items) {
                                                    return DropdownMenuItem(
                                                      value: items,
                                                      child: Text(items),
                                                    );
                                                  }).toList(),
                                                  onChanged: (item) {})
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Container(
                                          height: 60,
                                          width: 160,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.add,
                                                  color: Colors.white),
                                              Text(
                                                "Add",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Color.fromRGBO(
                                                  70, 149, 184, 1)),
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(70, 149, 184, 1),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            Text(
                              "Add",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Metronidazole"),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 20,
                          width: 80,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue.shade100),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Metro--;
                                  setState(() {});
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  color: Colors.blue.shade200,
                                  child: const Icon(
                                    Icons.remove,
                                    size: 13,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                Metro.toString(),
                                style: const TextStyle(fontSize: 12),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  Metro++;
                                  setState(() {});
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  color: Colors.blue.shade200,
                                  child: const Icon(
                                    Icons.add,
                                    size: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Center(
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width - 40,
                  color: Colors.white,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Carprofenzole"),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 20,
                          width: 80,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue.shade100),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                color: Colors.blue.shade200,
                                child: InkWell(
                                  onTap: () {
                                    carp--;
                                    setState(() {});
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    size: 13,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                carp.toString(),
                                style: const TextStyle(fontSize: 12),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  carp++;
                                  setState(() {});
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  color: Colors.blue.shade200,
                                  child: const Icon(
                                    Icons.add,
                                    size: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Center(
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Add more medicines",
                          style: TextStyle(
                              fontSize: 13,
                              color: Color.fromRGBO(196, 196, 196, 1)),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: InkWell(
                          child: Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1.6),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                                child: Icon(
                              Icons.add,
                              size: 15,
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Follow up's",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        child: Text(selectdate),
                      )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {
                              showDatePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2101),
                              ).then((onValue) {
                                selectdate =
                                    (onValue.toString()).substring(0, 10);
                                setState(() {});
                              });
                            },
                            child: const Icon(Icons.calendar_month_outlined)),
                      )
                    ],
                  )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width - 30,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromRGBO(196, 196, 196, 1)),
                          borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(35),
                        ],
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.message_outlined),
                            hintText: "Add comments here",
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(196, 196, 196, 1)),
                            border: InputBorder.none),
                      )),
                ),
              ),
              buildTextField(
                label: 'Price',
                hintText: 'Enter a Price',
                controller: price,
                icon: Icons.currency_rupee,
              ),
              Center(
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 1.8,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(70, 149, 184, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Center(
                          child: Text(
                        "Upload Details",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                      Image.asset("assets/img/upload_2.png"),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ));
  }

  Widget buildTextField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.black,
          labelText: "Price",
          // label: Container(),
          labelStyle: TextStyle(color: Colors.black),

          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(5)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(5)),
          hintText: hintText,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
