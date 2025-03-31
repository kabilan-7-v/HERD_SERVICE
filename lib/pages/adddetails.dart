import 'package:flutter/material.dart';
import 'package:herd_service/models/Ai_enter_details.dart';
import 'package:herd_service/models/homemodel.dart';
import 'package:herd_service/server/ai_medicine_api.dart';
import 'package:herd_service/server/home_api.dart';
import 'package:provider/provider.dart';

class Adddetails extends StatefulWidget {
  const Adddetails(
      {super.key, this.ticketid, this.cowid, this.farmerid, this.docid});
  final String? ticketid;
  final String? cowid;
  final String? farmerid;
  final String? docid;

  @override
  State<Adddetails> createState() => _AdddetailsState();
}

class _AdddetailsState extends State<Adddetails> {
  String selectdate = "Select date";
  int Metro = 1;
  int carp = 1;
  bool click_search = false;
  List medical_lst = [];
  String search_med = "";

  var items = [
    '1',
  ];
  final TextEditingController price = TextEditingController();
  final TextEditingController medicine = TextEditingController();

  final TextEditingController _comment_controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initStated
    Ai_enterdetails_api(context);
    context.read<Med>().close();
    // get_medlist_api();
    super.initState();
  }

  void dispose() {
    _comment_controller.dispose();
    price.dispose();
    medicine.dispose();
    super.dispose();
  }

  List finallist = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          // appBar: AppBar(
          //   leadingWidth: 40,
          //   scrolledUnderElevation: 0,
          //   backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
          //   title: Text(
          //     "Enter Details",
          //     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          //   ),
          // ),
          backgroundColor: const Color.fromRGBO(242, 240, 240, 1),
          body: SingleChildScrollView(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width - 40,
                            child: TextFormField(
                              onChanged: (value) {
                                search_med = value;
                                setState(() {});
                                context
                                    .read<Med_list>()
                                    .sorting_med(value, context);
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  suffixIcon: Icon(Icons.search),
                                  prefixIcon:
                                      Icon(Icons.medical_information_outlined),
                                  hintText: "Search Medicine",
                                  hintStyle: TextStyle(
                                      fontSize: 13,
                                      color: Color.fromRGBO(196, 196, 196, 1))),
                            ),
                          ),
                        ),
                        // Expanded(
                        //   child: InkWell(
                        //     onTap: () {
                        //       showDialog(
                        //           context: context,
                        //           builder: (_) => AlertDialog(
                        //                 content: SizedBox(
                        //                   height: 300,
                        //                   width:
                        //                       MediaQuery.of(context).size.width - 40,
                        //                   child: Column(
                        //                     children: [
                        //                       Text(
                        //                         "Add New Medicine",
                        //                         style: TextStyle(
                        //                             fontWeight: FontWeight.bold),
                        //                       ),
                        //                       buildTextField(
                        //                         label: 'Medicine',
                        //                         hintText: 'Type medicine name',
                        //                         controller: medicine,
                        //                         icon: Icons.add,
                        //                       ),
                        //                       SizedBox(
                        //                         height: 20,
                        //                       ),
                        //                       Container(
                        //                         height: 50,
                        //                         width: 120,
                        //                         decoration: BoxDecoration(
                        //                             border: Border.all(
                        //                                 color: Color.fromRGBO(
                        //                                     70, 149, 184, 1)),
                        //                             borderRadius:
                        //                                 BorderRadius.circular(10)),
                        //                         child: Row(
                        //                           mainAxisAlignment:
                        //                               MainAxisAlignment.start,
                        //                           children: [
                        //                             SizedBox(
                        //                               width: 10,
                        //                             ),
                        //                             Text(
                        //                               "Quantity",
                        //                             ),
                        //                             DropdownButton(
                        //                                 items:
                        //                                     items.map((String items) {
                        //                                   return DropdownMenuItem(
                        //                                     value: items,
                        //                                     child: Text(items),
                        //                                   );
                        //                                 }).toList(),
                        //                                 onChanged: (item) {})
                        //                           ],
                        //                         ),
                        //                       ),
                        //                       SizedBox(
                        //                         height: 30,
                        //                       ),
                        //                       Container(
                        //                         height: 60,
                        //                         width: 160,
                        //                         child: Row(
                        //                           mainAxisAlignment:
                        //                               MainAxisAlignment.center,
                        //                           children: [
                        //                             Icon(Icons.add,
                        //                                 color: Colors.white),
                        //                             Text(
                        //                               "Add",
                        //                               style: TextStyle(
                        //                                   color: Colors.white),
                        //                             )
                        //                           ],
                        //                         ),
                        //                         decoration: BoxDecoration(
                        //                             borderRadius:
                        //                                 BorderRadius.circular(10),
                        //                             color: Color.fromRGBO(
                        //                                 70, 149, 184, 1)),
                        //                       )
                        //                     ],
                        //                   ),
                        //                 ),
                        //               ));
                        //     },
                        //     child: Container(
                        //       height: 50,
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(10),
                        //         color: const Color.fromRGBO(70, 149, 184, 1),
                        //       ),
                        //       child: const Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Icon(
                        //             Icons.add,
                        //             color: Colors.white,
                        //           ),
                        //           Text(
                        //             "Add",
                        //             style: TextStyle(
                        //               color: Colors.white,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    search_med.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              height:
                                  Provider.of<Med_list>(context, listen: false)
                                              .medlist
                                              .length ==
                                          1
                                      ? 45
                                      : Provider.of<Med_list>(context,
                                                          listen: false)
                                                      .medlist
                                                      .length -
                                                  4 ==
                                              2
                                          ? 90
                                          : 150,
                              width: MediaQuery.of(context).size.width - 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              child: Provider.of<Med_list>(context,
                                              listen: false)
                                          .medlist
                                          .length ==
                                      0
                                  ? Center(
                                      child: Text(
                                      "No medicine found",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ))
                                  : ListView.builder(
                                      padding: EdgeInsets.zero,
                                      itemCount: Provider.of<Med_list>(
                                        context,
                                      ).medlist.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, ind) {
                                        return InkWell(
                                          onTap: () {
                                            FocusScope.of(context).unfocus();

                                            var res = Provider.of<Med_list>(
                                                    context,
                                                    listen: false)
                                                .medlist[ind];
                                            context.read<Med>().Add_med_func(
                                                  res["medid"],
                                                  res["medname"],
                                                  res["availqty"],
                                                  res["price"],
                                                );
                                            context
                                                .read<Med>()
                                                .change_totprice();
                                            price.text = Provider.of<Med>(
                                                            context,
                                                            listen: false)
                                                        .tot_price
                                                        .toString() ==
                                                    "0"
                                                ? "Price"
                                                : Provider.of<Med>(context,
                                                        listen: false)
                                                    .tot_price
                                                    .toString();
                                            setState(() {});
                                          },
                                          child: Column(
                                            children: [
                                              ListTile(
                                                trailing: Text(
                                                  "₹" +
                                                      Provider.of<Med_list>(
                                                                  context,
                                                                  listen: false)
                                                              .medlist[ind]
                                                          ["price"],
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                                minTileHeight: 5,
                                                title: Text(
                                                    Provider.of<Med_list>(
                                                                context,
                                                                listen: false)
                                                            .medlist[ind]
                                                        ["medname"]),
                                              ),
                                              Divider()
                                            ],
                                          ),
                                        );
                                      }),
                            ),
                          )
                        : SizedBox(),
                    const SizedBox(
                      height: 30,
                    ),
                    custom_medical_store(),
                    const SizedBox(
                      height: 30,
                    ),
                    // // Center(
                    // //   child: Container(
                    // //     height: 40,
                    // //     width: MediaQuery.of(context).size.width - 40,
                    // //     decoration: const BoxDecoration(
                    // //       color: Colors.white,
                    // //       borderRadius: BorderRadius.only(
                    // //         topRight: Radius.circular(20),
                    // //         topLeft: Radius.circular(20),
                    // //       ),
                    // //     ),
                    // //     child: Row(
                    // //       children: [
                    // //         const Padding(
                    // //           padding: EdgeInsets.all(8.0),
                    // //           child: Text("Metronidazole"),
                    // //         ),
                    // //         const Spacer(),
                    // //         Padding(
                    // //           padding: const EdgeInsets.all(8.0),
                    // //           child: Container(
                    // //             height: 20,
                    // //             width: 80,
                    // //             decoration: BoxDecoration(
                    // //                 border: Border.all(color: Colors.blue.shade100),
                    // //                 borderRadius: BorderRadius.circular(5)),
                    // //             child: Row(
                    // //               children: [
                    // //                 InkWell(
                    // //                   onTap: () {
                    // //                     Metro--;
                    // //                     setState(() {});
                    // //                   },
                    // //                   child: Container(
                    // //                     height: 20,
                    // //                     width: 20,
                    // //                     color: Colors.blue.shade200,
                    // //                     child: const Icon(
                    // //                       Icons.remove,
                    // //                       size: 13,
                    // //                     ),
                    // //                   ),
                    // //                 ),
                    // //                 const Spacer(),
                    // //                 Text(
                    // //                   Metro.toString(),
                    // //                   style: const TextStyle(fontSize: 12),
                    // //                 ),
                    // //                 const Spacer(),
                    // //                 InkWell(
                    // //                   onTap: () {
                    // //                     Metro++;
                    // //                     setState(() {});
                    // //                   },
                    // //                   child: Container(
                    // //                     height: 20,
                    // //                     width: 20,
                    // //                     color: Colors.blue.shade200,
                    // //                     child: const Icon(
                    // //                       Icons.add,
                    // //                       size: 13,
                    // //                     ),
                    // //                   ),
                    // //                 ),
                    // //               ],
                    // //             ),
                    // //           ),
                    // //         )
                    // //       ],
                    // //     ),
                    // //   ),
                    // // ),
                    // // const SizedBox(
                    // //   height: 1,
                    // // ),
                    // // Center(
                    // //   child: Container(
                    // //     height: 40,
                    // //     width: MediaQuery.of(context).size.width - 40,
                    // //     color: Colors.white,
                    // //     child: Row(
                    // //       children:
                    // //         const Padding(
                    // //           padding: EdgeInsets.symmetric(horizontal: 10),
                    // //           child: Text("Carprofenzole"),
                    // //         ),
                    // //         const Spacer(),
                    // //         Padding(
                    // //           padding: const EdgeInsets.all(8.0),
                    // //           child: Container(
                    // //             height: 20,
                    // //             width: 80,
                    // //             decoration: BoxDecoration(
                    // //                 border: Border.all(color: Colors.blue.shade100),
                    // //                 borderRadius: BorderRadius.circular(5)),
                    // //             child: Row(
                    // //               children: [
                    // //                 Container(
                    // //                   height: 20,
                    // //                   width: 20,
                    // //                   color: Colors.blue.shade200,
                    // //                   child: InkWell(
                    // //                     onTap: () {
                    // //                       carp--;
                    // //                       setState(() {});
                    // //                     },
                    // //                     child: const Icon(
                    // //                       Icons.remove,
                    // //                       size: 13,
                    // //                     ),
                    // //                   ),
                    // //                 ),
                    // //                 const Spacer(),
                    // //                 Text(
                    // //                   carp.toString(),
                    // //                   style: const TextStyle(fontSize: 12),
                    // //                 ),
                    // //                 const Spacer(),
                    // //                 InkWell(
                    // //                   onTap: () {
                    // //                     carp++;
                    // //                     setState(() {});
                    // //                   },
                    // //                   child: Container(
                    // //                     height: 20,
                    // //                     width: 20,
                    // //                     color: Colors.blue.shade200,
                    // //                     child: const Icon(
                    // //                       Icons.add,
                    // //                       size: 13,
                    // //                     ),
                    // //                   ),
                    // //                 ),
                    // //               ],
                    // //             ),
                    // //           ),
                    // //         )
                    // //       ],
                    // //     ),
                    // //   ),
                    // // ),
                    // const SizedBox(
                    //   height: 1,
                    // ),
                    // Center(
                    //   child: Container(
                    //     height: 40,
                    //     width: MediaQuery.of(context).size.width - 40,
                    //     decoration: const BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.only(
                    //         bottomLeft: Radius.circular(20),
                    //         bottomRight: Radius.circular(20),
                    //       ),
                    //     ),
                    //     child: Row(
                    //       children: [
                    //         const Padding(
                    //           padding: EdgeInsets.all(8.0),
                    //           child: Text(
                    //             "Add more medicines",
                    //             style: TextStyle(
                    //                 fontSize: 13,
                    //                 color: Color.fromRGBO(196, 196, 196, 1)),
                    //           ),
                    //         ),
                    //         const Spacer(),
                    //         Padding(
                    //           padding: const EdgeInsets.symmetric(horizontal: 15),
                    //           child: InkWell(
                    //             child: Container(
                    //               width: 18,
                    //               height: 18,
                    //               decoration: BoxDecoration(
                    //                   border: Border.all(width: 1.6),
                    //                   borderRadius: BorderRadius.circular(10)),
                    //               child: const Center(
                    //                   child: Icon(
                    //                 Icons.add,
                    //                 size: 15,
                    //               )),
                    //             ),
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "Follow up's",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
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
                                      selectdate =
                                          (onValue.toString()).substring(0, 10);
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
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            maxLines: 3,
                            controller: _comment_controller,
                            // expands: true,
                            // minLines: 5,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.message_outlined),
                              hintText: "Add comments here",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(196, 196, 196, 1)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          )),
                    ),

                    buildTextField(
                      label: 'Price',
                      hintText: 'Enter a Price',
                      controller: price,
                      icon: Icons.currency_rupee,
                    ),
                    SizedBox(
                      height: Provider.of<Med>(context, listen: false)
                                  .Add_med
                                  .length ==
                              0
                          ? 150
                          : Provider.of<Med>(context, listen: false)
                                      .Add_med
                                      .length ==
                                  1
                              ? 80
                              : 30,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          // popup = true;
                          // setState(() {});
                          showDialog(
                              context: context,
                              builder: (context) => confirmation_popup());
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
                              Image.asset("assets/img/upload_2.png"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ]),
            ),
          )),
    );
  }

  Widget buildTextField(
      {required String label,
      required String hintText,
      required TextEditingController controller,
      required IconData icon,
      ind}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        onChanged: (value) async {},
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.black,

          // label: Container(),
          // labelStyle: TextStyle(color: Colors.black),

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

  Widget custom_medical_store() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          // height: 1,
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          child: Column(
            children: [
              Container(
                height:
                    Provider.of<Med>(context, listen: false).Add_med.length == 0
                        ? 10
                        : Provider.of<Med>(context, listen: false)
                                    .Add_med
                                    .length ==
                                1
                            ? 50
                            : Provider.of<Med>(context, listen: false)
                                        .Add_med
                                        .length ==
                                    2
                                ? 100
                                : 100,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: Provider.of<Med>(
                            context,
                          ).Add_med.length,
                          shrinkWrap: true,
                          itemBuilder: (context, ind) {
                            return Column(
                              children: [
                                ListTile(
                                    trailing: Container(
                                      height: 20,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.blue.shade100),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              context.read<Med>().change_Subqty(
                                                  Provider.of<Med>(context,
                                                          listen: false)
                                                      .Add_med[ind]
                                                      .medid);
                                              context
                                                  .read<Med>()
                                                  .change_totprice();
                                              price.text = Provider.of<Med>(
                                                              context,
                                                              listen: false)
                                                          .tot_price
                                                          .toString() ==
                                                      "0"
                                                  ? "Price"
                                                  : Provider.of<Med>(context,
                                                          listen: false)
                                                      .tot_price
                                                      .toString();
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
                                            Provider.of<Med>(context,
                                                    listen: false)
                                                .Add_med[ind]
                                                .qty
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                          const Spacer(),
                                          InkWell(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              context.read<Med>().change_Addqty(
                                                  Provider.of<Med>(context,
                                                          listen: false)
                                                      .Add_med[ind]
                                                      .medid);
                                              context
                                                  .read<Med>()
                                                  .change_totprice();
                                              price.text = Provider.of<Med>(
                                                              context,
                                                              listen: false)
                                                          .tot_price
                                                          .toString() ==
                                                      "0"
                                                  ? "Price"
                                                  : Provider.of<Med>(context,
                                                          listen: false)
                                                      .tot_price
                                                      .toString();
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
                                    minTileHeight: 5,
                                    title: Text(
                                        Provider.of<Med>(context, listen: false)
                                            .Add_med[ind]
                                            .medname)),
                                Divider()
                              ],
                            );
                          }),
                    ],
                  ),
                ),
              ),
              Row(
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
            ],
          ),
        ));
  }

  Widget confirmation_popup() {
    return Dialog(
      // bottom: MediaQuery.of(context).size.height / 3,
      // left: MediaQuery.of(context).size.width / 7,
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
                            ),
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
                          Navigator.pop(context);
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
                      await Ai_enterdetails_start_api(context, widget.ticketid);

                      int count = 0;
                      await Appoimentresquestapi(
                          context,
                          Provider.of<userprofiledetails>(context,
                                  listen: false)
                              .doctor_id);
                      await Ai_enterdetails_Treamentdetails_api(
                          context,
                          widget.ticketid,
                          widget.farmerid,
                          widget.farmerid,
                          widget.docid,
                          selectdate == "Select date" ? 0 : 1,
                          _comment_controller.text,
                          price.text == "" ? "0" : price.text);

                      List med_res_lst = [];
                      for (int i = 0;
                          i <
                              Provider.of<Med>(context, listen: false)
                                  .Add_med
                                  .length;
                          i++) {
                        med_res_lst.add({
                          widget.ticketid,
                          Provider.of<Med>(context, listen: false)
                              .Add_med[i]
                              .qty
                        });
                      }
                      await Ai_enterdetails_MedicialList_api(
                          context, widget.ticketid, med_res_lst);
                      await Ai_enterdetails_end_api(context, widget.ticketid);
                      if (selectdate != "Select date") {
                        await Ai_enterdetails_Followup_api(
                            context, widget.ticketid, selectdate);
                        await Ai_enterdetails_end_api(context, widget.ticketid);
                        setState(() {});
                      }

                      setState(() {});

                      Navigator.popUntil(context, (route) => count++ == 3);
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
                    Navigator.pop(context);
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
