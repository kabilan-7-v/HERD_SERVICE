// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:herd_service/models/homemodel.dart';
import 'package:herd_service/server/managepassword_api.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Managepassword extends StatefulWidget {
  const Managepassword({
    super.key,
    required this.pass,
  });
  final String pass;

  @override
  State<Managepassword> createState() => _ManagepasswordState();
}

class _ManagepasswordState extends State<Managepassword> {
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController _currentpassword = TextEditingController();
  final TextEditingController _newpasswordController = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
  String? pass;

  @override
  void dispose() {
    // TODO: implement dispose
    _currentpassword.dispose();
    _newpasswordController.dispose();
    _confirmpassword.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    password();
    super.initState();
  }

  password() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    pass = prefs.getString("password");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
          leadingWidth: 40,
          title: Text(
            "Manage Password",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
        body: SingleChildScrollView(
          child: Form(
            key: _key,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 20,
              ),
              Custom_Textfield(
                  context,
                  const Icon(Icons.lock_outlined),
                  "Enter Current Password",
                  "Please enter Current Password",
                  _currentpassword),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Text(
                  "New Password",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Custom_Textfield(
                  context,
                  const Icon(Icons.lock_outlined),
                  "New Password",
                  "Please enter New Password",
                  _newpasswordController),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Text(
                  "Confirm Password",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Custom_Textfield(
                  context,
                  const Icon(Icons.lock_outlined),
                  "Confirm Password",
                  "Please enter Confirm Password",
                  _confirmpassword),
              const SizedBox(
                height: 55,
              ),
              click_button(
                context,
              ),
            ]),
          ),
        ));
  }

  click_button(
    BuildContext context,
  ) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
            width: MediaQuery.of(context).size.width - 50, height: 50),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(520, 34),
              backgroundColor: const Color.fromRGBO(70, 149, 184, 1)),
          onPressed: () {
            if (!_key.currentState!.validate()) return;

            if (_currentpassword.text != pass) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Please check the current Password')),
              );
              return;
            }
            if (_confirmpassword.text != _newpasswordController.text) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        'The New password and current password doesnot match')),
              );
              return;
            }
            if (!isValidString(_confirmpassword.text)) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        'Invalid input! Please include at least 1 digit, 1 special character, and 8 characters.')),
              );
              return;
            }

            int id = Provider.of<userprofiledetails>(context, listen: false)
                .doctor_id;
            Managepassword_api(
                context, _newpasswordController.text, id.toString());

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Your password changed succesfully')),
            );
            Navigator.pop(context);
          },
          child: const Center(
              child: Text(
            "Change Password",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          )),
        ),
      ),
    );
  }

  bool isValidString(String input) {
    // Regular expression to check for at least one digit, one special character, and a minimum length of 8
    final regex = RegExp(
        r'^(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,}$');

    return regex.hasMatch(input);
  }

  Widget Custom_Textfield(
      BuildContext context, icon, hinttext, errormessage, _controller) {
    return Center(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width - 35,
        child: TextFormField(
          controller: _controller,
          validator: (value) {
            if (value!.isEmpty) return errormessage;

            return null;
          },
          onTap: () async {
            await Future.delayed(Duration(milliseconds: 300));
          },
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              hintText: hinttext,
              hintStyle: TextStyle(color: Colors.grey[600], fontSize: 18),
              prefixIcon: icon),
        ),
      ),
    );
  }
}
