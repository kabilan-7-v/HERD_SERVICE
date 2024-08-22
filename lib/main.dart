import 'package:flutter/material.dart';
import 'package:herd_service/models/Notification_models.dart';
import 'package:herd_service/models/customercard.dart';
import 'package:herd_service/models/homemodel.dart';
import 'package:herd_service/models/loginmodels.dart';
import 'package:herd_service/pages/Loginpage.dart';
import 'package:herd_service/pages/no_internet.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:provider/provider.dart';

void main() {
  // Remember to cancel the subscription when it's no longer needed

  runApp(
    ChangeNotifierProvider(
      create: (context) => Login_email(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (create) => userprofiledetails()),
        ChangeNotifierProvider(create: (create) => Login_email()),
        ChangeNotifierProvider(create: (create) => Login_id()),
        ChangeNotifierProvider(create: (create) => Login_phone()),
        ChangeNotifierProvider(create: (create) => test()),
        ChangeNotifierProvider(create: (create) => NotifyModel()),
        ChangeNotifierProvider(create: (create) => service_availability()),
      ],
      child: MaterialApp(
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
        // home: const Commonpage(),
        home: const Loginpage(),
      ),
    );
  }
}
