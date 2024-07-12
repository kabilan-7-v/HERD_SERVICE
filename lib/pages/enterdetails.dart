// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:herd_service/pages/otppage.dart';

class Enterdetails extends StatefulWidget {
  const Enterdetails({super.key});

  @override
  State<Enterdetails> createState() => _EnterdetailsState();
}

class _EnterdetailsState extends State<Enterdetails> {
  final TextEditingController strawNumberController = TextEditingController();
  final TextEditingController bullTypeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  bool popup = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: popup == true ? 0.3 : 1,
          child: Scaffold(
            backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
            body: SingleChildScrollView(
              child: Column(
                children: [
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
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Image.asset("assets/img/add_photo_alternate.png"),
                        Container(
                          height: 35,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(70, 149, 184, 1),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(9),
                                  bottomRight: Radius.circular(9))),
                          width: MediaQuery.of(context).size.width - 40,
                          child: const Center(
                            child: Text(
                              "Capture & Upload a Straw Photo",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  buildTextField(
                    label: 'Straw Number',
                    hintText: 'Enter a Number',
                    controller: strawNumberController,
                    icon: Icons.edit,
                  ),
                  const SizedBox(height: 16),
                  buildTextField(
                    label: 'Bull Type',
                    hintText: 'Enter a type',
                    controller: bullTypeController,
                    icon: Icons.category,
                  ),
                  const SizedBox(height: 16),
                  buildTextField(
                    label: 'Price',
                    hintText: 'Enter a Price',
                    controller: priceController,
                    icon: Icons.currency_rupee,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        popup = true;
                      });
                    },
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
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                          Image.asset("assets/img/upload_2.png")
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        popup == true ? confirmation_popup() : const SizedBox()
      ],
    );
  }

  Widget buildTextField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: Icon(icon),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget confirmation_popup() {
    return Positioned(
      bottom: MediaQuery.of(context).size.height / 3,
      left: MediaQuery.of(context).size.width / 7,
      child: Container(
          width: 300,
          height: 280,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(20))),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: 300,
                    height: 150,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(70, 149, 184, 1),
                        // color: Colors.black,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.elliptical(170, 70),
                            bottomRight: Radius.elliptical(170, 70))),
                  ),
                  Positioned(
                    top: 50,
                    left: 20,
                    child: Image.asset(
                        "assets/img/Are you Sure! You need to upload the Details_.png"),
                  ),
                  Positioned(
                    top: 20,
                    right: 10,
                    child: GestureDetector(
                        onTap: () {
                          popup = false;
                          setState(() {});
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints.tightFor(width: 220, height: 30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(330, 24),
                        backgroundColor: const Color.fromRGBO(4, 183, 159, 1)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Otppage()));
                    },
                    child: const Center(
                        child: Text(
                      "Yes",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ConstrainedBox(
                constraints:
                    const BoxConstraints.tightFor(width: 220, height: 30),
                child: OutlinedButton(
                  onPressed: () {
                    // Handle "Cancel" action
                    popup = false;
                    setState(() {});
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.teal), // border color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
