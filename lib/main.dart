// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:herd_service/Local_data_user/doctor_details.dart';
import 'package:herd_service/models/Ai_enter_details.dart';
import 'package:herd_service/models/Notification_models.dart';
import 'package:herd_service/models/customercard.dart';
import 'package:herd_service/models/homemodel.dart';
import 'package:herd_service/models/loginmodels.dart';
import 'package:herd_service/pages/Loginpage.dart';
import 'package:herd_service/pages/addmorecows.dart';
import 'package:herd_service/pages/commonpage.dart';
import 'package:herd_service/server/home_api.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // Remember to cancel the subscription when it's no longer needed

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (create) => userprofiledetails()),
    ChangeNotifierProvider(create: (create) => Login_email()),
    ChangeNotifierProvider(create: (create) => Login_id()),
    ChangeNotifierProvider(create: (create) => Login_phone()),
    ChangeNotifierProvider(create: (create) => test()),
    ChangeNotifierProvider(create: (create) => NotifyModel()),
    ChangeNotifierProvider(create: (create) => service_availability()),
    ChangeNotifierProvider(create: (create) => Med_list()),
    ChangeNotifierProvider(create: (create) => Med()),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isLoggedIn;
  bool isLoading = true;
  bool canpop = false;
  @override
  void initState() {
    // TODO: implement initState
    _checkLoginStatus();

    // initializeData();

    super.initState();
  }

  // This widget is the root of your application.
  @override
  void dispose() {
    super.dispose();
  }

  Future<void> initializeData() async {
    await doctor_details_local_data(context);
    Appoimentresquestapi(context, 2);

    setState(() {});
  }

  _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    isLoading = false;
    setState(() {});
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Proxima Nova'),
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => const Loginpage(),
        //   // '/common': (context) => const Commonpage(),
        // },
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(0.9)),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        home: const Addmorecows(),
        // home: isLoading
        //     ? Scaffold(
        //         body: Center(
        //           child: CircularProgressIndicator(),
        //         ),
        //       )
        //     : isLoggedIn == true
        //         ? Commonpage()
        //         : Loginpage()
                );
  }
}
