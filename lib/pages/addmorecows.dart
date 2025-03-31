import 'package:flutter/material.dart';
import 'package:herd_service/pages/enterdetails.dart';

class Addmorecows extends StatefulWidget {
  const Addmorecows({super.key});

  @override
  State<Addmorecows> createState() => _AddmorecowsState();
}

class _AddmorecowsState extends State<Addmorecows> {
  final List<String> items = [
    "Cow 1",
    "Cow 2",
    "Cow 3",
    "Cow 4",
    "Cow 5",
    "Cow 6",
    "Cow 7",
    "Cow 8",
    "Cow 9",
  ];
  final List<bool> isselected = [
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
          ),
          leadingWidth: 40,
          title: Text(
            "Add treatment",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: const Color.fromRGBO(70, 149, 184, 1),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80,
                    width: MediaQuery.of(context).size.width - 110,
                    child: Autocomplete<String>(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text.isEmpty) {
                          return const Iterable<String>.empty();
                        }
                        return items.where((item) => item
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase()));
                      },
                      onSelected: (String selection) {
                        print('You selected: $selection');
                      },
                      fieldViewBuilder: (context, textEditingController,
                          focusNode, onFieldSubmitted) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: textEditingController,
                            focusNode: focusNode,
                            decoration: InputDecoration(
                                labelText: "Enter a Cow Name",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.search)),
                          ),
                        );
                      },
                      optionsViewBuilder: (context, onSelected, options) {
                        return Material(
                          elevation: 4.0,
                          child: ListView(
                            padding: EdgeInsets.zero,
                            children: options.map((option) {
                              return ListTile(
                                title: Text(option),
                                onTap: () => onSelected(option),
                              );
                            }).toList(),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(70, 149, 184, 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                          child: Text(
                        "+ Add",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  isselected[0] = !isselected[0];
                  setState(() {});
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        "Cow 1",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: isselected[0]
                          ? Icon(
                              Icons.keyboard_arrow_down,
                              size: 34,
                            )
                          : Icon(Icons.arrow_forward_ios),
                    )
                  ],
                ),
              ),
              !isselected[0] ? Divider() : SizedBox(),
              isselected[0]
                  ? SizedBox(
                      height: 500,
                      child: Enterdetails(
                          ticket_id: "1", Straw_no: 1, bull_type: 1))
                  : SizedBox()
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {},
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width / 1.8,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(70, 149, 184, 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                    child: Text(
                  "Add Details",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  width: 8,
                ),
                Image.asset("assets/img/upload_2.png")
              ],
            ),
          ),
        ));
  }
}
