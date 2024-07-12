import 'package:flutter/material.dart';

class Enterdetails extends StatefulWidget {
  const Enterdetails({super.key});

  @override
  State<Enterdetails> createState() => _EnterdetailsState();
}

class _EnterdetailsState extends State<Enterdetails> {
  final TextEditingController strawNumberController = TextEditingController();
  final TextEditingController bullTypeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
      body: Column(
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width / 1.8,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(70, 149, 184, 1),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                    child: Text(
                  "Upload Details",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
                Image.asset("assets/img/upload_2.png")
              ],
            ),
          )
        ],
      ),
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
}
