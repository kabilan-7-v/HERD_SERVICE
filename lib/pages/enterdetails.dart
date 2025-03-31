// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:herd_service/models/homemodel.dart';

import 'package:herd_service/pages/adddetails.dart';
import 'package:herd_service/pages/otppage.dart';
import 'package:herd_service/server/enterdetails_api.dart';
import 'package:herd_service/server/ticket_status_api.dart';
import 'package:herd_service/widget/bottomsheet..dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Enterdetails extends StatefulWidget {
  Enterdetails(
      {super.key,
      required this.ticket_id,
      required this.Straw_no,
      required this.bull_type});
  final String ticket_id;
  final int Straw_no;
  final int bull_type;

  @override
  State<Enterdetails> createState() => _EnterdetailsState();
}

class _EnterdetailsState extends State<Enterdetails> {
  final TextEditingController strawNumberController = TextEditingController();
  final TextEditingController bullTypeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController heatController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey();
  bool aitecnician = false;
  bool popup = false;
  XFile? temp;
  File? imageFile;
  bool ischeckbox = false;
  String selectdate = "Select Date";
  // Store the Base64-encoded string

  // Method to select and encode file to Base64
  @override
  void initState() {
    // TODO: implement initState
    setdate();
    super.initState();
  }

  void _showAnimatedBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // Transparent background for effect
      builder: (context) {
        return AnimatedBottomSheetContent();
      },
    );
  }

  void setdate() {
    DateTime today = DateTime.now();
    DateTime futureDate = today.add(Duration(days: 18));

    String formattedDate = DateFormat('yyyy-MM-dd').format(futureDate);
    setState(() {
      selectdate = formattedDate;
    });
  }

  selectFile() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        temp = file;
        imageFile = File(file.path);
        // Encode to Base64
      });
    }
  }

  @override
  void dispose() {
    strawNumberController.dispose();
    bullTypeController.dispose();
    priceController.dispose();
    heatController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Opacity(
          opacity: popup == true ? 0.3 : 1,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              appBar: AppBar(
                  scrolledUnderElevation: 0,
                  backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
                  title: Text(
                    "Enter Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
              backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
              // bottomSheet: isRaised
              //     ? AnimatedPositioned(
              //         duration: Duration(milliseconds: 500),
              //         curve: Curves.easeInOut,
              //         // left: 50,
              //         // right: 50,
              //         bottom: isRaised ? screenHeight / 2 - 100 : 20,
              //         child: Container(
              //           height: 350,
              //           width: double.infinity,
              //           alignment: Alignment.center,
              //           child: Text(
              //             "Animated Card",
              //             style: TextStyle(
              //                 fontSize: 18, fontWeight: FontWeight.bold),
              //           ),
              //         ),
              //       )
              //     : SizedBox(),
              // bottomNavigationBar: (aitecnician
              //     ? GestureDetector(
              //         onTap: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => Adddetails()));
              //         },
              //         child: Container(
              //           height: 60,
              //           width: MediaQuery.of(context).size.width / 1.8,
              //           decoration: BoxDecoration(
              //             color: const Color.fromRGBO(70, 149, 184, 1),
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               const Center(
              //                   child: Text(
              //                 "Add Details",
              //                 style: TextStyle(
              //                     fontSize: 24,
              //                     color: Colors.white,
              //                     fontWeight: FontWeight.bold),
              //               )),
              //               SizedBox(
              //                 width: 8,
              //               ),
              //               Image.asset("assets/img/upload_2.png")
              //             ],
              //           ),
              //         ),
              //       )
              //     : GestureDetector(
              //         onTap: () {
              //           _showAnimatedBottomSheet(context);
              //           // if (temp == null) {
              //           //   ScaffoldMessenger.of(context).showSnackBar(
              //           //       SnackBar(content: Text('Please add image')));
              //           //   return;
              //           // }

              //           // if (!_key.currentState!.validate()) return;

              //           // setState(() {
              //           //   popup = true;
              //           // });
              //         },
              //         child: Container(
              //           height: 60,
              //           width: MediaQuery.of(context).size.width / 1.8,
              //           decoration: BoxDecoration(
              //             color: const Color.fromRGBO(70, 149, 184, 1),
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               const Center(
              //                   child: Text(
              //                 "Upload Details",
              //                 style: TextStyle(
              //                     fontSize: 24,
              //                     color: Colors.white,
              //                     fontWeight: FontWeight.bold),
              //               )),
              //               SizedBox(
              //                 width: 8,
              //               ),
              //               Image.asset("assets/img/upload_2.png")
              //             ],
              //           ),
              //         ),
              //       )),
              body: SingleChildScrollView(
                child: Form(
                  key: _key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          selectFile();
                        },
                        child: Center(
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width - 20,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                imageFile == null ? SizedBox() : SizedBox(),
                                imageFile == null
                                    ? Image.asset(
                                        "assets/img/add_photo_alternate.png")
                                    : SizedBox(
                                        height: 165,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                40,
                                        child: Image.file(
                                          imageFile!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                Container(
                                  height: 35,
                                  width: MediaQuery.of(context).size.width - 20,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(70, 149, 184, 1),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(9),
                                          bottomRight: Radius.circular(9))),
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
                        ),
                      ),
                      buildTextField(
                        label: 'Straw Number',
                        hintText: 'Enter a Number',
                        controller: strawNumberController,
                        icon: Icons.edit,
                      ),
                      // const SizedBox(height: 16),
                      buildTextField(
                        label: 'Bull Type',
                        hintText: 'Enter a type',
                        controller: bullTypeController,
                        icon: Icons.category,
                      ),
                      // const SizedBox(height: 16),
                      buildTextField(
                        label: 'Price',
                        hintText: 'Enter a Price',
                        controller: priceController,
                        icon: Icons.currency_rupee,
                      ),
                      buildTextField(
                        label: 'Heat Of The Animal',
                        hintText: 'Enter a Heat Of The Animal',
                        controller: heatController,
                        icon: Icons.add_box_outlined,
                      ),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text("Follow Up",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 13),
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
                                        selectdate = (onValue.toString())
                                            .substring(0, 10);
                                        setState(() {});
                                      });
                                    },
                                    child: const Icon(
                                        Icons.calendar_month_outlined)),
                              )
                            ],
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text("Cross Breading Verification",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Spacer(),
                          Checkbox(
                              value: ischeckbox,
                              onChanged: (onChanged) {
                                setState(() {
                                  ischeckbox = onChanged!;
                                });
                              }),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
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
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            // keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter $label";
              }
              return null;
            },
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
                      child: Column(
                        children: [
                          Text(
                            "Are You Sure!",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                decorationColor:
                                    Color.fromRGBO(70, 149, 184, 1)),
                          ),
                          Text(
                            "You need to upload the Details?",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                decorationColor:
                                    Color.fromRGBO(70, 149, 184, 1)),
                          ),
                        ],
                      )),
                  Positioned(
                    top: 20,
                    right: 10,
                    child: GestureDetector(
                        onTap: () {
                          popup = false;
                          setState(() {});
                        },
                        child: const Icon(
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
                    onPressed: () async {
                      enterdetails_api(
                          imageFile!.absolute,
                          strawNumberController.text,
                          priceController.text,
                          bullTypeController.text,
                          widget.ticket_id,
                          Provider.of<userprofiledetails>(context,
                                  listen: false)
                              .doctor_id);
                      await ticket_update_start_api(
                          widget.ticket_id.toString());
                      await ticket_update_end_api(widget.ticket_id.toString());
                      setState(() {});
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
